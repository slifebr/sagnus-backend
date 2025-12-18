package com.slifesys.sagnus.nfe.infrastructure.outbox;

import com.slifesys.sagnus.nfe.application.config.NfeOutboxProperties;
import com.slifesys.sagnus.nfe.application.port.OutboxMessage;
import com.slifesys.sagnus.nfe.application.port.OutboxTransportPort;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeOutboxEventEntity;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository.NfeOutboxEventJpaRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.time.Instant;
import java.util.List;

@Slf4j
@Service
public class NfeOutboxService {

    private final NfeOutboxProperties props;
    private final NfeOutboxEventJpaRepository repo;
    private final OutboxTransportPort transport;

    private final String workerId;

    public NfeOutboxService(NfeOutboxProperties props,
                            NfeOutboxEventJpaRepository repo,
                            OutboxTransportPort transport) {
        this.props = props;
        this.repo = repo;
        this.transport = transport;
        this.workerId = buildWorkerId();
    }

    @Transactional
    public void dispatchOnce() {
        Instant now = Instant.now();
        Instant lockExpiry = now.minusSeconds(props.getLockTtlSeconds());

        List<NfeOutboxEventEntity> claimed = repo.claimDueEvents(workerId, props.getBatchSize(), now, lockExpiry);
        if (claimed.isEmpty()) {
            return;
        }

        log.debug("[OUTBOX] claimed {} eventos (worker={})", claimed.size(), workerId);

        for (NfeOutboxEventEntity row : claimed) {
            processOne(row, now);
        }
    }

    private void processOne(NfeOutboxEventEntity row, Instant now) {
        OutboxMessage msg = new OutboxMessage(
                row.getEventId(),
                row.getEventType(),
                row.getOccurredAt(),
                row.getCorrelationId(),
                row.getPayloadJson()
        );

        try {
            transport.send(msg);

            row.setStatus(NfeOutboxEventEntity.Status.SENT);
            row.setProcessedAt(Instant.now());
            row.setLockedAt(null);
            row.setLockedBy(null);
            row.setLastError(null);
            repo.save(row);

        } catch (Exception ex) {
            int nextAttempt = row.getAttemptCount() + 1;
            row.setAttemptCount(nextAttempt);

            String err = ex.getMessage();
            if (err == null) err = ex.getClass().getSimpleName();
            if (err.length() > 4000) err = err.substring(0, 4000);

            row.setLastError(err);
            row.setLockedAt(null);
            row.setLockedBy(null);

            if (nextAttempt >= props.getMaxAttempts()) {
                row.setStatus(NfeOutboxEventEntity.Status.DEAD);
                row.setProcessedAt(Instant.now());
                repo.save(row);

                log.error("[OUTBOX] DEAD: eventType={}, eventId={}, attempts={}, lastError={}",
                        row.getEventType(), row.getEventId(), nextAttempt, err);
                return;
            }

            long delayMs = computeBackoffMs(nextAttempt);
            row.setStatus(NfeOutboxEventEntity.Status.PENDING);
            row.setNextAttemptAt(now.plusMillis(delayMs));
            repo.save(row);

            log.warn("[OUTBOX] retry agendado: eventType={}, eventId={}, attempt={}, nextInMs={}, err={}",
                    row.getEventType(), row.getEventId(), nextAttempt, delayMs, err);
        }
    }

    private long computeBackoffMs(int attemptNumber) {
        // attemptNumber começa em 1
        double pow = Math.pow(props.getBackoffMultiplier(), Math.max(0, attemptNumber - 1));
        double raw = props.getBackoffInitialMs() * pow;
        long capped = (long) Math.min(raw, props.getBackoffMaxMs());
        return Math.max(capped, 0L);
    }

    private static String buildWorkerId() {
        String host = "unknown";
        try {
            host = InetAddress.getLocalHost().getHostName();
        } catch (Exception ignored) {
        }
        String pid = ManagementFactory.getRuntimeMXBean().getName(); // pid@host
        return host + "/" + pid;
    }
}

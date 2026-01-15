package com.slifesys.sagnus.nfe.infrastructure.event.spring;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.slifesys.sagnus.nfe.application.config.NfeOutboxProperties;
import com.slifesys.sagnus.shared.observability.CorrelationIdContext;
import com.slifesys.sagnus.shared.domain.event.CorrelatedDomainEvent;
import com.slifesys.sagnus.shared.domain.event.DomainEvent;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeOutboxEventEntity;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository.NfeOutboxEventJpaRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.time.Instant;

/**
 * Escreve DomainEvents na Outbox dentro da mesma transação.
 */
@Slf4j
@Component
@ConditionalOnProperty(prefix = "sagnus.nfe.outbox", name = "enabled", havingValue = "true", matchIfMissing = true)
public class DomainEventOutboxWriterListener {

    private final NfeOutboxEventJpaRepository repo;
    private final ObjectMapper objectMapper;
    private final NfeOutboxProperties props;

    public DomainEventOutboxWriterListener(NfeOutboxEventJpaRepository repo,
            ObjectMapper objectMapper,
            NfeOutboxProperties props) {
        this.repo = repo;
        this.objectMapper = objectMapper;
        this.props = props;
    }

    @EventListener
    public void on(DomainEvent event) {
        if (!props.isEnabled()) {
            return;
        }

        String correlationId = null;
        if (event instanceof CorrelatedDomainEvent cde) {
            correlationId = cde.getCorrelationId();
        }
        if (correlationId == null || correlationId.isBlank()) {
            correlationId = CorrelationIdContext.get();
        }

        String payload;
        try {
            payload = objectMapper.writeValueAsString(event);
        } catch (JsonProcessingException e) {
            payload = "{\"error\":\"payload_serialization_failed\",\"eventType\":\"" + event.getEventType() + "\"}";
            log.warn("[OUTBOX] falha ao serializar DomainEvent. eventType={}, eventId={}, correlationId={}",
                    event.getEventType(), event.getEventId(), correlationId, e);
        }

        Instant now = Instant.now();
        NfeOutboxEventEntity row = new NfeOutboxEventEntity();
        row.setEventId(event.getEventId());
        row.setEventType(event.getEventType());
        row.setOccurredAt(event.getOccurredAt());
        row.setCorrelationId(correlationId);
        row.setPayloadJson(payload);
        row.setStatus(NfeOutboxEventEntity.Status.PENDING);
        row.setAttemptCount(0);
        row.setNextAttemptAt(now);
        row.setCreatedAt(now);
        row.setUpdatedAt(now);

        try {
            repo.save(row);
        } catch (Exception ex) {
            // aqui é crítico: se falhar, a transação deve falhar (garante atomicidade)
            log.error("[OUTBOX] falha ao persistir outbox. eventType={}, eventId={}, correlationId={}",
                    event.getEventType(), event.getEventId(), correlationId, ex);
            throw ex;
        }
    }
}

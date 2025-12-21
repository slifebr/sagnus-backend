package com.slifesys.sagnus.nfe.infrastructure.outbox.inbox;

import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeInboxProcessedEntity;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository.NfeInboxProcessedJpaRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;

/**
 * Serviço de "Inbox" para idempotência do Worker.
 *
 * Observação: a constraint UNIQUE em event_id garante concorrência segura.
 */
@Slf4j
@Service
public class InboxIdempotencyService {

    private final NfeInboxProcessedJpaRepository repo;

    public InboxIdempotencyService(NfeInboxProcessedJpaRepository repo) {
        this.repo = repo;
    }

    @Transactional(readOnly = true)
    public boolean alreadyProcessed(String eventId) {
        if (eventId == null || eventId.isBlank()) {
            return false;
        }
        return repo.existsByEventId(eventId);
    }

    @Transactional
    public void markProcessed(String eventId, String eventType, String correlationId) {
        if (eventId == null || eventId.isBlank()) {
            throw new IllegalArgumentException("eventId é obrigatório para idempotência");
        }

        try {
            repo.save(new NfeInboxProcessedEntity(
                    eventId,
                    eventType == null ? "" : eventType,
                    correlationId,
                    Instant.now()
            ));
        } catch (DataIntegrityViolationException dup) {
            // já marcado por outro consumer/thread — ok
            log.debug("[INBOX] já marcado eventId={}, ignorando", eventId);
        }
    }
}

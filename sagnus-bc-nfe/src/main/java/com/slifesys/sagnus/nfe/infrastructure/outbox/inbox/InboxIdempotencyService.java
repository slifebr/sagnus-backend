package com.slifesys.sagnus.nfe.infrastructure.outbox.inbox;

import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeInboxProcessedEntity;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository.NfeInboxProcessedJpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;

/**
 * Serviço simples de "Inbox" para idempotência do Worker.
 */
@Service
public class InboxIdempotencyService {

    private final NfeInboxProcessedJpaRepository repo;

    public InboxIdempotencyService(NfeInboxProcessedJpaRepository repo) {
        this.repo = repo;
    }

    @Transactional(readOnly = true)
    public boolean alreadyProcessed(String eventId) {
        if (eventId == null || eventId.isBlank()) return false;
        return repo.existsById(eventId);
    }

    @Transactional
    public void markProcessed(String eventId, String eventType, String correlationId) {
        if (eventId == null || eventId.isBlank()) {
            throw new IllegalArgumentException("eventId é obrigatório para idempotência");
        }
        if (!repo.existsById(eventId)) {
            repo.save(new NfeInboxProcessedEntity(eventId, eventType == null ? "" : eventType,
                    correlationId, Instant.now()));
        }
    }
}

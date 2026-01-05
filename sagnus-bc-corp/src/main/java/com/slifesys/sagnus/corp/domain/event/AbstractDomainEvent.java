package com.slifesys.sagnus.corp.domain.event;

import java.time.Instant;
import java.util.UUID;

/**
 * Base para eventos de domínio do CORP.
 * Gera automaticamente eventId e occurredAt.
 */
public abstract class AbstractDomainEvent implements DomainEvent {

    private final String eventId;
    private final Instant occurredAt;

    protected AbstractDomainEvent() {
        this.eventId = UUID.randomUUID().toString().replace("-", "");
        this.occurredAt = Instant.now();
    }

    @Override
    public String getEventId() {
        return eventId;
    }

    @Override
    public Instant getOccurredAt() {
        return occurredAt;
    }

    @Override
    public String getEventType() {
        return getClass().getSimpleName();
    }
}

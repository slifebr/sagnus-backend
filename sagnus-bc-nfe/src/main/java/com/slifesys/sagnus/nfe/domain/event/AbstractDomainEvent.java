package com.slifesys.sagnus.nfe.domain.event;

import java.time.Instant;
import java.util.UUID;

/**
 * Base opcional para padronizar eventId + occurredAt.
 * <p>
 * Implementa o DomainEvent de forma completa,
 * de modo que as subclasses só precisem declarar seus próprios campos.
 */
public abstract class AbstractDomainEvent implements DomainEvent {

    private final String eventId;
    private final Instant occurredAt;

    protected AbstractDomainEvent() {
        this.eventId = UUID.randomUUID().toString().replace("-", "");
        this.occurredAt = Instant.now();
    }

    public String getEventId() {
        return eventId;
    }

    public Instant getOccurredAt() {
        return occurredAt;
    }

    public String getEventType() {
        return getClass().getSimpleName();
    }


}

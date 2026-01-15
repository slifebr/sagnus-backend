package com.slifesys.sagnus.shared.domain.event;

import java.time.Instant;
import java.util.UUID;

public abstract class AbstractDomainEvent implements DomainEvent {

    private final String eventId;
    private final Instant occurredOn;

    public AbstractDomainEvent() {
        this.eventId = UUID.randomUUID().toString();
        this.occurredOn = Instant.now();
    }

    @Override
    public String getEventId() {
        return eventId;
    }

    @Override
    public Instant getOccurredAt() {
        return occurredOn;
    }

    @Override
    public String getEventType() {
        return this.getClass().getSimpleName();
    }
}

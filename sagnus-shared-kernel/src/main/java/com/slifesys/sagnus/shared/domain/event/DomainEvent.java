package com.slifesys.sagnus.shared.domain.event;

import java.time.Instant;

public interface DomainEvent {

    String getEventId();

    Instant getOccurredAt();

    String getEventType();
}

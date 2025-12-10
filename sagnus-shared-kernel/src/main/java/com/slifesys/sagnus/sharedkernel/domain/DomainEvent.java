package com.slifesys.sagnus.sharedkernel.domain;

import java.time.Instant;

public interface DomainEvent {
    Instant occurredOn();
}

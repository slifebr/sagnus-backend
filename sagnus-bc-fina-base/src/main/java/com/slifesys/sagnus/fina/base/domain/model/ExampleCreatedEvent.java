package com.slifesys.sagnus.fina.base.domain.model;

import java.time.Instant;

public record ExampleCreatedEvent(
        String id,
        String nome,
        Instant occurredAt
) {}

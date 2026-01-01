package com.slifesys.sagnus.template.domain.model;

import java.time.Instant;

public record ExampleCreatedEvent(
        String id,
        String nome,
        Instant occurredAt
) {}

package com.slifesys.sagnus.sagnus-bc-estoque.domain.model;

import java.time.Instant;

public record ExampleCreatedEvent(
        String id,
        String nome,
        Instant occurredAt
) {}

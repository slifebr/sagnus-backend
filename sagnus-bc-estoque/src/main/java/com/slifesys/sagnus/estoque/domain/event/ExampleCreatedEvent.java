package com.slifesys.sagnus.estoque.domain.event;

import com.slifesys.sagnus.estoque.domain.model.ExampleId;

public record ExampleCreatedEvent(ExampleId id, String nome) {
}

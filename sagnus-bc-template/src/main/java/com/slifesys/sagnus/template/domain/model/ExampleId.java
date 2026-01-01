package com.slifesys.sagnus.template.domain.model;

import java.util.UUID;

/**
 * Value Object para identificar o Aggregate.
 * Evita vazar UUID/String “cru” para todo o código.
 */
public record ExampleId(String value) {

    public static ExampleId newId() {
        return new ExampleId(UUID.randomUUID().toString().replace("-", ""));
    }
}

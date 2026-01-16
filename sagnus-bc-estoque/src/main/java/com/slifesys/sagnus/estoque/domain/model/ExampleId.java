package com.slifesys.sagnus.estoque.domain.model;

public record ExampleId(String value) {
    public static ExampleId of(String value) {
        return new ExampleId(value);
    }
}

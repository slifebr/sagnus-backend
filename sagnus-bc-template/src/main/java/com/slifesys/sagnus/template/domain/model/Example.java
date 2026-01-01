package com.slifesys.sagnus.template.domain.model;

import com.slifesys.sagnus.template.domain.exception.ExampleDomainException;

import java.time.Instant;

public class Example {

    private final ExampleId id;
    private final String nome;
    private final Instant createdAt;

    private Example(ExampleId id, String nome, Instant createdAt) {
        this.id = id;
        this.nome = nome;
        this.createdAt = createdAt;
    }

    public static Example create(String nome) {
        if (nome == null || nome.isBlank()) {
            throw new ExampleDomainException("Nome é obrigatório.");
        }
        String n = nome.trim();
        if (n.length() > 80) {
            throw new ExampleDomainException("Nome excede 80 caracteres.");
        }
        return new Example(ExampleId.newId(), n, Instant.now());
    }

    public ExampleId id() {
        return id;
    }

    public String nome() {
        return nome;
    }

    public Instant createdAt() {
        return createdAt;
    }

    public ExampleCreatedEvent toCreatedEvent() {
        return new ExampleCreatedEvent(id.value(), nome, createdAt);
    }
}

package com.slifesys.sagnus.adm.domain.model;

import java.util.Objects;

public record CategoriaCompromisso(
        CategoriaId id,
        String nome,
        String cor,
        Audit audit
) {
    public CategoriaCompromisso {
        Objects.requireNonNull(nome, "nome");
        Objects.requireNonNull(audit, "audit");
    }
}

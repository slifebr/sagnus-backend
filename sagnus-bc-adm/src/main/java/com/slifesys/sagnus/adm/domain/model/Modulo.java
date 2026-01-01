package com.slifesys.sagnus.adm.domain.model;

import java.util.Objects;

public record Modulo(
        ModuloId id,
        String codigo,
        String nome,
        String descricao,
        Audit audit
) {
    public Modulo {
        Objects.requireNonNull(codigo, "codigo");
        Objects.requireNonNull(nome, "nome");
        Objects.requireNonNull(audit, "audit");
    }
}

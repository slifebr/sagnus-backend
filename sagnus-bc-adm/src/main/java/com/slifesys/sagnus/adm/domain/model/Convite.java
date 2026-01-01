package com.slifesys.sagnus.adm.domain.model;

import java.util.Objects;

public record Convite(Long colaboradorId) {
    public Convite {
        Objects.requireNonNull(colaboradorId, "colaboradorId");
        if (colaboradorId <= 0) {
            throw new IllegalArgumentException("colaboradorId inválido");
        }
    }
}

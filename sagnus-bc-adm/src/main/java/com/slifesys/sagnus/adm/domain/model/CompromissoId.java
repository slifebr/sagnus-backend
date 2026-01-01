package com.slifesys.sagnus.adm.domain.model;

public record CompromissoId(Long value) {
    public CompromissoId {
        if (value == null || value <= 0) {
            throw new IllegalArgumentException("CompromissoId inválido");
        }
    }
}

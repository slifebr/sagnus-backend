package com.slifesys.sagnus.adm.domain.model;

public record ModuloId(Long value) {
    public ModuloId {
        if (value == null || value <= 0) {
            throw new IllegalArgumentException("ModuloId inválido");
        }
    }
}

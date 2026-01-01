package com.slifesys.sagnus.adm.domain.model;

public record ParametroId(Long value) {
    public ParametroId {
        if (value == null || value <= 0) {
            throw new IllegalArgumentException("ParametroId inválido");
        }
    }
}

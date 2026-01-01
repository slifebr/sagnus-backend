package com.slifesys.sagnus.adm.domain.model;

public record CategoriaId(Long value) {
    public CategoriaId {
        if (value == null || value <= 0) {
            throw new IllegalArgumentException("CategoriaId inválido");
        }
    }
}

package com.slifesys.sagnus.adm.domain.model.modulo;

import lombok.Value;

public class ModuloId {
    private final Long value;

    private ModuloId(Long value) {
        this.value = value;
    }

    public static ModuloId of(Long value) {
        return new ModuloId(value);
    }

    public Long getValue() {
        return value;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ModuloId moduloId = (ModuloId) o;
        return value != null ? value.equals(moduloId.value) : moduloId.value == null;
    }

    @Override
    public int hashCode() {
        return value != null ? value.hashCode() : 0;
    }
}

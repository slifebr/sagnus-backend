package com.slifesys.sagnus.corp.domain.pessoa;

public enum PessoaTipo {
    F, // Física
    J; // Jurídica

    public static PessoaTipo fromDb(String value) {
        if (value == null) return null;
        return value.trim().equalsIgnoreCase("J") ? J : F;
    }

    public String toDb() {
        return this.name();
    }
}

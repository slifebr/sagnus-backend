package com.slifesys.sagnus.corp.domain.common;

public enum SimNao {
    S, N;

    public static SimNao fromDb(String value) {
        if (value == null) return null;
        return value.trim().equalsIgnoreCase("S") ? S : N;
    }

    public String toDb() {
        return this.name();
    }
}

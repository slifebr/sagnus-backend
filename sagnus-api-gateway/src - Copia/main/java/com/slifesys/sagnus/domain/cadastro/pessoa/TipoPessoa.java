package com.slifesys.sagnus.domain.cadastro.pessoa;

public enum TipoPessoa {
    FISICA,
    JURIDICA;

    public static TipoPessoa fromCodigo(String codigo) {
        if (codigo == null) {
            throw new IllegalArgumentException("Tipo de pessoa não pode ser nulo.");
        }
        return switch (codigo.toUpperCase()) {
            case "F" -> FISICA;
            case "J" -> JURIDICA;
            default -> throw new IllegalArgumentException("Tipo de pessoa inválido: " + codigo);
        };
    }

    public String toCodigo() {
        return switch (this) {
            case FISICA -> "F";
            case JURIDICA -> "J";
        };
    }
}

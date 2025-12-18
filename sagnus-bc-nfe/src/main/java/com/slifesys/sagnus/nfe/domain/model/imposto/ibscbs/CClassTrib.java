package com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs;

import java.util.regex.Pattern;

/**
 * cClassTrib (RTC) - 6 dígitos numéricos (ex.: 410031).
 */
public record CClassTrib(String codigo) {

    private static final Pattern P = Pattern.compile("\\d{6}");

    public CClassTrib {
        if (codigo == null || codigo.isBlank()) {
            throw new IllegalArgumentException("cClassTrib é obrigatório");
        }
        codigo = codigo.trim();
        if (!P.matcher(codigo).matches()) {
            throw new IllegalArgumentException("cClassTrib deve ter 6 dígitos numéricos (ex.: 410031)");
        }
    }

    public String getValor() {
        return codigo;
    }
}

package com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs;

import java.util.regex.Pattern;

/**
 * CST IBS/CBS (RTC) - 3 dígitos numéricos (ex.: 000, 200, 810).
 */
public record CstIbsCbs(String codigo) {

    private static final Pattern P = Pattern.compile("\\d{3}");

    public CstIbsCbs {
        if (codigo == null || codigo.isBlank()) {
            throw new IllegalArgumentException("CST IBS/CBS é obrigatório");
        }
        codigo = codigo.trim();
        if (!P.matcher(codigo).matches()) {
            throw new IllegalArgumentException("CST IBS/CBS deve ter 3 dígitos numéricos (ex.: 000, 200, 810)");
        }
    }

    public String getValor() {
        return codigo;
    }
}

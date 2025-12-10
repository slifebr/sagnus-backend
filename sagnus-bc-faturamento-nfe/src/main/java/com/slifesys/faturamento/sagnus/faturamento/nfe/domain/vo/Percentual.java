package com.slifesys.sagnus.faturamento.nfe.domain.vo;

import java.math.BigDecimal;
import java.util.Objects;

public final class Percentual {

    private final BigDecimal valor; // 0–100

    public Percentual(BigDecimal valor) {
        Objects.requireNonNull(valor);
        if (valor.compareTo(BigDecimal.ZERO) < 0 ||
                valor.compareTo(new BigDecimal("100")) > 0) {
            throw new IllegalArgumentException("Percentual deve estar entre 0 e 100");
        }
        this.valor = valor.setScale(4, BigDecimal.ROUND_HALF_UP);
    }

    public BigDecimal asFraction() {
        return valor.divide(new BigDecimal("100"), 8, BigDecimal.ROUND_HALF_UP);
    }

    public BigDecimal getValor() {
        return valor;
    }
}

package com.slifesys.sagnus.nfe.domain.model.fiscal;

import java.math.BigDecimal;
import java.math.RoundingMode;

public final class Percentual {
    private static final int SCALE = 4;
    private final BigDecimal value; // ex.: 17.0000

    private Percentual(BigDecimal value) {
        this.value = value.setScale(SCALE, RoundingMode.HALF_UP);
    }

    public static Percentual of(BigDecimal v) {
        if (v == null) throw new IllegalArgumentException("Percentual é obrigatório");
        if (v.signum() < 0) throw new IllegalArgumentException("Percentual não pode ser negativo");
        return new Percentual(v);
    }

    public BigDecimal getValue() {
        return value;
    }

    public BigDecimal asFator() { // 17% => 0.17
        return value.divide(BigDecimal.valueOf(100), 8, RoundingMode.HALF_UP);
    }
}

package com.slifesys.sagnus.nfe.domain.model.fiscal;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Objects;

public final class Quantidade {
    private static final int SCALE = 4;
    private final BigDecimal value;

    private Quantidade(BigDecimal value) {
        this.value = value.setScale(SCALE, RoundingMode.HALF_UP);
    }

    public static Quantidade of(BigDecimal v) {
        if (v == null) throw new IllegalArgumentException("Quantidade é obrigatória");
        if (v.signum() <= 0) throw new IllegalArgumentException("Quantidade deve ser > 0");
        return new Quantidade(v);
    }

    public BigDecimal getValue() {
        return value;
    }
    public BigDecimal getValor() {
        return value;
    }  // alias para value

    @Override
    public boolean equals(Object o) {
        return (o instanceof Quantidade q) && value.equals(q.value);
    }

    @Override
    public int hashCode() {
        return Objects.hash(value);
    }
}

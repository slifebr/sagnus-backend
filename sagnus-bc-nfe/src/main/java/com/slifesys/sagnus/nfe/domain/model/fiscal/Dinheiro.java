package com.slifesys.sagnus.nfe.domain.model.fiscal;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Objects;

public final class Dinheiro {
    private static final int SCALE = 2;
    private final BigDecimal value;

    private Dinheiro(BigDecimal value) {
        this.value = value.setScale(SCALE, RoundingMode.HALF_UP);
    }

    public static Dinheiro of(BigDecimal v) {
        if (v == null) throw new IllegalArgumentException("Valor monetário é obrigatório");
        if (v.signum() < 0) throw new IllegalArgumentException("Valor monetário não pode ser negativo");
        return new Dinheiro(v);
    }

    public static Dinheiro zero() {
        return new Dinheiro(BigDecimal.ZERO);
    }

    public BigDecimal getValue() {
        return value;
    }

    public Dinheiro add(Dinheiro other) {
        return Dinheiro.of(this.value.add(other.value));
    }

    public Dinheiro sub(Dinheiro other) {
        return Dinheiro.of(this.value.subtract(other.value));
    }

    public Dinheiro mul(BigDecimal fator) {
        if (fator == null) throw new IllegalArgumentException("Fator é obrigatório");
        return Dinheiro.of(this.value.multiply(fator));
    }

    @Override
    public boolean equals(Object o) {
        return (o instanceof Dinheiro d) && value.equals(d.value);
    }

    @Override
    public int hashCode() {
        return Objects.hash(value);
    }

    @Override
    public String toString() {
        return value.toPlainString();
    }
}

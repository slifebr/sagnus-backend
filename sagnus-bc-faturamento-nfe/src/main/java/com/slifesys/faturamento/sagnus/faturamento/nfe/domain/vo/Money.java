package com.slifesys.sagnus.faturamento.nfe.domain.vo;

import java.math.BigDecimal;
import java.util.Objects;

public final class Money {

    private final BigDecimal amount;
    private final String currency; // "BRL"

    public static Money of(BigDecimal amount) {
        return new Money(amount, "BRL");
    }

    public static Money zero() {
        return new Money(BigDecimal.ZERO, "BRL");
    }

    public Money(BigDecimal amount, String currency) {
        Objects.requireNonNull(amount);
        Objects.requireNonNull(currency);

        if (amount.scale() > 2) {
            amount = amount.setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        this.amount = amount;
        this.currency = currency;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public String getCurrency() {
        return currency;
    }

    public Money add(Money other) {
        assertSameCurrency(other);
        return new Money(this.amount.add(other.amount), this.currency);
    }

    public Money subtract(Money other) {
        assertSameCurrency(other);
        return new Money(this.amount.subtract(other.amount), this.currency);
    }

    public Money multiply(BigDecimal multiplier) {
        return new Money(this.amount.multiply(multiplier), this.currency);
    }

    private void assertSameCurrency(Money other) {
        if (!this.currency.equals(other.currency)) {
            throw new IllegalArgumentException("Currencies must match");
        }
    }
}

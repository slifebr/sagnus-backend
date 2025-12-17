package com.slifesys.sagnus.nfe.domain.model.imposto;


import com.slifesys.sagnus.nfe.domain.model.fiscal.Dinheiro;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Percentual;

public record Ipi(String cst, Percentual aliquota, Dinheiro base, Dinheiro valor) {
    public Ipi {
        if (cst == null || cst.isBlank()) throw new IllegalArgumentException("CST IPI é obrigatório");
        if (aliquota == null) aliquota = Percentual.of(java.math.BigDecimal.ZERO);
        if (base == null) base = Dinheiro.zero();
        if (valor == null) valor = Dinheiro.zero();
    }
}


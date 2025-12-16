package com.slifesys.sagnus.nfe.domain.model.imposto;

import com.slifesys.sagnus.nfe.domain.model.fiscal.Dinheiro;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Percentual;

public final class Icms {
    private final String cst;           // ex: "00", "20", "40", "60" etc.
    private final Percentual aliquota; // pICMS
    private final Dinheiro base;        // vBC
    private final Dinheiro valor;       // vICMS

    public Icms(String cst, Percentual aliquota, Dinheiro base, Dinheiro valor) {
        if (cst == null || cst.isBlank()) throw new IllegalArgumentException("CST ICMS é obrigatório");
        this.cst = cst;
        this.aliquota = aliquota != null ? aliquota : Percentual.of(java.math.BigDecimal.ZERO);
        this.base = base != null ? base : Dinheiro.zero();
        this.valor = valor != null ? valor : Dinheiro.zero();
    }

    public String getCst(){ return cst; }
    public Percentual getAliquota(){ return aliquota; }
    public Dinheiro getBase(){ return base; }
    public Dinheiro getValor(){ return valor; }
}

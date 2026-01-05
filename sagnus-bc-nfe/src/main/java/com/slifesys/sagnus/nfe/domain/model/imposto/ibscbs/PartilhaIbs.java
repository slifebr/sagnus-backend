package com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs;

import java.math.BigDecimal;

public record PartilhaIbs(
        BigDecimal ibsUf,
        BigDecimal ibsMun
) {
    public PartilhaIbs {
        if (ibsUf == null || ibsMun == null) {
            throw new IllegalArgumentException("Partilha IBS: ibsUf/ibsMun sÃ£o obrigatÃ³rios");
        }
        if (ibsUf.signum() < 0 || ibsMun.signum() < 0) {
            throw new IllegalArgumentException("Partilha IBS nÃ£o pode ter valor negativo");
        }
    }

    public BigDecimal total() {
        return ibsUf.add(ibsMun);
    }
}
package com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs;

import java.math.BigDecimal;
import java.util.Optional;

public record Ibs(
        BigDecimal base,
        BigDecimal aliquota,
        BigDecimal valor,
        RegimeIbsCbs regime,
        Optional<PartilhaIbs> partilha,
        Optional<CreditoIbsCbs> credito
) {
    public Ibs {
        if (base == null || aliquota == null || valor == null || regime == null) {
            throw new IllegalArgumentException("IBS: base/aliquota/valor/regime sÃ£o obrigatÃ³rios");
        }
        if (base.signum() < 0 || aliquota.signum() < 0 || valor.signum() < 0) {
            throw new IllegalArgumentException("IBS nÃ£o pode ter valor negativo");
        }
        partilha = partilha == null ? Optional.empty() : partilha;
        credito  = credito  == null ? Optional.empty() : credito;
    }
}
package com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs;

import java.math.BigDecimal;
import java.util.Optional;

public record Cbs(
        BigDecimal base,
        BigDecimal aliquota,
        BigDecimal valor,
        RegimeIbsCbs regime,
        Optional<CreditoIbsCbs> credito
) {
    public Cbs {
        if (base == null || aliquota == null || valor == null || regime == null) {
            throw new IllegalArgumentException("CBS: base/aliquota/valor/regime sÃ£o obrigatÃ³rios");
        }
        if (base.signum() < 0 || aliquota.signum() < 0 || valor.signum() < 0) {
            throw new IllegalArgumentException("CBS nÃ£o pode ter valor negativo");
        }
        credito = credito == null ? Optional.empty() : credito;
    }
}
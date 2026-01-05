package com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs;

import java.math.BigDecimal;

public record CreditoIbsCbs(BigDecimal base, BigDecimal aliquota, BigDecimal valor) {

    public CreditoIbsCbs {
        if (base == null || aliquota == null || valor == null) {
            throw new IllegalArgumentException("CrÃ©dito IBS/CBS: base/aliquota/valor sÃ£o obrigatÃ³rios");
        }
        if (base.signum() < 0 || aliquota.signum() < 0 || valor.signum() < 0) {
            throw new IllegalArgumentException("CrÃ©dito IBS/CBS nÃ£o pode ser negativo");
        }
    }
}
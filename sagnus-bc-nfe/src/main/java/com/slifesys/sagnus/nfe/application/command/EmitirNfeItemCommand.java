package com.slifesys.sagnus.nfe.application.command;

import lombok.Builder;
import lombok.Value;

import java.math.BigDecimal;

@Value
@Builder
public class EmitirNfeItemCommand {
    int nItem;

    Long produtoId;
    String descricao;
    String ncm;      // 8 dígitos
    String cfop;     // 4 dígitos
    String uCom;

    BigDecimal quantidade;
    BigDecimal valorUnitario;

    BigDecimal desconto;
    BigDecimal frete;
    BigDecimal seguro;
    BigDecimal outras;

    // (futuro) CST/aliquotas/benefícios fiscais etc.
}

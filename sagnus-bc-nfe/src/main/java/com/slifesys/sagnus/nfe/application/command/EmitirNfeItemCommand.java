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

    // ===== RTC (IBS/CBS) - MVP =====
    // Se preencher IBS/CBS, preencha pelo menos base/aliquota/valor. Regime pode ser omitido (default REGULAR).
    String cstIbsCbs;      // 3 dígitos (ex.: 000)
    String cClassTrib;     // 6 dígitos (ex.: 410031)

    BigDecimal ibsBase;
    BigDecimal ibsAliquota;
    BigDecimal ibsValor;

    BigDecimal cbsBase;
    BigDecimal cbsAliquota;
    BigDecimal cbsValor;

    String regimeIbsCbs;   // enum name: REGULAR, ISENCAO, ...
}

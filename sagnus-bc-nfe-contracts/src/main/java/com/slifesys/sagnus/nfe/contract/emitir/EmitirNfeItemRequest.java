package com.slifesys.sagnus.nfe.contract.emitir;

import lombok.Builder;
import lombok.Value;

import java.math.BigDecimal;

@Value
@Builder
public class EmitirNfeItemRequest {
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
    String cstIbsCbs;      // 3 dígitos
    String cClassTrib;     // 6 dígitos

    BigDecimal ibsBase;
    BigDecimal ibsAliquota;
    BigDecimal ibsValor;

    BigDecimal cbsBase;
    BigDecimal cbsAliquota;
    BigDecimal cbsValor;

    String regimeIbsCbs;   // enum name
}

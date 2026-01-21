package com.slifesys.sagnus.corp.contract.vendedor;

import lombok.Builder;
import lombok.Value;

import java.math.BigDecimal;

@Value
@Builder
public class VendedorDTO {
    Long id;
    Long idPessoa;
    BigDecimal comissao;
    BigDecimal meta;
}

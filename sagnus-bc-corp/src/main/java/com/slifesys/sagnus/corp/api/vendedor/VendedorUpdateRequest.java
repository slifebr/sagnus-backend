package com.slifesys.sagnus.corp.api.vendedor;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class VendedorUpdateRequest {
    private Long idPessoa;
    private BigDecimal comissao;
    private BigDecimal meta;
}

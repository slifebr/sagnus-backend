package com.slifesys.sagnus.corp.api.vendedor;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.math.BigDecimal;

@Getter
@Builder
@AllArgsConstructor
public class VendedorResponse {
    private Long id;
    private Long idPessoa;
    private BigDecimal comissao;
    private BigDecimal meta;
}

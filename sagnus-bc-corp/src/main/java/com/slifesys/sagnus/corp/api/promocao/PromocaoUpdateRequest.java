package com.slifesys.sagnus.corp.api.promocao;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
public class PromocaoUpdateRequest {
    private Long idProduto;
    private LocalDate dataInicio;
    private LocalDate dataFim;
    private BigDecimal precoPromocional;
}

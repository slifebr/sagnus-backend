package com.slifesys.sagnus.corp.api.tabelapreco;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
public class TabelaPrecoUpdateRequest {
    private String nome;
    private LocalDate dataInicio;
    private LocalDate dataFim;
    private BigDecimal coeficiente;
}

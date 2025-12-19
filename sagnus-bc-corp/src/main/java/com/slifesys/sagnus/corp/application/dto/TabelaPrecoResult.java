package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.tabelapreco.TabelaPreco;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class TabelaPrecoResult {
    private Long id;
    private String nome;
    private LocalDate dataInicio;
    private LocalDate dataFim;
    private BigDecimal coeficiente;

    public static TabelaPrecoResult from(TabelaPreco tabelaPreco) {
        return new TabelaPrecoResult(
                tabelaPreco.getId(),
                tabelaPreco.getNome(),
                tabelaPreco.getDataInicio(),
                tabelaPreco.getDataFim(),
                tabelaPreco.getCoeficiente());
    }
}

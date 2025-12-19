package com.slifesys.sagnus.corp.application.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@AllArgsConstructor
public class CadastrarTabelaPrecoCommand {
    private String nome;
    private LocalDate dataInicio;
    private LocalDate dataFim;
    private BigDecimal coeficiente;
    private String usuCriacao;
}

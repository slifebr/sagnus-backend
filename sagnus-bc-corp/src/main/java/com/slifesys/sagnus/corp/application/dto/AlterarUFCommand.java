package com.slifesys.sagnus.corp.application.dto;

import lombok.Builder;
import lombok.Getter;

import java.math.BigDecimal;

@Getter
@Builder
public class AlterarUFCommand {
    private Long id;
    private String sigla;
    private String nome;
    private BigDecimal icmsInterno;
    private BigDecimal icmsInterestadual;
    private String usuAlteracao;
}

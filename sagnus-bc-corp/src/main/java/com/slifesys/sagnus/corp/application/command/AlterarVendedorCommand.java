package com.slifesys.sagnus.corp.application.command;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.math.BigDecimal;

@Getter
@AllArgsConstructor
public class AlterarVendedorCommand {
    private Long id;
    private Long idPessoa;
    private BigDecimal comissao;
    private BigDecimal meta;
    private String usuAlteracao;
}

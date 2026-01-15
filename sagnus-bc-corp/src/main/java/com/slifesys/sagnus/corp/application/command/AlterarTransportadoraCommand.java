package com.slifesys.sagnus.corp.application.command;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AlterarTransportadoraCommand {
    private Long id;
    private Long idPessoa;
    private String placaVeiculo;
    private String rntc;
    private String usuAlteracao;
}

package com.slifesys.sagnus.corp.application.command;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CadastrarTransportadoraCommand {
    private Long idPessoa;
    private String placaVeiculo;
    private String rntc;
    private String usuCriacao;
}

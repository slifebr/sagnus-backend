package com.slifesys.sagnus.corp.application.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class CadastrarTipoRelacionamentoCommand {
    private String nome;
    private String descricao;
    private String usuCriacao;
}

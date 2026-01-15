package com.slifesys.sagnus.corp.application.command;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class CadastrarUnidadeCommand {
    private String sigla;
    private String nome;
    private String descricao;
    private String usuCriacao;
}

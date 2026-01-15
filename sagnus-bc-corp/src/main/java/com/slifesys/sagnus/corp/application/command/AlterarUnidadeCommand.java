package com.slifesys.sagnus.corp.application.command;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class AlterarUnidadeCommand {
    private Long id;
    private String sigla;
    private String nome;
    private String descricao;
    private String usuAlteracao;
}

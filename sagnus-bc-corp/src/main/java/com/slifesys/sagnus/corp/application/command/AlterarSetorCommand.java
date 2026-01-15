package com.slifesys.sagnus.corp.application.command;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class AlterarSetorCommand {
    private Long id;
    private String nome;
    private String descricao;
    private String usuAlteracao;
}

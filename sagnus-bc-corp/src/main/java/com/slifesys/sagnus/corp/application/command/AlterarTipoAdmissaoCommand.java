package com.slifesys.sagnus.corp.application.command;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class AlterarTipoAdmissaoCommand {
    private Long id;
    private String codigo;
    private String nome;
    private String descricao;
    private String usuAlteracao;
}

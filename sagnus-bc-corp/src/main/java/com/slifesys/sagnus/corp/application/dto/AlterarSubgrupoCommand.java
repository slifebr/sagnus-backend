package com.slifesys.sagnus.corp.application.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AlterarSubgrupoCommand {
    private Long id;
    private Long idGrupo;
    private String nome;
    private String descricao;
    private String usuAlteracao;
}

package com.slifesys.sagnus.corp.application.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CadastrarSubgrupoCommand {
    private Long idGrupo;
    private String nome;
    private String descricao;
    private String usuCriacao;
}

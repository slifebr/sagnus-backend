package com.slifesys.sagnus.corp.api.subgrupo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class SubgrupoResponse {
    private Long id;
    private Long idGrupo;
    private String nome;
    private String descricao;
}

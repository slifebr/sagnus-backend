package com.slifesys.sagnus.corp.api.subgrupo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SubgrupoUpdateRequest {
    private Long idGrupo;
    private String nome;
    private String descricao;
}

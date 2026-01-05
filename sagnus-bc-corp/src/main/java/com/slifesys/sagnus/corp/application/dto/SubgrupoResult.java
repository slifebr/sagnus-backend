package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.subgrupo.Subgrupo;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class SubgrupoResult {
    private Long id;
    private Long idGrupo;
    private String nome;
    private String descricao;

    public static SubgrupoResult from(Subgrupo subgrupo) {
        return new SubgrupoResult(
                subgrupo.getId(),
                subgrupo.getIdGrupo(),
                subgrupo.getNome(),
                subgrupo.getDescricao());
    }
}

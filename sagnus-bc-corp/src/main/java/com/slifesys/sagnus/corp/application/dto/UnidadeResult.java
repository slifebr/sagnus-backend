package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.unidade.Unidade;
import lombok.Builder;
import lombok.Getter;

import java.time.Instant;

@Getter
@Builder
public class UnidadeResult {
    private Long id;
    private String sigla;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public static UnidadeResult from(Unidade unidade) {
        if (unidade == null)
            return null;
        return UnidadeResult.builder()
                .id(unidade.getId())
                .sigla(unidade.getSigla())
                .nome(unidade.getNome())
                .descricao(unidade.getDescricao())
                .criadoEm(unidade.getCriadoEm())
                .usuCriacao(unidade.getUsuCriacao())
                .atualizadoEm(unidade.getAtualizadoEm())
                .usuAlteracao(unidade.getUsuAlteracao())
                .build();
    }
}

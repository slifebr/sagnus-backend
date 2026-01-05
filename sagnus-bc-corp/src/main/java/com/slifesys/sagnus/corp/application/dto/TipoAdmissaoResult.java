package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.tipoadmissao.TipoAdmissao;
import lombok.Builder;
import lombok.Getter;

import java.time.Instant;

@Getter
@Builder
public class TipoAdmissaoResult {
    private Long id;
    private String codigo;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public static TipoAdmissaoResult from(TipoAdmissao tipoAdmissao) {
        if (tipoAdmissao == null)
            return null;
        return TipoAdmissaoResult.builder()
                .id(tipoAdmissao.getId())
                .codigo(tipoAdmissao.getCodigo())
                .nome(tipoAdmissao.getNome())
                .descricao(tipoAdmissao.getDescricao())
                .criadoEm(tipoAdmissao.getCriadoEm())
                .usuCriacao(tipoAdmissao.getUsuCriacao())
                .atualizadoEm(tipoAdmissao.getAtualizadoEm())
                .usuAlteracao(tipoAdmissao.getUsuAlteracao())
                .build();
    }
}

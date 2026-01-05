package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.setor.Setor;
import lombok.Builder;
import lombok.Getter;

import java.time.Instant;

@Getter
@Builder
public class SetorResult {
    private Long id;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public static SetorResult from(Setor setor) {
        if (setor == null)
            return null;
        return SetorResult.builder()
                .id(setor.getId())
                .nome(setor.getNome())
                .descricao(setor.getDescricao())
                .criadoEm(setor.getCriadoEm())
                .usuCriacao(setor.getUsuCriacao())
                .atualizadoEm(setor.getAtualizadoEm())
                .usuAlteracao(setor.getUsuAlteracao())
                .build();
    }
}

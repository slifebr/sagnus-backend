package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.tiporelacionamento.TipoRelacionamento;
import lombok.Builder;
import lombok.Getter;

import java.time.Instant;

@Getter
@Builder
public class TipoRelacionamentoResult {
    private Long id;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public static TipoRelacionamentoResult from(TipoRelacionamento tipoRelacionamento) {
        if (tipoRelacionamento == null)
            return null;
        return TipoRelacionamentoResult.builder()
                .id(tipoRelacionamento.getId())
                .nome(tipoRelacionamento.getNome())
                .descricao(tipoRelacionamento.getDescricao())
                .criadoEm(tipoRelacionamento.getCriadoEm())
                .usuCriacao(tipoRelacionamento.getUsuCriacao())
                .atualizadoEm(tipoRelacionamento.getAtualizadoEm())
                .usuAlteracao(tipoRelacionamento.getUsuAlteracao())
                .build();
    }
}

package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.marca.Marca;
import lombok.Builder;
import lombok.Getter;

import java.time.Instant;

@Getter
@Builder
public class MarcaResult {
    private Long id;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public static MarcaResult from(Marca marca) {
        if (marca == null)
            return null;
        return MarcaResult.builder()
                .id(marca.getId())
                .nome(marca.getNome())
                .descricao(marca.getDescricao())
                .criadoEm(marca.getCriadoEm())
                .usuCriacao(marca.getUsuCriacao())
                .atualizadoEm(marca.getAtualizadoEm())
                .usuAlteracao(marca.getUsuAlteracao())
                .build();
    }
}

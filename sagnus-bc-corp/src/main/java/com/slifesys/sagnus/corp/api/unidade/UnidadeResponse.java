package com.slifesys.sagnus.corp.api.unidade;

import com.slifesys.sagnus.corp.application.dto.UnidadeResult;
import lombok.Builder;
import lombok.Data;

import java.time.Instant;

@Data
@Builder
public class UnidadeResponse {
    private Long id;
    private String sigla;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private Instant atualizadoEm;

    public static UnidadeResponse from(UnidadeResult result) {
        if (result == null)
            return null;
        return UnidadeResponse.builder()
                .id(result.getId())
                .sigla(result.getSigla())
                .nome(result.getNome())
                .descricao(result.getDescricao())
                .criadoEm(result.getCriadoEm())
                .atualizadoEm(result.getAtualizadoEm())
                .build();
    }
}

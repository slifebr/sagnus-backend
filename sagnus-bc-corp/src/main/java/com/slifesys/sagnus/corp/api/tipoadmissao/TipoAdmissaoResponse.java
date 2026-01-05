package com.slifesys.sagnus.corp.api.tipoadmissao;

import com.slifesys.sagnus.corp.application.dto.TipoAdmissaoResult;
import lombok.Builder;
import lombok.Data;

import java.time.Instant;

@Data
@Builder
public class TipoAdmissaoResponse {
    private Long id;
    private String codigo;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private Instant atualizadoEm;

    public static TipoAdmissaoResponse from(TipoAdmissaoResult result) {
        if (result == null)
            return null;
        return TipoAdmissaoResponse.builder()
                .id(result.getId())
                .codigo(result.getCodigo())
                .nome(result.getNome())
                .descricao(result.getDescricao())
                .criadoEm(result.getCriadoEm())
                .atualizadoEm(result.getAtualizadoEm())
                .build();
    }
}

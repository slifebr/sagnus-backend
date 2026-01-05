package com.slifesys.sagnus.corp.api.marca;

import com.slifesys.sagnus.corp.application.dto.MarcaResult;
import lombok.Builder;
import lombok.Data;

import java.time.Instant;

@Data
@Builder
public class MarcaResponse {
    private Long id;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private Instant atualizadoEm;

    public static MarcaResponse from(MarcaResult result) {
        if (result == null)
            return null;
        return MarcaResponse.builder()
                .id(result.getId())
                .nome(result.getNome())
                .descricao(result.getDescricao())
                .criadoEm(result.getCriadoEm())
                .atualizadoEm(result.getAtualizadoEm())
                .build();
    }
}

package com.slifesys.sagnus.corp.api.setor;

import com.slifesys.sagnus.corp.application.dto.SetorResult;
import lombok.Builder;
import lombok.Data;

import java.time.Instant;

@Data
@Builder
public class SetorResponse {
    private Long id;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private Instant atualizadoEm;

    public static SetorResponse from(SetorResult result) {
        if (result == null)
            return null;
        return SetorResponse.builder()
                .id(result.getId())
                .nome(result.getNome())
                .descricao(result.getDescricao())
                .criadoEm(result.getCriadoEm())
                .atualizadoEm(result.getAtualizadoEm())
                .build();
    }
}

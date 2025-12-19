package com.slifesys.sagnus.corp.api.tiporelacionamento;

import com.slifesys.sagnus.corp.application.dto.TipoRelacionamentoResult;
import lombok.Builder;
import lombok.Data;

import java.time.Instant;

@Data
@Builder
public class TipoRelacionamentoResponse {
    private Long id;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private Instant atualizadoEm;

    public static TipoRelacionamentoResponse from(TipoRelacionamentoResult result) {
        if (result == null)
            return null;
        return TipoRelacionamentoResponse.builder()
                .id(result.getId())
                .nome(result.getNome())
                .descricao(result.getDescricao())
                .criadoEm(result.getCriadoEm())
                .atualizadoEm(result.getAtualizadoEm())
                .build();
    }
}

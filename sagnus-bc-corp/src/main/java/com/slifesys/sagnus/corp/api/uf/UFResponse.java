package com.slifesys.sagnus.corp.api.uf;

import com.slifesys.sagnus.corp.application.dto.UFResult;
import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.Instant;

@Data
@Builder
public class UFResponse {
    private Long id;
    private String sigla;
    private String nome;
    private BigDecimal icmsInterno;
    private BigDecimal icmsInterestadual;
    private Instant criadoEm;
    private Instant atualizadoEm;

    public static UFResponse from(UFResult result) {
        if (result == null)
            return null;
        return UFResponse.builder()
                .id(result.getId())
                .sigla(result.getSigla())
                .nome(result.getNome())
                .icmsInterno(result.getIcmsInterno())
                .icmsInterestadual(result.getIcmsInterestadual())
                .criadoEm(result.getCriadoEm())
                .atualizadoEm(result.getAtualizadoEm())
                .build();
    }
}

package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.uf.UF;
import lombok.Builder;
import lombok.Getter;

import java.math.BigDecimal;
import java.time.Instant;

@Getter
@Builder
public class UFResult {
    private Long id;
    private String sigla;
    private String nome;
    private BigDecimal icmsInterno;
    private BigDecimal icmsInterestadual;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public static UFResult from(UF uf) {
        if (uf == null)
            return null;
        return UFResult.builder()
                .id(uf.getId())
                .sigla(uf.getSigla())
                .nome(uf.getNome())
                .icmsInterno(uf.getIcmsInterno())
                .icmsInterestadual(uf.getIcmsInterestadual())
                .criadoEm(uf.getCriadoEm())
                .usuCriacao(uf.getUsuCriacao())
                .atualizadoEm(uf.getAtualizadoEm())
                .usuAlteracao(uf.getUsuAlteracao())
                .build();
    }
}

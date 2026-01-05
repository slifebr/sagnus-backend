package com.slifesys.sagnus.corp.domain.model.uf;

import lombok.Getter;

import java.math.BigDecimal;
import java.time.Instant;

@Getter
public class UF {
    private Long id;
    private String sigla;
    private String nome;
    private BigDecimal icmsInterno;
    private BigDecimal icmsInterestadual;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public UF(Long id, String sigla, String nome, BigDecimal icmsInterno, BigDecimal icmsInterestadual,
            Instant criadoEm, String usuCriacao, Instant atualizadoEm, String usuAlteracao) {
        this.id = id;
        this.sigla = sigla;
        this.nome = nome;
        this.icmsInterno = icmsInterno;
        this.icmsInterestadual = icmsInterestadual;
        this.criadoEm = criadoEm;
        this.usuCriacao = usuCriacao;
        this.atualizadoEm = atualizadoEm;
        this.usuAlteracao = usuAlteracao;
    }

    public UF(String sigla, String nome, BigDecimal icmsInterno, BigDecimal icmsInterestadual, String usuCriacao) {
        this.sigla = sigla;
        this.nome = nome;
        this.icmsInterno = icmsInterno;
        this.icmsInterestadual = icmsInterestadual;
        this.criadoEm = Instant.now();
        this.usuCriacao = usuCriacao;
    }
}

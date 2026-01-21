package com.slifesys.sagnus.corp.domain.model.transportadora;

import java.time.Instant;

public class Transportadora {
    private Long id;
    private Long idPessoa; // Reference to Pessoa aggregate
    private String placaVeiculo;
    private String rntc;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public Transportadora(Long id, Long idPessoa, String placaVeiculo, String rntc, Instant criadoEm, String usuCriacao,
                          Instant atualizadoEm, String usuAlteracao) {
        this.id = id;
        this.idPessoa = idPessoa;
        this.placaVeiculo = placaVeiculo;
        this.rntc = rntc;
        this.criadoEm = criadoEm;
        this.usuCriacao = usuCriacao;
        this.atualizadoEm = atualizadoEm;
        this.usuAlteracao = usuAlteracao;
    }

    public Transportadora(Long idPessoa, String placaVeiculo, String rntc, String usuCriacao) {
        this.idPessoa = idPessoa;
        this.placaVeiculo = placaVeiculo;
        this.rntc = rntc;
        this.criadoEm = Instant.now();
        this.usuCriacao = usuCriacao;
    }

    public Long getId() {
        return id;
    }

    public Long getIdPessoa() {
        return idPessoa;
    }

    public String getPlacaVeiculo() {
        return placaVeiculo;
    }

    public String getRntc() {
        return rntc;
    }

    public Instant getCriadoEm() {
        return criadoEm;
    }

    public String getUsuCriacao() {
        return usuCriacao;
    }

    public Instant getAtualizadoEm() {
        return atualizadoEm;
    }

    public String getUsuAlteracao() {
        return usuAlteracao;
    }
}

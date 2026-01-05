package com.slifesys.sagnus.corp.domain.model.transportadora;

import lombok.Getter;

import java.time.Instant;

@Getter
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
}

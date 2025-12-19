package com.slifesys.sagnus.corp.domain.model.unidade;

import lombok.Getter;

import java.time.Instant;

@Getter
public class Unidade {
    private Long id;
    private String sigla;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public Unidade(Long id, String sigla, String nome, String descricao, Instant criadoEm, String usuCriacao,
            Instant atualizadoEm, String usuAlteracao) {
        this.id = id;
        this.sigla = sigla;
        this.nome = nome;
        this.descricao = descricao;
        this.criadoEm = criadoEm;
        this.usuCriacao = usuCriacao;
        this.atualizadoEm = atualizadoEm;
        this.usuAlteracao = usuAlteracao;
    }

    public Unidade(String sigla, String nome, String descricao, String usuCriacao) {
        this.sigla = sigla;
        this.nome = nome;
        this.descricao = descricao;
        this.criadoEm = Instant.now();
        this.usuCriacao = usuCriacao;
    }
}

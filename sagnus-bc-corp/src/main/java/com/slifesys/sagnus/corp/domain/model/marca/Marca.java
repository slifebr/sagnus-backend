package com.slifesys.sagnus.corp.domain.model.marca;

import lombok.Getter;

import java.time.Instant;

@Getter
public class Marca {
    private Long id;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public Marca(Long id, String nome, String descricao, Instant criadoEm, String usuCriacao, Instant atualizadoEm,
            String usuAlteracao) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.criadoEm = criadoEm;
        this.usuCriacao = usuCriacao;
        this.atualizadoEm = atualizadoEm;
        this.usuAlteracao = usuAlteracao;
    }

    // Constructor for creation
    public Marca(String nome, String descricao, String usuCriacao) {
        this.nome = nome;
        this.descricao = descricao;
        this.criadoEm = Instant.now();
        this.usuCriacao = usuCriacao;
    }
}

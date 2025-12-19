package com.slifesys.sagnus.corp.domain.model.tipoadmissao;

import lombok.Getter;

import java.time.Instant;

@Getter
public class TipoAdmissao {
    private Long id;
    private String codigo;
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public TipoAdmissao(Long id, String codigo, String nome, String descricao, Instant criadoEm, String usuCriacao,
            Instant atualizadoEm, String usuAlteracao) {
        this.id = id;
        this.codigo = codigo;
        this.nome = nome;
        this.descricao = descricao;
        this.criadoEm = criadoEm;
        this.usuCriacao = usuCriacao;
        this.atualizadoEm = atualizadoEm;
        this.usuAlteracao = usuAlteracao;
    }

    public TipoAdmissao(String codigo, String nome, String descricao, String usuCriacao) {
        this.codigo = codigo;
        this.nome = nome;
        this.descricao = descricao;
        this.criadoEm = Instant.now();
        this.usuCriacao = usuCriacao;
    }
}

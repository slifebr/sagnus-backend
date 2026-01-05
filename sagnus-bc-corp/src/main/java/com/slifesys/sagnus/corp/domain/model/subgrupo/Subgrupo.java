package com.slifesys.sagnus.corp.domain.model.subgrupo;

import lombok.Getter;

import java.time.Instant;

@Getter
public class Subgrupo {
    private Long id;
    private Long idGrupo; // Assuming simple ID reference for now, or could be a Value Object
    private String nome;
    private String descricao;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public Subgrupo(Long id, Long idGrupo, String nome, String descricao, Instant criadoEm, String usuCriacao,
            Instant atualizadoEm, String usuAlteracao) {
        this.id = id;
        this.idGrupo = idGrupo;
        this.nome = nome;
        this.descricao = descricao;
        this.criadoEm = criadoEm;
        this.usuCriacao = usuCriacao;
        this.atualizadoEm = atualizadoEm;
        this.usuAlteracao = usuAlteracao;
    }

    public Subgrupo(Long idGrupo, String nome, String descricao, String usuCriacao) {
        this.idGrupo = idGrupo;
        this.nome = nome;
        this.descricao = descricao;
        this.criadoEm = Instant.now();
        this.usuCriacao = usuCriacao;
    }
}

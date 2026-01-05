package com.slifesys.sagnus.corp.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.Instant;

@Entity
@Table(name = "corp_produto_subgrupo", schema = "sagnus")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SubgrupoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_produto_grupo", nullable = false)
    private Long idGrupo;

    @Column(name = "nome")
    private String nome;

    @Column(name = "descricao")
    private String descricao;

    @Column(name = "dt_criacao", nullable = false, updatable = false)
    private Instant criadoEm;

    @Column(name = "usu_criacao")
    private String usuCriacao;

    @Column(name = "dt_alteracao")
    private Instant atualizadoEm;

    @Column(name = "usu_alteracao")
    private String usuAlteracao;
}

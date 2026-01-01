package com.slifesys.sagnus.adm.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(schema = "sagnus", name = "adm_modulo")
public class AdmModuloEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "codigo", length = 3)
    private String codigo;

    @Column(name = "nome", length = 100)
    private String nome;

    @Column(name = "descricao")
    private String descricao;

    @Column(name = "criado_em", nullable = false)
    private Instant criadoEm;

    @Column(name = "usu_criacao", length = 30, nullable = false)
    private String usuCriacao;

    @Column(name = "atualizado_em")
    private Instant atualizadoEm;

    @Column(name = "usu_alteracao", length = 30)
    private String usuAlteracao;
}

package com.slifesys.sagnus.corp.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Table(name = "corp_uf", schema = "sagnus")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UFEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "sigla")
    private String sigla;

    @Column(name = "nome")
    private String nome;

    @Column(name = "codigo_ibge")
    private Long codigoIbge;

    // Note: Domain Entity had icmsInterno, icmsInterestadual. SQL table 'corp_uf'
    // (line 3116) only has sigla, nome, codigo_ibge.
    // I will follow SQL table definition for JPA Entity.

    @Column(name = "dt_criacao", nullable = false, updatable = false)
    private Instant criadoEm;

    @Column(name = "usu_criacao")
    private String usuCriacao;

    @Column(name = "dt_alteracao")
    private Instant atualizadoEm;

    @Column(name = "usu_alteracao")
    private String usuAlteracao;
}

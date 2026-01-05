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

    @Column(name = "icms_interno")
    private BigDecimal icmsInterno;

    @Column(name = "icms_interestadual")
    private BigDecimal icmsInterestadual;

    @Column(name = "dt_criacao", nullable = false, updatable = false)
    private Instant criadoEm;

    @Column(name = "usu_criacao")
    private String usuCriacao;

    @Column(name = "dt_alteracao")
    private Instant atualizadoEm;

    @Column(name = "usu_alteracao")
    private String usuAlteracao;
}

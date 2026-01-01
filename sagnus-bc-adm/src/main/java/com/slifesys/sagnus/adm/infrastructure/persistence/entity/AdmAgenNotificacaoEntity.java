package com.slifesys.sagnus.adm.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(schema = "sagnus", name = "adm_agen_notificacao")
public class AdmAgenNotificacaoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_compromisso", nullable = false)
    private AdmAgenCompromissoEntity compromisso;

    @Column(name = "data_notificacao")
    private LocalDate dataNotificacao;

    @Column(name = "hora", length = 8)
    private String hora;

    @Column(name = "tipo")
    private Long tipo;

    @Column(name = "criado_em", nullable = false)
    private Instant criadoEm;

    @Column(name = "usu_criacao", length = 30, nullable = false)
    private String usuCriacao;

    @Column(name = "atualizado_em")
    private Instant atualizadoEm;

    @Column(name = "usu_alteracao", length = 30)
    private String usuAlteracao;
}

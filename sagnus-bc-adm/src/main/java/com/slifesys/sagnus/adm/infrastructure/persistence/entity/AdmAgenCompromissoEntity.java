package com.slifesys.sagnus.adm.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(schema = "sagnus", name = "adm_agen_compromisso")
public class AdmAgenCompromissoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_categoria", nullable = false)
    private AdmAgenCategoriaEntity categoria;

    @Column(name = "id_colaborador", nullable = false)
    private Long colaboradorId;

    @Column(name = "data_compromisso")
    private LocalDate dataCompromisso;

    @Column(name = "hora", length = 8)
    private String hora;

    @Column(name = "duracao")
    private Long duracao;

    @Column(name = "onde", length = 100)
    private String onde;

    @Column(name = "descricao", length = 100)
    private String descricao;

    @Column(name = "tipo", length = 1)
    private String tipo;

    @Column(name = "criado_em", nullable = false)
    private Instant criadoEm;

    @Column(name = "usu_criacao", length = 30, nullable = false)
    private String usuCriacao;

    @Column(name = "atualizado_em")
    private Instant atualizadoEm;

    @Column(name = "usu_alteracao", length = 30)
    private String usuAlteracao;

    @OneToMany(mappedBy = "compromisso", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<AdmAgenConviteEntity> convidados = new ArrayList<>();

    @OneToMany(mappedBy = "compromisso", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<AdmAgenNotificacaoEntity> notificacoes = new ArrayList<>();
}

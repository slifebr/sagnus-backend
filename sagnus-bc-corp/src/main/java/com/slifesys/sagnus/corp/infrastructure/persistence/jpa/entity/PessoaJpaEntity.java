package com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "corp_pessoa", schema = "sagnus")
@Getter
@Setter
public class PessoaJpaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tipo", length = 1, nullable = false)
    private String tipo; // 'F'/'J'

    @Column(name = "documento", length = 14, nullable = false)
    private String documento;

    @Column(name = "nome", length = 200, nullable = false)
    private String nome;

    @Column(name = "email", length = 200)
    private String email;

    @Column(name = "site", length = 200)
    private String site;

    @Column(name = "ativa", nullable = false)
    private Boolean ativa;

    @Column(name = "criada_em", nullable = false)
    private Instant criadaEm;

    @Column(name = "atualizada_em", nullable = false)
    private Instant atualizadaEm;

    @OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<PessoaEnderecoJpaEntity> enderecos = new ArrayList<>();
}

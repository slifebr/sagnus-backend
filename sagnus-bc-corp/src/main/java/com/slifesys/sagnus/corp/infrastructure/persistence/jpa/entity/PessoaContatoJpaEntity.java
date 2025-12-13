package com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.OffsetDateTime;

@Entity
@Table(schema = "sagnus", name = "corp_pessoa_contato")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PessoaContatoJpaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ID_PESSOA", nullable = false)
    private PessoaJpaEntity pessoa;

    @Column(name = "NOME", length = 150)
    private String nome;

    @Column(name = "EMAIL", length = 250)
    private String email;

    @Column(name = "OBSERVACAO", length = 250)
    private String observacao;

    @Column(name = "DT_CRIACAO", nullable = false)
    private OffsetDateTime dtCriacao;

    @Column(name = "USU_CRIACAO", length = 30)
    private String usuCriacao;

    @Column(name = "DT_ALTERACAO")
    private OffsetDateTime dtAlteracao;

    @Column(name = "USU_ALTERACAO", length = 30)
    private String usuAlteracao;
}

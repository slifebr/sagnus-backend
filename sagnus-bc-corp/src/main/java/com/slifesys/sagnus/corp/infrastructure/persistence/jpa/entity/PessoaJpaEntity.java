package com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(schema = "sagnus", name = "corp_pessoa")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PessoaJpaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private Long id;

    @Column(name = "NOME", length = 150)
    private String nome;

    @Column(name = "TIPO", length = 1)
    private String tipo;

    @Column(name = "SITE", length = 250)
    private String site;

    @Column(name = "EMAIL", length = 250)
    private String email;

    @Column(name = "EH_CLIENTE", length = 1)
    private String ehCliente;

    @Column(name = "EH_FORNECEDOR", length = 1)
    private String ehFornecedor;

    @Column(name = "EH_TRANSPORTADORA", length = 1)
    private String ehTransportadora;

    @Column(name = "EH_COLABORADOR", length = 1)
    private String ehColaborador;

    @Column(name = "EH_CONTADOR", length = 1)
    private String ehContador;

    @Column(name = "DT_CRIACAO", nullable = false)
    private OffsetDateTime dtCriacao;

    @Column(name = "USU_CRIACAO", length = 30)
    private String usuCriacao;

    @Column(name = "DT_ALTERACAO")
    private OffsetDateTime dtAlteracao;

    @Column(name = "USU_ALTERACAO", length = 30)
    private String usuAlteracao;

    @OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @Builder.Default
    private List<PessoaEnderecoJpaEntity> enderecos = new ArrayList<>();

    @OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @Builder.Default
    private List<PessoaTelefoneJpaEntity> telefones = new ArrayList<>();

    @OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @Builder.Default
    private List<PessoaContatoJpaEntity> contatos = new ArrayList<>();
}

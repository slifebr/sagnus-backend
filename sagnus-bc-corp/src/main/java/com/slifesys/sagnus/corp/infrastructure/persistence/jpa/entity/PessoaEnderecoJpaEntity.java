package com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.OffsetDateTime;

@Entity
@Table(schema = "sagnus", name = "corp_pessoa_endereco")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PessoaEnderecoJpaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ID_PESSOA", nullable = false)
    private PessoaJpaEntity pessoa;

    @Column(name = "LOGRADOURO", length = 100)
    private String logradouro;

    @Column(name = "NUMERO", length = 30)
    private String numero;

    @Column(name = "BAIRRO", length = 100)
    private String bairro;

    @Column(name = "MUNICIPIO_IBGE")
    private Long municipioIbge;

    @Column(name = "UF", length = 2)
    private String uf;

    @Column(name = "CEP", length = 10)
    private String cep;

    @Column(name = "CIDADE", length = 100)
    private String cidade;

    @Column(name = "COMPLEMENTO", length = 250)
    private String complemento;

    @Column(name = "PRINCIPAL", length = 1)
    private String principal;

    @Column(name = "ENTREGA", length = 1)
    private String entrega;

    @Column(name = "COBRANCA", length = 1)
    private String cobranca;

    @Column(name = "CORRESPONDENCIA", length = 1)
    private String correspondencia;

    @Column(name = "DT_CRIACAO", nullable = false)
    private OffsetDateTime dtCriacao;

    @Column(name = "USU_CRIACAO", length = 30)
    private String usuCriacao;

    @Column(name = "DT_ALTERACAO")
    private OffsetDateTime dtAlteracao;

    @Column(name = "USU_ALTERACAO", length = 30)
    private String usuAlteracao;
}

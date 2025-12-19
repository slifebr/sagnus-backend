package com.slifesys.sagnus.corp.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

@Entity
@Table(name = "corp_sindicato", schema = "sagnus")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SindicatoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nome")
    private String nome;

    @Column(name = "codigo_banco")
    private Long codigoBanco;

    @Column(name = "codigo_agencia")
    private Long codigoAgencia;

    @Column(name = "conta_banco")
    private String contaBanco;

    @Column(name = "codigo_cedente")
    private String codigoCedente;

    @Column(name = "logradouro")
    private String logradouro;

    @Column(name = "numero")
    private String numero;

    @Column(name = "bairro")
    private String bairro;

    @Column(name = "municipio_ibge")
    private Long municipioIbge;

    @Column(name = "uf")
    private String uf;

    @Column(name = "fone1")
    private String fone1;

    @Column(name = "fone2")
    private String fone2;

    @Column(name = "email")
    private String email;

    @Column(name = "tipo_sindicato")
    private String tipoSindicato; // char(1)

    @Column(name = "data_base")
    private LocalDate dataBase;

    @Column(name = "piso_salarial")
    private BigDecimal pisoSalarial;

    @Column(name = "cnpj")
    private String cnpj;

    @Column(name = "classificacao_contabil_conta")
    private String classificacaoContabilConta;

    @Column(name = "dt_criacao", nullable = false, updatable = false)
    private Instant criadoEm;

    @Column(name = "usu_criacao")
    private String usuCriacao;

    @Column(name = "dt_alteracao")
    private Instant atualizadoEm;

    @Column(name = "usu_alteracao")
    private String usuAlteracao;
}

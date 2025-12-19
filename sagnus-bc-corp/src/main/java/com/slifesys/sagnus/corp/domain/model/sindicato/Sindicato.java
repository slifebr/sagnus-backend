package com.slifesys.sagnus.corp.domain.model.sindicato;

import lombok.Getter;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

@Getter
public class Sindicato {
    private Long id;
    private String nome;
    private Long codigoBanco;
    private Long codigoAgencia;
    private String contaBanco;
    private String codigoCedente;
    private String logradouro;
    private String numero;
    private String bairro;
    private Long municipioIbge;
    private String uf;
    private String fone1;
    private String fone2;
    private String email;
    private String tipoSindicato; // char(1)
    private LocalDate dataBase;
    private BigDecimal pisoSalarial;
    private String cnpj;
    private String classificacaoContabilConta;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public Sindicato(Long id, String nome, Long codigoBanco, Long codigoAgencia, String contaBanco,
            String codigoCedente, String logradouro, String numero, String bairro, Long municipioIbge, String uf,
            String fone1, String fone2, String email, String tipoSindicato, LocalDate dataBase, BigDecimal pisoSalarial,
            String cnpj, String classificacaoContabilConta, Instant criadoEm, String usuCriacao, Instant atualizadoEm,
            String usuAlteracao) {
        this.id = id;
        this.nome = nome;
        this.codigoBanco = codigoBanco;
        this.codigoAgencia = codigoAgencia;
        this.contaBanco = contaBanco;
        this.codigoCedente = codigoCedente;
        this.logradouro = logradouro;
        this.numero = numero;
        this.bairro = bairro;
        this.municipioIbge = municipioIbge;
        this.uf = uf;
        this.fone1 = fone1;
        this.fone2 = fone2;
        this.email = email;
        this.tipoSindicato = tipoSindicato;
        this.dataBase = dataBase;
        this.pisoSalarial = pisoSalarial;
        this.cnpj = cnpj;
        this.classificacaoContabilConta = classificacaoContabilConta;
        this.criadoEm = criadoEm;
        this.usuCriacao = usuCriacao;
        this.atualizadoEm = atualizadoEm;
        this.usuAlteracao = usuAlteracao;
    }

    public Sindicato(String nome, Long codigoBanco, Long codigoAgencia, String contaBanco, String codigoCedente,
            String logradouro, String numero, String bairro, Long municipioIbge, String uf, String fone1, String fone2,
            String email, String tipoSindicato, LocalDate dataBase, BigDecimal pisoSalarial, String cnpj,
            String classificacaoContabilConta, String usuCriacao) {
        this.nome = nome;
        this.codigoBanco = codigoBanco;
        this.codigoAgencia = codigoAgencia;
        this.contaBanco = contaBanco;
        this.codigoCedente = codigoCedente;
        this.logradouro = logradouro;
        this.numero = numero;
        this.bairro = bairro;
        this.municipioIbge = municipioIbge;
        this.uf = uf;
        this.fone1 = fone1;
        this.fone2 = fone2;
        this.email = email;
        this.tipoSindicato = tipoSindicato;
        this.dataBase = dataBase;
        this.pisoSalarial = pisoSalarial;
        this.cnpj = cnpj;
        this.classificacaoContabilConta = classificacaoContabilConta;
        this.criadoEm = Instant.now();
        this.usuCriacao = usuCriacao;
    }
}

package com.slifesys.sagnus.corp.domain.model.tabelapreco;

import lombok.Getter;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

@Getter
public class TabelaPreco {
    private Long id;
    private String nome;
    private LocalDate dataInicio;
    private LocalDate dataFim;
    private BigDecimal coeficiente;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public TabelaPreco(Long id, String nome, LocalDate dataInicio, LocalDate dataFim, BigDecimal coeficiente,
            Instant criadoEm, String usuCriacao, Instant atualizadoEm, String usuAlteracao) {
        this.id = id;
        this.nome = nome;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.coeficiente = coeficiente;
        this.criadoEm = criadoEm;
        this.usuCriacao = usuCriacao;
        this.atualizadoEm = atualizadoEm;
        this.usuAlteracao = usuAlteracao;
    }

    public TabelaPreco(String nome, LocalDate dataInicio, LocalDate dataFim, BigDecimal coeficiente,
            String usuCriacao) {
        this.nome = nome;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.coeficiente = coeficiente;
        this.criadoEm = Instant.now();
        this.usuCriacao = usuCriacao;
    }
}

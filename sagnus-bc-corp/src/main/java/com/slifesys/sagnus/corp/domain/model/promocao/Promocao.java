package com.slifesys.sagnus.corp.domain.model.promocao;

import lombok.Getter;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

@Getter
public class Promocao {
    private Long id;
    private Long idProduto;
    private LocalDate dataInicio;
    private LocalDate dataFim;
    private BigDecimal precoPromocional;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public Promocao(Long id, Long idProduto, LocalDate dataInicio, LocalDate dataFim, BigDecimal precoPromocional,
            Instant criadoEm, String usuCriacao, Instant atualizadoEm, String usuAlteracao) {
        this.id = id;
        this.idProduto = idProduto;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.precoPromocional = precoPromocional;
        this.criadoEm = criadoEm;
        this.usuCriacao = usuCriacao;
        this.atualizadoEm = atualizadoEm;
        this.usuAlteracao = usuAlteracao;
    }

    public Promocao(Long idProduto, LocalDate dataInicio, LocalDate dataFim, BigDecimal precoPromocional,
            String usuCriacao) {
        this.idProduto = idProduto;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.precoPromocional = precoPromocional;
        this.criadoEm = Instant.now();
        this.usuCriacao = usuCriacao;
    }
}

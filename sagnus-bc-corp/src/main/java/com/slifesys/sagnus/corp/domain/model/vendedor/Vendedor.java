package com.slifesys.sagnus.corp.domain.model.vendedor;

import lombok.Getter;

import java.math.BigDecimal;
import java.time.Instant;

@Getter
public class Vendedor {
    private Long id;
    private Long idPessoa; // Reference to Pessoa aggregate
    private BigDecimal comissao;
    private BigDecimal meta;
    private Instant criadoEm;
    private String usuCriacao;
    private Instant atualizadoEm;
    private String usuAlteracao;

    public Vendedor(Long id, Long idPessoa, BigDecimal comissao, BigDecimal meta, Instant criadoEm, String usuCriacao,
            Instant atualizadoEm, String usuAlteracao) {
        this.id = id;
        this.idPessoa = idPessoa;
        this.comissao = comissao;
        this.meta = meta;
        this.criadoEm = criadoEm;
        this.usuCriacao = usuCriacao;
        this.atualizadoEm = atualizadoEm;
        this.usuAlteracao = usuAlteracao;
    }

    public Vendedor(Long idPessoa, BigDecimal comissao, BigDecimal meta, String usuCriacao) {
        this.idPessoa = idPessoa;
        this.comissao = comissao;
        this.meta = meta;
        this.criadoEm = Instant.now();
        this.usuCriacao = usuCriacao;
    }
}

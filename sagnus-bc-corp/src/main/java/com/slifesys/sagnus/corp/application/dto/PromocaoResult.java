package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.promocao.Promocao;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class PromocaoResult {
    private Long id;
    private Long idProduto;
    private LocalDate dataInicio;
    private LocalDate dataFim;
    private BigDecimal precoPromocional;

    public static PromocaoResult from(Promocao promocao) {
        return new PromocaoResult(
                promocao.getId(),
                promocao.getIdProduto(),
                promocao.getDataInicio(),
                promocao.getDataFim(),
                promocao.getPrecoPromocional());
    }
}

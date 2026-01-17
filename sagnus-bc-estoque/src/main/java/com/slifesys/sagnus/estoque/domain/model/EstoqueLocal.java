package com.slifesys.sagnus.estoque.domain.model;

import java.math.BigDecimal;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
public class EstoqueLocal {

    @EqualsAndHashCode.Include
    private Long id;

    private Almoxarifado almoxarifado;

    private Grade grade;

    private BigDecimal quantidade;

    private BigDecimal estqMax;

    private BigDecimal estqMin;
}

package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.vendedor.Vendedor;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.math.BigDecimal;

@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class VendedorResult {
    private Long id;
    private Long idPessoa;
    private BigDecimal comissao;
    private BigDecimal meta;

    public static VendedorResult from(Vendedor vendedor) {
        return new VendedorResult(
                vendedor.getId(),
                vendedor.getIdPessoa(),
                vendedor.getComissao(),
                vendedor.getMeta());
    }
}

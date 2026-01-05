package com.slifesys.sagnus.corp.api.vendedor;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class VendedorCreateRequest {
    @NotNull(message = "O ID da pessoa é obrigatório")
    private Long idPessoa;

    @DecimalMin(value = "0.0", message = "A comissão deve ser maior ou igual a zero")
    private BigDecimal comissao;

    @DecimalMin(value = "0.0", message = "A meta deve ser maior ou igual a zero")
    private BigDecimal meta;
}

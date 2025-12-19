package com.slifesys.sagnus.corp.api.promocao;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
public class PromocaoCreateRequest {
    @NotNull(message = "O ID do produto é obrigatório")
    private Long idProduto;

    @NotNull(message = "A data de início é obrigatória")
    private LocalDate dataInicio;

    @NotNull(message = "A data de fim é obrigatória")
    private LocalDate dataFim;

    @NotNull(message = "O preço promocional é obrigatório")
    @DecimalMin(value = "0.0", inclusive = false, message = "O preço promocional deve ser maior que zero")
    private BigDecimal precoPromocional;
}

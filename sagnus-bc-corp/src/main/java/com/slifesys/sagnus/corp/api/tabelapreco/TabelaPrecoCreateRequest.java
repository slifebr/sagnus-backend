package com.slifesys.sagnus.corp.api.tabelapreco;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
public class TabelaPrecoCreateRequest {
    @NotBlank(message = "O nome é obrigatório")
    private String nome;

    @NotNull(message = "A data de início é obrigatória")
    private LocalDate dataInicio;

    private LocalDate dataFim;

    @NotNull(message = "O coeficiente é obrigatório")
    @DecimalMin(value = "0.0", message = "O coeficiente deve ser maior ou igual a zero")
    private BigDecimal coeficiente;
}

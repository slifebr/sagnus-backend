package com.slifesys.sagnus.corp.api.transportadora;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TransportadoraCreateRequest {
    @NotNull(message = "O ID da pessoa é obrigatório")
    private Long idPessoa;

    @NotBlank(message = "A placa é obrigatória")
    private String placaVeiculo;

    @NotBlank(message = "O RNTC é obrigatório")
    private String rntc;
}

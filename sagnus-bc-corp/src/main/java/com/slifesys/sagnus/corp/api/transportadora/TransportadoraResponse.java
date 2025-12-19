package com.slifesys.sagnus.corp.api.transportadora;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class TransportadoraResponse {
    private Long id;
    private Long idPessoa;
    private String placaVeiculo;
    private String rntc;
}

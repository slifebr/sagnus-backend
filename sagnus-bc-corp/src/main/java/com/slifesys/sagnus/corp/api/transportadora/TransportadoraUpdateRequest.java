package com.slifesys.sagnus.corp.api.transportadora;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TransportadoraUpdateRequest {
    private Long idPessoa;
    private String placaVeiculo;
    private String rntc;
}

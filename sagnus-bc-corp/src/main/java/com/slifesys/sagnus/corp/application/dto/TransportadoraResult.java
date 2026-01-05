package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.transportadora.Transportadora;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class TransportadoraResult {
    private Long id;
    private Long idPessoa;
    private String placaVeiculo;
    private String rntc;

    public static TransportadoraResult from(Transportadora transportadora) {
        return new TransportadoraResult(
                transportadora.getId(),
                transportadora.getIdPessoa(),
                transportadora.getPlacaVeiculo(),
                transportadora.getRntc());
    }
}

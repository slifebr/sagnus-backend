package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.contract.transportadora.TransportadoraDTO;
import com.slifesys.sagnus.corp.application.port.TransportadoraRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterTransportadoraUseCase {

    private final TransportadoraRepository transportadoraRepository;

    @Transactional(readOnly = true)
    public TransportadoraDTO execute(Long id) {
        return transportadoraRepository.findById(id)
                .map(t -> TransportadoraDTO.builder()
                        .id(t.getId())
                        .idPessoa(t.getIdPessoa())
                        .placaVeiculo(t.getPlacaVeiculo())
                        .rntc(t.getRntc())
                        .build())
                .orElseThrow(() -> new NotFoundException("CORP-404", "Transportadora nao encontrada com id: " + id));
    }
}

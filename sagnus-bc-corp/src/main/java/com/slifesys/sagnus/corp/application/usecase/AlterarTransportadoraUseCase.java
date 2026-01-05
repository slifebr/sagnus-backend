package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.AlterarTransportadoraCommand;
import com.slifesys.sagnus.corp.application.dto.TransportadoraResult;
import com.slifesys.sagnus.corp.application.port.TransportadoraRepository;
import com.slifesys.sagnus.corp.domain.model.transportadora.Transportadora;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarTransportadoraUseCase {

    private final TransportadoraRepository transportadoraRepository;

    @Transactional
    public TransportadoraResult execute(AlterarTransportadoraCommand command) {
        Transportadora transportadora = transportadoraRepository.findById(command.getId())
                .orElseThrow(() -> new NotFoundException("CORP-404",
                        "Transportadora nao encontrada com id: " + command.getId()));

        Transportadora atualizada = new Transportadora(
                transportadora.getId(),
                command.getIdPessoa() != null ? command.getIdPessoa() : transportadora.getIdPessoa(),
                command.getPlacaVeiculo() != null ? command.getPlacaVeiculo() : transportadora.getPlacaVeiculo(),
                command.getRntc() != null ? command.getRntc() : transportadora.getRntc(),
                transportadora.getCriadoEm(),
                transportadora.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        Transportadora salva = transportadoraRepository.save(atualizada);
        return TransportadoraResult.from(salva);
    }
}

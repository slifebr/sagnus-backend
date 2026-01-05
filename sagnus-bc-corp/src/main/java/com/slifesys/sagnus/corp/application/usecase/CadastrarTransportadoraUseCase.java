package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.CadastrarTransportadoraCommand;
import com.slifesys.sagnus.corp.application.dto.TransportadoraResult;
import com.slifesys.sagnus.corp.application.port.TransportadoraRepository;
import com.slifesys.sagnus.corp.domain.model.transportadora.Transportadora;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarTransportadoraUseCase {

    private final TransportadoraRepository transportadoraRepository;

    @Transactional
    public TransportadoraResult execute(CadastrarTransportadoraCommand command) {
        Transportadora nova = new Transportadora(
                command.getIdPessoa(),
                command.getPlacaVeiculo(),
                command.getRntc(),
                command.getUsuCriacao());
        Transportadora salva = transportadoraRepository.save(nova);
        return TransportadoraResult.from(salva);
    }
}

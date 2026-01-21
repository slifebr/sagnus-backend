package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.command.CadastrarTransportadoraCommand;
import com.slifesys.sagnus.corp.contract.transportadora.TransportadoraDTO;
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
    public TransportadoraDTO execute(CadastrarTransportadoraCommand command) {
        Transportadora nova = new Transportadora(
                command.getIdPessoa(),
                command.getPlacaVeiculo(),
                command.getRntc(),
                command.getUsuCriacao());
        Transportadora salvo = transportadoraRepository.save(nova);
        return TransportadoraDTO.builder()
                .id(salvo.getId())
                .idPessoa(salvo.getIdPessoa())
                .placaVeiculo(salvo.getPlacaVeiculo())
                .rntc(salvo.getRntc())
                .build();
    }
}

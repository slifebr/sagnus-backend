package com.slifesys.sagnus.estoque.application.usecase;

import com.slifesys.sagnus.estoque.application.command.CreateAlmoxarifadoCommand;
import com.slifesys.sagnus.estoque.application.port.AlmoxarifadoRepository;

import com.slifesys.sagnus.estoque.application.result.CreateAlmoxarifadoResult;
import com.slifesys.sagnus.estoque.domain.model.Almoxarifado;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CreateAlmoxarifadoUseCase {

    private final AlmoxarifadoRepository repository;
    // private final DomainEventPublisher eventPublisher;

    @Transactional
    public CreateAlmoxarifadoResult execute(CreateAlmoxarifadoCommand cmd) {
        Almoxarifado almoxarifado = new Almoxarifado();
        almoxarifado.setNome(cmd.nome());
        
        repository.save(almoxarifado);

        // TODO: Publicar evento se necessário (Ex: AlmoxarifadoCreatedEvent)
        // eventPublisher.publish(new AlmoxarifadoCreatedEvent(almoxarifado.getId()));

        return CreateAlmoxarifadoResult.builder()
                .id(almoxarifado.getId())
                .nome(almoxarifado.getNome())
                .status("SUCCESS")
                .mensagem("Almoxarifado criado com sucesso")
                .build();
    }
}

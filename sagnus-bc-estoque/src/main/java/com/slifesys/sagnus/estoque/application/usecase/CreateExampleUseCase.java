package com.slifesys.sagnus.estoque.application.usecase;

import com.slifesys.sagnus.estoque.application.command.CreateExampleCommand;
import com.slifesys.sagnus.estoque.application.port.DomainEventPublisher;
import com.slifesys.sagnus.estoque.application.port.ExampleRepository;
import com.slifesys.sagnus.estoque.application.result.CreateExampleResult;
import com.slifesys.sagnus.estoque.domain.model.Example;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CreateExampleUseCase {

    private final ExampleRepository repository;
    private final DomainEventPublisher eventPublisher;

    @Transactional
    public CreateExampleResult execute(CreateExampleCommand cmd) {
        Example example = Example.create(cmd.nome());
        repository.save(example);

        // Exemplo: publicar evento (em produção, preferir Outbox Pattern)
        eventPublisher.publish(example.toCreatedEvent());

        return new CreateExampleResult(example.id().value(), example.nome());
    }
}

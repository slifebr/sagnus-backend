package com.slifesys.sagnus.fina.base.infrastructure.repository;

import com.slifesys.sagnus.fina.base.application.port.ExampleRepository;
import com.slifesys.sagnus.fina.base.domain.model.Example;
import com.slifesys.sagnus.fina.base.domain.model.ExampleId;
import org.springframework.stereotype.Repository;

import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Adapter simples para o template.
 * Em BC real, troque por JPA (Spring Data) ou outro mecanismo.
 */
@Repository
public class InMemoryExampleRepository implements ExampleRepository {

    private final Map<String, Example> store = new ConcurrentHashMap<>();

    @Override
    public Example save(Example example) {
        store.put(example.id().value(), example);
        return example;
    }

    @Override
    public Optional<Example> findById(ExampleId id) {
        return Optional.ofNullable(store.get(id.value()));
    }
}

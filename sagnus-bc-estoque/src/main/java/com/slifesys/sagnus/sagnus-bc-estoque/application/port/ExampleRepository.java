package com.slifesys.sagnus.sagnus-bc-estoque.application.port;

import com.slifesys.sagnus.sagnus-bc-estoque.domain.model.Example;
import com.slifesys.sagnus.sagnus-bc-estoque.domain.model.ExampleId;

import java.util.Optional;

public interface ExampleRepository {
    Example save(Example example);
    Optional<Example> findById(ExampleId id);
}

package com.slifesys.sagnus.template.application.port;

import com.slifesys.sagnus.template.domain.model.Example;
import com.slifesys.sagnus.template.domain.model.ExampleId;

import java.util.Optional;

public interface ExampleRepository {
    Example save(Example example);
    Optional<Example> findById(ExampleId id);
}

package com.slifesys.sagnus.fina.base.application.port;

import com.slifesys.sagnus.fina.base.domain.model.Example;
import com.slifesys.sagnus.fina.base.domain.model.ExampleId;

import java.util.Optional;

public interface ExampleRepository {
    Example save(Example example);
    Optional<Example> findById(ExampleId id);
}

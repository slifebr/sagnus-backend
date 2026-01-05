package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.unidade.Unidade;
import java.util.Optional;

public interface UnidadeRepository {
    Unidade save(Unidade unidade);

    Optional<Unidade> findById(Long id);
}

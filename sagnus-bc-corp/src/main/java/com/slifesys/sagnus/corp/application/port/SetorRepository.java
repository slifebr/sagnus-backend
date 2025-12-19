package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.setor.Setor;
import java.util.Optional;

public interface SetorRepository {
    Setor save(Setor setor);

    Optional<Setor> findById(Long id);
}

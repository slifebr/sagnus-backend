package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.subgrupo.Subgrupo;
import java.util.Optional;

public interface SubgrupoRepository {
    Subgrupo save(Subgrupo subgrupo);

    Optional<Subgrupo> findById(Long id);
}

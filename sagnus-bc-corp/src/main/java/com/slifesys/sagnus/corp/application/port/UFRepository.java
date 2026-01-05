package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.uf.UF;
import java.util.Optional;

public interface UFRepository {
    UF save(UF uf);

    Optional<UF> findById(Long id);

    Optional<UF> findBySigla(String sigla);
}

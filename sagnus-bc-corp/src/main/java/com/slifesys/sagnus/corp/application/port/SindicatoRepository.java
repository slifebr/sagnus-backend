package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.sindicato.Sindicato;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.Optional;

public interface SindicatoRepository {
    Sindicato save(Sindicato sindicato);

    Optional<Sindicato> findById(Long id);

    /**
     * Listagem paginada (read-only) para telas.
     */
    PageResult<Sindicato> list(PageRequest pageRequest);
}

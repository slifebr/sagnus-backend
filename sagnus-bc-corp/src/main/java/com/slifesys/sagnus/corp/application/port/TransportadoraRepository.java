package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.transportadora.Transportadora;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.Optional;

public interface TransportadoraRepository {
    Transportadora save(Transportadora transportadora);

    Optional<Transportadora> findById(Long id);

    /**
     * Listagem paginada (read-only) para telas.
     */
    PageResult<Transportadora> list(PageRequest pageRequest);
}

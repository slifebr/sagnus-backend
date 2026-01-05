package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.vendedor.Vendedor;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import java.util.Optional;

public interface VendedorRepository {
    Vendedor save(Vendedor vendedor);

    Optional<Vendedor> findById(Long id);

    /**
     * Listagem paginada (read-only) para telas.
     */
    PageResult<Vendedor> list(PageRequest pageRequest);
}

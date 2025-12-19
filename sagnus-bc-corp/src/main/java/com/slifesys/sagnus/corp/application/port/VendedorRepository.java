package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.vendedor.Vendedor;
import java.util.Optional;

public interface VendedorRepository {
    Vendedor save(Vendedor vendedor);

    Optional<Vendedor> findById(Long id);
}

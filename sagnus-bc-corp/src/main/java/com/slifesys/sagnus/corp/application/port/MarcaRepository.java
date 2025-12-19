package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.marca.Marca;
import java.util.Optional;

public interface MarcaRepository {
    Marca save(Marca marca);

    Optional<Marca> findById(Long id);
}

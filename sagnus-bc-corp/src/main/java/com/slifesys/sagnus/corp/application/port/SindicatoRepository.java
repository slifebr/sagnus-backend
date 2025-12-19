package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.sindicato.Sindicato;
import java.util.Optional;

public interface SindicatoRepository {
    Sindicato save(Sindicato sindicato);

    Optional<Sindicato> findById(Long id);
}

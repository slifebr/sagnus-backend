package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.Parametro;

import java.util.Optional;

public interface ParametroRepositoryPort {
    Optional<Parametro> findCurrent();
    Parametro save(Parametro parametro);
}

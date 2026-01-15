package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.modulo.Modulo;
import com.slifesys.sagnus.adm.domain.model.modulo.ModuloId;

import java.util.List;
import java.util.Optional;

public interface ModuloRepositoryPort {
    Modulo save(Modulo modulo);
    Optional<Modulo> findById(ModuloId id);
    List<Modulo> findAll();
}

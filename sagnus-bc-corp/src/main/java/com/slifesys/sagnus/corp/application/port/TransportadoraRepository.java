package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.transportadora.Transportadora;
import java.util.Optional;

public interface TransportadoraRepository {
    Transportadora save(Transportadora transportadora);

    Optional<Transportadora> findById(Long id);
}

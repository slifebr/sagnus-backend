package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.tiporelacionamento.TipoRelacionamento;
import java.util.Optional;

public interface TipoRelacionamentoRepository {
    TipoRelacionamento save(TipoRelacionamento tipoRelacionamento);

    Optional<TipoRelacionamento> findById(Long id);
}

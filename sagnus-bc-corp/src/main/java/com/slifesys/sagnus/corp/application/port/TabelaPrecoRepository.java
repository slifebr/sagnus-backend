package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.tabelapreco.TabelaPreco;
import java.util.Optional;

public interface TabelaPrecoRepository {
    TabelaPreco save(TabelaPreco tabelaPreco);

    Optional<TabelaPreco> findById(Long id);
}

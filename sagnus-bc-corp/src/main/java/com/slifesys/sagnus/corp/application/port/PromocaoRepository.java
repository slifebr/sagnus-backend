package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.promocao.Promocao;
import java.util.Optional;

public interface PromocaoRepository {
    Promocao save(Promocao promocao);

    Optional<Promocao> findById(Long id);
}

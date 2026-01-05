package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.tipoadmissao.TipoAdmissao;
import java.util.Optional;

public interface TipoAdmissaoRepository {
    TipoAdmissao save(TipoAdmissao tipoAdmissao);

    Optional<TipoAdmissao> findById(Long id);
}

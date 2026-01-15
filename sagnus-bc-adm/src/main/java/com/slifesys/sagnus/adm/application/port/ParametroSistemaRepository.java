package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;
import java.util.List;
import java.util.Optional;

public interface ParametroSistemaRepository {
    ParametroSistema save(ParametroSistema parametro);

    Optional<ParametroSistema> findByChave(String chave);

    List<ParametroSistema> findByEscopo(String escopo);

    List<ParametroSistema> findAll();
}

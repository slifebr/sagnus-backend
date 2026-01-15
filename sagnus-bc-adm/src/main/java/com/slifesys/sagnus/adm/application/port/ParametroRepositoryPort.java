package com.slifesys.sagnus.adm.application.port;

import com.slifesys.sagnus.adm.domain.model.parametro.ParametroConfig;
import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;

import java.util.Optional;

public interface ParametroRepositoryPort {
    Optional<ParametroConfig> findCurrent();
    ParametroConfig saveConfig(ParametroConfig parametro);

    Optional<ParametroSistema> findByChave(String chave);
    java.util.List<ParametroSistema> findByEscopo(String escopo);
    Optional<ParametroSistema> findById(Long id);
    ParametroSistema save(ParametroSistema parametro);
    void deleteById(Long id);
    java.util.List<ParametroSistema> findAll();
}

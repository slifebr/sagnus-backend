package com.slifesys.sagnus.estoque.application.port;

import com.slifesys.sagnus.estoque.domain.model.Almoxarifado;

import java.util.Optional;

public interface AlmoxarifadoRepository {
    Almoxarifado save(Almoxarifado almoxarifado);
    Optional<Almoxarifado> findById(Long id);
}

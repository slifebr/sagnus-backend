package com.slifesys.sagnus.auth.domain.port;

import com.slifesys.sagnus.auth.domain.model.usuario.UsuarioSistema;

import java.util.Optional;

public interface UsuarioRepository {
    Optional<UsuarioSistema> findByUsername(String username);
}

package com.slifesys.sagnus.auth.infrastructure.persistence.adapter;

import com.slifesys.sagnus.auth.domain.model.usuario.UsuarioSistema;
import com.slifesys.sagnus.auth.domain.port.UsuarioRepository;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repo.UsuarioSpringDataRepository;
import com.slifesys.sagnus.auth.infrastructure.persistence.mapper.UsuarioPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class UsuarioRepositoryAdapter implements UsuarioRepository {

    private final UsuarioSpringDataRepository jpa;

    @Override
    @Transactional(readOnly = true)
    public Optional<UsuarioSistema> findByUsername(String username) {
        if (username == null || username.isBlank()) return Optional.empty();
        return jpa.findByUsername(username.trim().toLowerCase())
                .map(UsuarioPersistenceMapper::toDomain);
    }
}

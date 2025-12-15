package com.slifesys.sagnus.auth.infrastructure.persistence.mapper;

import com.slifesys.sagnus.auth.domain.model.usuario.UsuarioSistema;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity.UsuarioJpaEntity;

import java.util.Set;

public final class UsuarioPersistenceMapper {

    private UsuarioPersistenceMapper() {}

    public static UsuarioSistema toDomain(UsuarioJpaEntity e) {
        if (e == null) return null;
        return UsuarioSistema.builder()
                .id(e.getId())
                .username(e.getUsername())
                .ativo(Boolean.TRUE.equals(e.getAtivo()))
                .roles(Set.of(e.getRole()))
                .pessoaId(e.getPessoaId())
                .build();
    }
}

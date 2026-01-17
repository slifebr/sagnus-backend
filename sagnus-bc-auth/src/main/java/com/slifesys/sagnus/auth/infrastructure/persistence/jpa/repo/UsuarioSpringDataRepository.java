package com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repo;

import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity.AuthUsuarioJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UsuarioSpringDataRepository extends JpaRepository<AuthUsuarioJpaEntity, Long> {
    Optional<AuthUsuarioJpaEntity> findByLogin(String login);
}

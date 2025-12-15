package com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repo;

import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity.UsuarioJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UsuarioSpringDataRepository extends JpaRepository<UsuarioJpaEntity, Long> {
    Optional<UsuarioJpaEntity> findByUsername(String username);
}

package com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repository;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity.AuthPerfilJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
public interface AuthPerfilJpaRepository extends JpaRepository<AuthPerfilJpaEntity, Long> {
  Optional<AuthPerfilJpaEntity> findByNome(String nome);
}

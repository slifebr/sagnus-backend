package com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repository;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity.AuthUsuarioJpaEntity;
import org.springframework.data.jpa.repository.*;import java.util.Optional;
public interface AuthUsuarioJpaRepository extends JpaRepository<AuthUsuarioJpaEntity, Long> {
  @EntityGraph(attributePaths={"perfis"}) Optional<AuthUsuarioJpaEntity> findByLogin(String login);
}

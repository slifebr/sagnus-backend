package com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repository;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity.AuthRefreshTokenJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
public interface AuthRefreshTokenJpaRepository extends JpaRepository<AuthRefreshTokenJpaEntity, Long> {
  Optional<AuthRefreshTokenJpaEntity> findByTokenHashAndRevogadoFalse(String tokenHash);
}

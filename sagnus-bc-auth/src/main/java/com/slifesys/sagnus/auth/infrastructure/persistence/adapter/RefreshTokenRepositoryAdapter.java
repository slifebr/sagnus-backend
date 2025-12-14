package com.slifesys.sagnus.auth.infrastructure.persistence.adapter;
import com.slifesys.sagnus.auth.domain.token.*;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity.AuthRefreshTokenJpaEntity;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repository.AuthRefreshTokenJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.time.OffsetDateTime;
import java.util.Optional;
@Repository @RequiredArgsConstructor
public class RefreshTokenRepositoryAdapter implements RefreshTokenRepository {
  private final AuthRefreshTokenJpaRepository jpa;

  @Override @Transactional
  public RefreshToken save(RefreshToken token){
    AuthRefreshTokenJpaEntity e = AuthRefreshTokenJpaEntity.builder()
      .id(token.getId()).usuarioId(token.getUsuarioId()).tokenHash(token.getTokenHash())
      .expiraEm(token.getExpiraEm()!=null?token.getExpiraEm():OffsetDateTime.now().plusDays(30))
      .revogado(token.isRevogado()).dtCriacao(token.getDtCriacao()!=null?token.getDtCriacao():OffsetDateTime.now())
      .build();
    var s = jpa.save(e);
    return RefreshToken.builder().id(s.getId()).usuarioId(s.getUsuarioId()).tokenHash(s.getTokenHash()).expiraEm(s.getExpiraEm())
      .revogado(Boolean.TRUE.equals(s.getRevogado())).dtCriacao(s.getDtCriacao()).build();
  }

  @Override @Transactional(readOnly = true)
  public Optional<RefreshToken> findActiveByHash(String tokenHash){
    return jpa.findByTokenHashAndRevogadoFalse(tokenHash)
      .filter(t -> t.getExpiraEm()!=null && !t.getExpiraEm().isBefore(OffsetDateTime.now()))
      .map(t -> RefreshToken.builder().id(t.getId()).usuarioId(t.getUsuarioId()).tokenHash(t.getTokenHash()).expiraEm(t.getExpiraEm())
        .revogado(Boolean.TRUE.equals(t.getRevogado())).dtCriacao(t.getDtCriacao()).build());
  }

  @Override @Transactional
  public void revoke(Long id){ jpa.findById(id).ifPresent(t -> { t.setRevogado(true); jpa.save(t); }); }
}

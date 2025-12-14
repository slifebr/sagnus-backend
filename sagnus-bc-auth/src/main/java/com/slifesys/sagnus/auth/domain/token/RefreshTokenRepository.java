package com.slifesys.sagnus.auth.domain.token;
import java.util.Optional;
public interface RefreshTokenRepository {
  RefreshToken save(RefreshToken token);
  Optional<RefreshToken> findActiveByHash(String tokenHash);
  void revoke(Long id);
}

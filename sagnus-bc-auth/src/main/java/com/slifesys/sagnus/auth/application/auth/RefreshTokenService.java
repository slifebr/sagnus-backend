package com.slifesys.sagnus.auth.application.auth;
import com.slifesys.sagnus.auth.domain.token.*;
import com.slifesys.sagnus.shared.error.BusinessException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.time.OffsetDateTime;
import java.util.HexFormat;
import java.util.UUID;
@Service @RequiredArgsConstructor
public class RefreshTokenService {
  private final RefreshTokenRepository repo;

  @Transactional
  public String emitirRefreshToken(Long usuarioId, int diasValidade){
    String raw = UUID.randomUUID().toString().replace("-","") + UUID.randomUUID().toString().replace("-","");
    String hash = sha256(raw);
    repo.save(RefreshToken.builder().usuarioId(usuarioId).tokenHash(hash)
      .expiraEm(OffsetDateTime.now().plusDays(diasValidade)).revogado(false).dtCriacao(OffsetDateTime.now()).build());
    return raw;
  }

  @Transactional(readOnly = true)
  public RefreshToken validarRefreshToken(String raw){
    String hash = sha256(raw);
    RefreshToken t = repo.findActiveByHash(hash).orElseThrow(() -> new BusinessException("AUTH-401","Refresh token inválido ou expirado."));
    if(t.isRevogado() || t.getExpiraEm()==null || t.getExpiraEm().isBefore(OffsetDateTime.now()))
      throw new BusinessException("AUTH-401","Refresh token inválido ou expirado.");
    return t;
  }

  @Transactional public void revogar(Long tokenId){ repo.revoke(tokenId); }

  private String sha256(String raw){
    try{
      MessageDigest md = MessageDigest.getInstance("SHA-256");
      return HexFormat.of().formatHex(md.digest(raw.getBytes(StandardCharsets.UTF_8)));
    }catch(Exception e){ throw new IllegalStateException("Falha ao calcular hash", e); }
  }
}

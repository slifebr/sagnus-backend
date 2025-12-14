package com.slifesys.sagnus.auth.application.auth;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Map;
@Service @RequiredArgsConstructor
public class AuthTokenService {
  private final com.slifesys.sagnus.platform.security.jwt.JwtProperties props;
  private final com.slifesys.sagnus.platform.security.jwt.JwtUtils jwtUtils;
  public String gerarAccessToken(Long usuarioId, long tokenVersion, Iterable<String> roles){
    Instant exp = Instant.now().plus(props.getAccessTokenMinutes(), ChronoUnit.MINUTES);
    Map<String,Object> claims = Map.of("uid",usuarioId,"tokenVersion",tokenVersion,"roles",roles);
    return jwtUtils.generateAccessToken(String.valueOf(usuarioId), claims, exp);
  }
}

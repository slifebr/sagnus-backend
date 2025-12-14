package com.slifesys.sagnus.auth.infrastructure.security;
import com.slifesys.sagnus.auth.domain.usuario.AuthUsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.Optional;
@Component @RequiredArgsConstructor
public class UserSecurityPortAdapter implements com.slifesys.sagnus.platform.security.port.UserSecurityPort {
  private final AuthUsuarioRepository repo;
  @Override public Optional<com.slifesys.sagnus.platform.security.port.UserSecurityView> findByLogin(String login){
    return repo.findByLogin(login).map(u -> com.slifesys.sagnus.platform.security.port.UserSecurityView.builder()
      .userId(u.getId()).login(u.getLogin()).passwordHash(u.getSenhaHash())
      .tokenVersion(u.getTokenVersion()!=null?u.getTokenVersion():0L)
      .roles(List.copyOf(u.getRoles()))
      .active(u.getStatus()==null || u.getStatus().name().equals("ATIVO"))
      .build());
  }
  @Override public Optional<com.slifesys.sagnus.platform.security.port.UserSecurityView> findById(Long userId){
    return repo.findById(userId).map(u -> com.slifesys.sagnus.platform.security.port.UserSecurityView.builder()
      .userId(u.getId()).login(u.getLogin()).passwordHash(u.getSenhaHash())
      .tokenVersion(u.getTokenVersion()!=null?u.getTokenVersion():0L)
      .roles(List.copyOf(u.getRoles()))
      .active(u.getStatus()==null || u.getStatus().name().equals("ATIVO"))
      .build());
  }
}

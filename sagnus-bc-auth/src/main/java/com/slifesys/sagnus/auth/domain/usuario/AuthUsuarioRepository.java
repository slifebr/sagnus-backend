package com.slifesys.sagnus.auth.domain.usuario;
import java.util.Optional;
public interface AuthUsuarioRepository {
  Optional<AuthUsuario> findByLogin(String login);
  Optional<AuthUsuario> findById(Long id);
  AuthUsuario save(AuthUsuario usuario);
  void incrementTokenVersion(Long id);
}

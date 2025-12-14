package com.slifesys.sagnus.auth.application.usuario;
import com.slifesys.sagnus.auth.domain.usuario.*;
import com.slifesys.sagnus.shared.error.BusinessException;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Optional;
import java.util.Set;
@Service @RequiredArgsConstructor
public class AuthUsuarioAppService {
  private final AuthUsuarioRepository repo;
  private final PasswordEncoder passwordEncoder;

  @Transactional(readOnly = true)
  public Optional<AuthUsuario> buscarPorLogin(String login){ return repo.findByLogin(login); }

  @Transactional(readOnly = true)
  public AuthUsuario buscarPorId(Long id, String prefix){
    return repo.findById(id).orElseThrow(() -> new BusinessException(prefix+"-404","Usuário não encontrado."));
  }

  @Transactional
  public AuthUsuario criarUsuario(String login, String senhaPlana, Long pessoaId, Set<String> perfis, String prefix, String operador){
    if(repo.findByLogin(login).isPresent()) throw new BusinessException(prefix+"-001","Login já existe.");
    String hash = passwordEncoder.encode(senhaPlana);
    return repo.save(AuthUsuario.builder()
      .login(login).senhaHash(hash).tokenVersion(0L).status(AuthUsuarioStatus.ATIVO)
      .pessoaId(pessoaId).usuCriacao(operador).roles(perfis!=null?perfis:Set.of()).build());
  }

  @Transactional
  public void invalidarTokens(Long usuarioId){ repo.incrementTokenVersion(usuarioId); }
}

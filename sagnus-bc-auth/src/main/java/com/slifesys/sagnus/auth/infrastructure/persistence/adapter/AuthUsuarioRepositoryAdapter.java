package com.slifesys.sagnus.auth.infrastructure.persistence.adapter;
import com.slifesys.sagnus.auth.domain.usuario.*;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity.*;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.time.OffsetDateTime;
import java.util.Optional;
import java.util.stream.Collectors;
@Repository @RequiredArgsConstructor
public class AuthUsuarioRepositoryAdapter implements AuthUsuarioRepository {
  private final AuthUsuarioJpaRepository jpa;
  private final AuthPerfilJpaRepository perfilJpa;

  @Override @Transactional(readOnly = true)
  public Optional<AuthUsuario> findByLogin(String login){ return jpa.findByLogin(login).map(this::toDomain); }

  @Override @Transactional(readOnly = true)
  public Optional<AuthUsuario> findById(Long id){ return jpa.findById(id).map(this::toDomain); }

  @Override @Transactional
  public AuthUsuario save(AuthUsuario usuario){
    AuthUsuarioJpaEntity e = toJpa(usuario);
    if(e.getDtCriacao()==null) e.setDtCriacao(OffsetDateTime.now());
    if(e.getStatus()==null) e.setStatus(AuthUsuarioStatus.ATIVO.name());
    if(e.getTokenVersion()==null) e.setTokenVersion(0L);

    if(usuario.getRoles()!=null){
      var perfis = usuario.getRoles().stream()
        .map(r -> r.replace("ROLE_","")).map(String::toUpperCase)
        .map(nome -> perfilJpa.findByNome(nome).orElseGet(() -> perfilJpa.save(AuthPerfilJpaEntity.builder().nome(nome).build())))
        .collect(Collectors.toSet());
      e.setPerfis(perfis);
    }

    return toDomain(jpa.save(e));
  }

  @Override @Transactional
  public void incrementTokenVersion(Long id){
    jpa.findById(id).ifPresent(u -> { long v = u.getTokenVersion()!=null?u.getTokenVersion():0L; u.setTokenVersion(v+1); jpa.save(u); });
  }

  private AuthUsuario toDomain(AuthUsuarioJpaEntity e){
    return AuthUsuario.builder().id(e.getId()).login(e.getLogin()).senhaHash(e.getSenhaHash())
      .status(e.getStatus()!=null?AuthUsuarioStatus.valueOf(e.getStatus()):null)
      .tokenVersion(e.getTokenVersion()).pessoaId(e.getPessoaId())
      .dtCriacao(e.getDtCriacao()).usuCriacao(e.getUsuCriacao()).dtAlteracao(e.getDtAlteracao()).usuAlteracao(e.getUsuAlteracao())
      .roles(e.getPerfis().stream().map(p -> "ROLE_"+p.getNome()).collect(Collectors.toSet()))
      .build();
  }

  private AuthUsuarioJpaEntity toJpa(AuthUsuario d){
    return AuthUsuarioJpaEntity.builder().id(d.getId()).login(d.getLogin()).senhaHash(d.getSenhaHash())
      .status(d.getStatus()!=null?d.getStatus().name():AuthUsuarioStatus.ATIVO.name())
      .tokenVersion(d.getTokenVersion()!=null?d.getTokenVersion():0L)
      .pessoaId(d.getPessoaId()).dtCriacao(d.getDtCriacao()).usuCriacao(d.getUsuCriacao()).dtAlteracao(d.getDtAlteracao()).usuAlteracao(d.getUsuAlteracao())
      .build();
  }
}

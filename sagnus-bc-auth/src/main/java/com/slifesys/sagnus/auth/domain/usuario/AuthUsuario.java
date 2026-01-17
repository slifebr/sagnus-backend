package com.slifesys.sagnus.auth.domain.usuario;

import lombok.*;

import java.time.OffsetDateTime;
import java.util.HashSet;
import java.util.Set;

@Getter @Setter @Builder @NoArgsConstructor @AllArgsConstructor
public class AuthUsuario {
  private Long id;
  private String login;
  private String senhaHash;
  private Long tokenVersion;
  private AuthUsuarioStatus status;
  private Long pessoaId;
  private OffsetDateTime dtCriacao;
  private String usuCriacao;
  private OffsetDateTime dtAlteracao;
  private String usuAlteracao;
  @Builder.Default private Set<String> roles = new HashSet<>();
}

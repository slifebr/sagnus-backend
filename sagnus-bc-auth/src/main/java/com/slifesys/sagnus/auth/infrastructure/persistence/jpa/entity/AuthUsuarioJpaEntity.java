package com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity;
import jakarta.persistence.*;import lombok.*;import java.time.OffsetDateTime;import java.util.*;
@Entity @Table(schema="sagnus", name="auth_usuario")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class AuthUsuarioJpaEntity {
  @Id @GeneratedValue(strategy=GenerationType.IDENTITY) @Column(name="ID", nullable=false) private Long id;
  @Column(name="LOGIN", length=80, nullable=false, unique=true) private String login;
  @Column(name="SENHA_HASH", length=200, nullable=false) private String senhaHash;
  @Column(name="STATUS", length=20, nullable=false) private String status;
  @Column(name="TOKEN_VERSION", nullable=false) private Long tokenVersion;
  @Column(name="PESSOA_ID") private Long pessoaId;
  @Column(name="DT_CRIACAO", nullable=false) private OffsetDateTime dtCriacao;
  @Column(name="USU_CRIACAO", length=30) private String usuCriacao;
  @Column(name="DT_ALTERACAO") private OffsetDateTime dtAlteracao;
  @Column(name="USU_ALTERACAO", length=30) private String usuAlteracao;

  @ManyToMany(fetch=FetchType.LAZY)
  @JoinTable(schema="sagnus", name="auth_usuario_perfil",
    joinColumns=@JoinColumn(name="USUARIO_ID"), inverseJoinColumns=@JoinColumn(name="PERFIL_ID"))
  @Builder.Default private Set<AuthPerfilJpaEntity> perfis = new HashSet<>();
}

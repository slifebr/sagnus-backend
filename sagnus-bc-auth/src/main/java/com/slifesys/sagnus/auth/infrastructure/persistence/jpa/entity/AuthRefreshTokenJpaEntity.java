package com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity;
import jakarta.persistence.*;import lombok.*;import java.time.OffsetDateTime;
@Entity @Table(schema="sagnus", name="auth_refresh_token")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class AuthRefreshTokenJpaEntity {
  @Id @GeneratedValue(strategy=GenerationType.IDENTITY) @Column(name="ID", nullable=false) private Long id;
  @Column(name="USUARIO_ID", nullable=false) private Long usuarioId;
  @Column(name="TOKEN_HASH", length=64, nullable=false, unique=true) private String tokenHash;
  @Column(name="EXPIRA_EM", nullable=false) private OffsetDateTime expiraEm;
  @Column(name="REVOGADO", nullable=false) private Boolean revogado;
  @Column(name="DT_CRIACAO", nullable=false) private OffsetDateTime dtCriacao;
}

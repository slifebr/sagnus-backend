package com.slifesys.sagnus.auth.domain.token;
import lombok.*;
import java.time.OffsetDateTime;
@Getter @Setter @Builder @NoArgsConstructor @AllArgsConstructor
public class RefreshToken {
  private Long id;
  private Long usuarioId;
  private String tokenHash;
  private OffsetDateTime expiraEm;
  private boolean revogado;
  private OffsetDateTime dtCriacao;
}

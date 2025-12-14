package com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity;
import jakarta.persistence.*;import lombok.*;
@Entity @Table(schema="sagnus", name="auth_perfil")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class AuthPerfilJpaEntity {
  @Id @GeneratedValue(strategy=GenerationType.IDENTITY) @Column(name="ID", nullable=false) private Long id;
  @Column(name="NOME", length=80, nullable=false, unique=true) private String nome;
}

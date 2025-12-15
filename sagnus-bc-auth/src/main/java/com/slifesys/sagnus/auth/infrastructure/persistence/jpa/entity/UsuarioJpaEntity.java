package com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Entity
@Table(name = "auth_usuario")
@Getter
@Setter
public class UsuarioJpaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username", length = 120, nullable = false, unique = true)
    private String username;

    @Column(name = "senha_hash", length = 255, nullable = false)
    private String senhaHash;

    @Column(name = "ativo", nullable = false)
    private Boolean ativo;

    @Column(name = "pessoa_id")
    private Long pessoaId;

    @Column(name = "role", length = 80, nullable = false)
    private String role;

    @Column(name = "criada_em", nullable = false)
    private Instant criadaEm;

    @Column(name = "atualizada_em", nullable = false)
    private Instant atualizadaEm;
}

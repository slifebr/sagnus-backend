package com.slifesys.sagnus.auth.domain.model.usuario;

import lombok.Builder;
import lombok.Value;

import java.util.Set;

@Value
@Builder
public class UsuarioSistema {
    Long id;
    String username;
    boolean ativo;
    Set<String> roles;
    Long pessoaId;
}

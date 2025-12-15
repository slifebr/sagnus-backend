package com.slifesys.sagnus.auth.application.dto;

import lombok.Builder;
import lombok.Value;

import java.util.Set;

@Value
@Builder
public class UsuarioResumoResult {
    Long usuarioId;
    String username;
    boolean ativo;
    Set<String> roles;

    Long pessoaId;
    String pessoaNome;
    String pessoaTipo;
    String pessoaDocumento;
}

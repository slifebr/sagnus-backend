package com.slifesys.sagnus.auth.application.dto;

import com.slifesys.sagnus.auth.domain.usuario.AuthUsuarioStatus;
import lombok.Builder;
import lombok.Value;

import java.util.Set;

@Value
@Builder
public class UsuarioResumoResult {
    Long usuarioId;
    String login;
    AuthUsuarioStatus status;
    Set<String> perfis;

    Long pessoaId;
    String pessoaNome;
    String pessoaTipo;
    String pessoaDocumento;
}

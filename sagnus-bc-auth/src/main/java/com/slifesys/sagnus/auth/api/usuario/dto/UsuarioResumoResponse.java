package com.slifesys.sagnus.auth.api.usuario.dto;

import com.slifesys.sagnus.auth.application.dto.UsuarioResumoResult;
import com.slifesys.sagnus.auth.domain.usuario.AuthUsuarioStatus;
import lombok.Builder;
import lombok.Value;

import java.util.Set;

@Value
@Builder
public class UsuarioResumoResponse {
    Long usuarioId;
    String login;
    AuthUsuarioStatus status;
    Set<String> perfis;

    Long pessoaId;
    String pessoaNome;
    String pessoaTipo;
    String pessoaDocumento;

    public static UsuarioResumoResponse from(UsuarioResumoResult r) {
        return UsuarioResumoResponse.builder()
                .usuarioId(r.getUsuarioId())
                .login(r.getLogin())
                .status(r.getStatus())
                .perfis(r.getPerfis())
                .pessoaId(r.getPessoaId())
                .pessoaNome(r.getPessoaNome())
                .pessoaTipo(r.getPessoaTipo())
                .pessoaDocumento(r.getPessoaDocumento())
                .build();
    }
}

package com.slifesys.sagnus.auth.api.usuario.dto;

import com.slifesys.sagnus.auth.application.dto.UsuarioResumoResult;
import lombok.Builder;
import lombok.Value;

import java.util.Set;

@Value
@Builder
public class UsuarioResumoResponse {
    Long usuarioId;
    String username;
    boolean ativo;
    Set<String> roles;

    Long pessoaId;
    String pessoaNome;
    String pessoaTipo;
    String pessoaDocumento;

    public static UsuarioResumoResponse from(UsuarioResumoResult r) {
        return UsuarioResumoResponse.builder()
                .usuarioId(r.getUsuarioId())
                .username(r.getUsername())
                .ativo(r.isAtivo())
                .roles(r.getRoles())
                .pessoaId(r.getPessoaId())
                .pessoaNome(r.getPessoaNome())
                .pessoaTipo(r.getPessoaTipo())
                .pessoaDocumento(r.getPessoaDocumento())
                .build();
    }
}

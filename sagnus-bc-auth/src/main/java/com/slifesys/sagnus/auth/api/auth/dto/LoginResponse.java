package com.slifesys.sagnus.auth.api.auth.dto;

import lombok.Builder;
import lombok.Value;

import java.util.Set;

@Value
@Builder
public class LoginResponse {
    String accessToken;
    String refreshToken;
    String tokenType;
    Long expiresInSeconds;

    String login;
    Set<String> perfis;

    Long pessoaId;
    String pessoaNome;
    String pessoaTipo;
    String pessoaDocumento;
}

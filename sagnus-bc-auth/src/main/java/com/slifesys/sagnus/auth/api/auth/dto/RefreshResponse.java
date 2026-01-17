package com.slifesys.sagnus.auth.api.auth.dto;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class RefreshResponse {
    String accessToken;
    String tokenType;
    Long expiresInSeconds;

    public RefreshResponse(String accessToken, String tokenType, Long expiresInSeconds) {
        this.accessToken = accessToken;
        this.tokenType = tokenType;
        this.expiresInSeconds = expiresInSeconds;
    }
}

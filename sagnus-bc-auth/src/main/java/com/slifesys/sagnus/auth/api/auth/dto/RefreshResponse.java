package com.slifesys.sagnus.auth.api.auth.dto;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class RefreshResponse {
    String accessToken;
    String tokenType;
    Long expiresInSeconds;
}

package com.slifesys.sagnus.auth.api.auth.dto;

import lombok.Data;

@Data
public class RefreshRequest {
    private String refreshToken;
}

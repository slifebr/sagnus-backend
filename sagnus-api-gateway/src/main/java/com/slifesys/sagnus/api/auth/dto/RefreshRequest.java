package com.slifesys.sagnus.api.auth.dto;

import jakarta.validation.constraints.NotBlank;

public record RefreshRequest(
        @NotBlank(message = "Refresh Token é obrigatório.")
        String refreshToken
) {}

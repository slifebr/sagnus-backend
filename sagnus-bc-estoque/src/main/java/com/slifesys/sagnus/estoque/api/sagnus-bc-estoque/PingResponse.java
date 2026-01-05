package com.slifesys.sagnus.sagnus-bc-estoque.api.sagnus-bc-estoque;

import java.time.Instant;

public record PingResponse(
        String status,
        Instant serverTime,
        String correlationId
) {}

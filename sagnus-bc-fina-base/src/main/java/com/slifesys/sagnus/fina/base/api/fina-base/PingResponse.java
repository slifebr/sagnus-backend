package com.slifesys.sagnus.fina.base.api.example;

import java.time.Instant;

public record PingResponse(
        String status,
        Instant serverTime,
        String correlationId
) {}

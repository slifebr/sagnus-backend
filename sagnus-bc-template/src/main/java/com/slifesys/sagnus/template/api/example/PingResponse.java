package com.slifesys.sagnus.template.api.example;

import java.time.Instant;

public record PingResponse(
        String status,
        Instant serverTime,
        String correlationId
) {}

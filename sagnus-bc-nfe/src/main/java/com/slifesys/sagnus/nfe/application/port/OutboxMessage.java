package com.slifesys.sagnus.nfe.application.port;

import java.time.Instant;

/**
 * Payload pronto para ser enviado via Outbox.
 */
public record OutboxMessage(
        String eventId,
        String eventType,
        Instant occurredAt,
        String correlationId,
        String payloadJson
) {}

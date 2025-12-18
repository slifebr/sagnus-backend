package com.slifesys.sagnus.nfe.infrastructure.outbox;

import com.slifesys.sagnus.nfe.application.port.OutboxMessage;
import com.slifesys.sagnus.nfe.application.port.OutboxTransportPort;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

/**
 * Transporte default: apenas loga. Útil para DEV/local e como "stub".
 */
@Slf4j
@Component
@ConditionalOnProperty(prefix = "sagnus.nfe.outbox", name = "transport", havingValue = "LOG", matchIfMissing = true)
public class LogOutboxTransportAdapter implements OutboxTransportPort {

    @Override
    public void send(OutboxMessage message) {
        String payload = message.payloadJson();
        String snippet = payload == null ? "" : (payload.length() > 300 ? payload.substring(0, 300) + "..." : payload);
        log.info("[OUTBOX->LOG] eventType={}, eventId={}, correlationId={}, payload={}",
                message.eventType(), message.eventId(), message.correlationId(), snippet);
    }
}

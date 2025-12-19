package com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit.worker;

import com.slifesys.sagnus.nfe.application.port.OutboxMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * Handler simples para eventos de reconciliação RTC.
 * Por ora apenas loga; em um futuro pode alimentar métricas/observabilidade.
 */
@Slf4j
@Component
public class RtcIbsCbsReconciledOutboxHandler implements OutboxWorkerHandler {

    @Override
    public boolean supports(String eventType) {
        return "RtcIbsCbsReconciledEvent".equals(eventType);
    }

    @Override
    public void handle(OutboxMessage message) {
        log.warn("[WORKER][RTC] reconciled event recebido. eventId={}, correlationId={}, payload={}",
                message.eventId(), message.correlationId(), message.payloadJson());
    }
}

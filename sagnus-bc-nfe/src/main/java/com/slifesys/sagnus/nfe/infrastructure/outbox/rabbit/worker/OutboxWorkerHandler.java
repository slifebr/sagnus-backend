package com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit.worker;

import com.slifesys.sagnus.nfe.application.port.OutboxMessage;

/**
 * Handler de um tipo de evento consumido do Rabbit (Outbox).
 */
public interface OutboxWorkerHandler {

    boolean supports(String eventType);

    void handle(OutboxMessage message) throws Exception;
}

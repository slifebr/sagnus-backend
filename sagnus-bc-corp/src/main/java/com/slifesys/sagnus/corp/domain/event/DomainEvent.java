package com.slifesys.sagnus.corp.domain.event;

import java.time.Instant;

/**
 * Contrato básico de um evento de domínio no contexto CORP.
 */
public interface DomainEvent {

    String getEventId();

    Instant getOccurredAt();

    String getEventType();

}

package com.slifesys.sagnus.nfe.domain.event;

import java.time.Instant;

/**
 * Evento de domínio: algo relevante que "já aconteceu" no domínio.
 * Deve ser imutável e conter somente dados necessários para o próximo passo do fluxo.
 *
 * Ex.: NfeEmitidaEvent -> gatilho para geração XML / envio SEFAZ / auditoria / mensageria.
 */
/*
public interface DomainEvent {
    String eventId();
    Instant occurredAt();
    String eventType();
}
*/


/**
 * Contrato básico de um evento de domínio.
 *
 * Padrão:
 * - getEventId: identificador único do evento
 * - getOccurredAt: instante em que o evento ocorreu
 * - getEventType: nome lógico do tipo de evento
 */
public interface DomainEvent {

    String getEventId();
    Instant getOccurredAt();
    String getEventType();

}



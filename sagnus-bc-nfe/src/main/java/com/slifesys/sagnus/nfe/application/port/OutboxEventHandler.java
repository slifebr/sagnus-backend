package com.slifesys.sagnus.nfe.application.port;

/**
 * Handler pluggável para eventos recebidos via transporte (ex.: RabbitMQ).
 *
 * O Outbox envia um envelope contendo metadados (eventId/eventType/etc) + payloadJson.
 * O Worker (consumer) faz o dispatch baseado em {@link OutboxMessage#eventType()}.
 */
public interface OutboxEventHandler {

    /**
     * Nome do tipo de evento (ex.: "NfeEmitidaEvent").
     * Deve bater com o valor emitido pelo Outbox.
     */
    String eventType();

    /**
     * Processa o evento.
     *
     * @throws Exception para sinalizar falha e permitir retry/DLQ.
     */
    void handle(OutboxMessage message) throws Exception;
}

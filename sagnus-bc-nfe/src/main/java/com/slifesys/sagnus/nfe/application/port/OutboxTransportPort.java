package com.slifesys.sagnus.nfe.application.port;

/**
 * Abstrai o envio de uma mensagem Outbox para um transporte.
 *
 * Nesta etapa: LOG.
 * Próximas: Kafka/Rabbit (implementações adicionais).
 */
public interface OutboxTransportPort {

    void send(OutboxMessage message) throws Exception;
}

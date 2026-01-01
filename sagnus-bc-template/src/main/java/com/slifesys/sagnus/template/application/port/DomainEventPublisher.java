package com.slifesys.sagnus.template.application.port;

/**
 * Porta de saída (outbound port) para publicação de eventos de domínio/integração.
 * Em BCs reais, isso pode virar outbox + mensageria (Rabbit/Kafka).
 */
public interface DomainEventPublisher {
    void publish(Object event);
}

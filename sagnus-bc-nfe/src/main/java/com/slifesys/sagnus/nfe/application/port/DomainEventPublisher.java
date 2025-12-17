package com.slifesys.sagnus.nfe.application.port;

import com.slifesys.sagnus.nfe.domain.event.DomainEvent;

/**
 * Porta para publicação de eventos do domínio.
 *
 * Implementações possíveis:
 * - Spring ApplicationEventPublisher (mínimo)
 * - Outbox (robusto)
 * - Kafka/Rabbit (futuro)
 */
public interface DomainEventPublisher {
    void publish(DomainEvent event);
}

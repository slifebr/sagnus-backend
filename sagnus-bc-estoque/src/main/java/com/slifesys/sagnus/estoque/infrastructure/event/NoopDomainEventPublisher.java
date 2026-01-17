package com.slifesys.sagnus.estoque.infrastructure.event;

import com.slifesys.sagnus.estoque.application.port.DomainEventPublisher;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * Adapter default.
 * Substitua por outbox + mensageria (Rabbit/Kafka) quando o BC crescer.
 */
@Slf4j
@Component
public class NoopDomainEventPublisher implements DomainEventPublisher {

    @Override
    public void publish(Object event) {
        log.info("[TEMPLATE] Event published: {}", event);
    }
}

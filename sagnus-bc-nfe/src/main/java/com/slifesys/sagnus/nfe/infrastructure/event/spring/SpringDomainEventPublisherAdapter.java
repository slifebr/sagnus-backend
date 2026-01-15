package com.slifesys.sagnus.nfe.infrastructure.event.spring;

import com.slifesys.sagnus.nfe.application.port.DomainEventPublisher;
import com.slifesys.sagnus.shared.domain.event.DomainEvent;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;

import java.util.Objects;

/**
 * Adapter mínimo usando Spring ApplicationEventPublisher.
 *
 * Importante:
 * - isso garante desacoplamento e permite trocar por Outbox depois.
 * - em ambiente distribuído, Outbox é recomendado.
 */
@Component
public class SpringDomainEventPublisherAdapter implements DomainEventPublisher {

    private final ApplicationEventPublisher publisher;

    public SpringDomainEventPublisherAdapter(ApplicationEventPublisher publisher) {
        this.publisher = publisher;
    }

    @Override
    public void publish(DomainEvent event) {
        Objects.requireNonNull(event, "DomainEvent é obrigatório");
        publisher.publishEvent(event);
    }
}

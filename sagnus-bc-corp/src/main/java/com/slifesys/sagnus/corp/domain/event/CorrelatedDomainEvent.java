package com.slifesys.sagnus.corp.domain.event;

/**
 * Interface para eventos que possuem CorrelationId.
 */
public interface CorrelatedDomainEvent extends DomainEvent {
    String getCorrelationId();
}

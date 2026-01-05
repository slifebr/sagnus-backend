package com.slifesys.sagnus.shared.domain.event;

import com.slifesys.sagnus.shared.observability.CorrelationIdContext;

public abstract class CorrelatedDomainEvent extends AbstractDomainEvent {

    private final String correlationId;

    public CorrelatedDomainEvent() {
        this.correlationId = CorrelationIdContext.get();
    }

    public String correlationId() {
        return correlationId;
    }
}

package com.slifesys.sagnus.shared.domain.event;

import com.slifesys.sagnus.shared.observability.CorrelationIdContext;

public abstract class CorrelatedDomainEvent extends AbstractDomainEvent {

    private final String correlationId;

    public CorrelatedDomainEvent() {
        this.correlationId = CorrelationIdContext.get();
    }

    public CorrelatedDomainEvent(String correlationId) {
        this.correlationId = correlationId;
    }

    public String getCorrelationId() {
        return correlationId;
    }
}

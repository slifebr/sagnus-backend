package com.slifesys.sagnus.nfe.domain.event;

/**
 * Marker para eventos que carregam CorrelationId.
 *
 * Mantém o contrato DomainEvent intacto e permite que listeners/auditoria
 * usem o correlationId quando disponível.
 */
public interface CorrelatedDomainEvent extends DomainEvent {
    String getCorrelationId();
}

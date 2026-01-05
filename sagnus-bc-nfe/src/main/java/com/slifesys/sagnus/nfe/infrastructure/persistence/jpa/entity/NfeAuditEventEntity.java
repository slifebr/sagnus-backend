package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.Instant;

/**
 * Auditoria mínima de eventos do BC NFe (MVP).
 *
 * Por enquanto é uma "event sink" para rastreabilidade/diagnóstico.
 * Mais tarde pode evoluir para Outbox (com reprocessamento/retry).
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "nfe_audit_event")
public class NfeAuditEventEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "event_id", nullable = false, length = 64)
    private String eventId;

    @Column(name = "event_type", nullable = false, length = 128)
    private String eventType;

    @Column(name = "occurred_at", nullable = false)
    private Instant occurredAt;

    @Column(name = "correlation_id", length = 128)
    private String correlationId;

    @Column(name = "payload_json", columnDefinition = "text")
    private String payloadJson;
}

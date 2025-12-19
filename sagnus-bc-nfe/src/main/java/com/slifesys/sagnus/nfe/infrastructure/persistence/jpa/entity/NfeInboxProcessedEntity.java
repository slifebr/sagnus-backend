package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.Instant;

/**
 * Marcações de idempotência ("Inbox") para consumidores assíncronos (Rabbit/Kafka).
 *
 * Ideia: se um evento com o mesmo eventId chegar mais de uma vez (redelivery),
 * o worker reconhece e faz ACK sem reprocessar.
 */
@Entity
@Table(name = "nfe_inbox_processed")
public class NfeInboxProcessedEntity {

    @Id
    @Column(name = "event_id", length = 64, nullable = false)
    private String eventId;

    @Column(name = "event_type", length = 120, nullable = false)
    private String eventType;

    @Column(name = "correlation_id", length = 120)
    private String correlationId;

    @Column(name = "processed_at", nullable = false)
    private Instant processedAt;

    protected NfeInboxProcessedEntity() {
        // JPA
    }

    public NfeInboxProcessedEntity(String eventId, String eventType, String correlationId, Instant processedAt) {
        this.eventId = eventId;
        this.eventType = eventType;
        this.correlationId = correlationId;
        this.processedAt = processedAt;
    }

    public String getEventId() {
        return eventId;
    }

    public String getEventType() {
        return eventType;
    }

    public String getCorrelationId() {
        return correlationId;
    }

    public Instant getProcessedAt() {
        return processedAt;
    }
}

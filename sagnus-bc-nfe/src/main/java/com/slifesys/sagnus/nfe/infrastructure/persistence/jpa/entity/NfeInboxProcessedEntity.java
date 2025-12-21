package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity;

import jakarta.persistence.*;

import java.time.Instant;

@Entity
@Table(name = "nfe_inbox_processed", uniqueConstraints = {
        @UniqueConstraint(name = "uk_nfe_inbox_event_id", columnNames = {"event_id"})
})
public class NfeInboxProcessedEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "event_id", nullable = false, length = 64)
    private String eventId;

    @Column(name = "event_type", nullable = false, length = 120)
    private String eventType;

    @Column(name = "correlation_id", length = 120)
    private String correlationId;

    @Column(name = "processed_at", nullable = false)
    private Instant processedAt;

    protected NfeInboxProcessedEntity() {
    }

    public NfeInboxProcessedEntity(String eventId, String eventType, String correlationId, Instant processedAt) {
        this.eventId = eventId;
        this.eventType = eventType;
        this.correlationId = correlationId;
        this.processedAt = processedAt;
    }

    public Long getId() { return id; }
    public String getEventId() { return eventId; }
    public String getEventType() { return eventType; }
    public String getCorrelationId() { return correlationId; }
    public Instant getProcessedAt() { return processedAt; }
}

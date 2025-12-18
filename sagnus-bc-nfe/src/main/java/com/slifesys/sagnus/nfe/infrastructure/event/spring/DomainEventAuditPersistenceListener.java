package com.slifesys.sagnus.nfe.infrastructure.event.spring;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.slifesys.sagnus.nfe.application.config.NfeAuditProperties;
import com.slifesys.sagnus.nfe.application.context.CorrelationIdHolder;
import com.slifesys.sagnus.nfe.domain.event.CorrelatedDomainEvent;
import com.slifesys.sagnus.nfe.domain.event.DomainEvent;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeAuditEventEntity;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository.NfeAuditEventJpaRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

/**
 * Persistência de auditoria para DomainEvents (MVP).
 *
 * - grava em tabela nfe_audit_event
 * - armazena payload JSON do evento
 * - captura correlationId (do evento, quando disponível, ou do CorrelationIdHolder)
 */
@Slf4j
@Component
@ConditionalOnProperty(prefix = "sagnus.nfe.audit", name = "enabled", havingValue = "true", matchIfMissing = true)
public class DomainEventAuditPersistenceListener {

    private final NfeAuditEventJpaRepository repo;
    private final ObjectMapper objectMapper;
    private final NfeAuditProperties props;

    public DomainEventAuditPersistenceListener(NfeAuditEventJpaRepository repo,
                                               ObjectMapper objectMapper,
                                               NfeAuditProperties props) {
        this.repo = repo;
        this.objectMapper = objectMapper;
        this.props = props;
    }

    @EventListener
    public void on(DomainEvent event) {
        if (!props.isEnabled()) {
            return;
        }

        String correlationId = null;
        if (event instanceof CorrelatedDomainEvent cde) {
            correlationId = cde.getCorrelationId();
        }
        if (correlationId == null || correlationId.isBlank()) {
            correlationId = CorrelationIdHolder.get();
        }

        String payload;
        try {
            payload = objectMapper.writeValueAsString(event);
        } catch (JsonProcessingException e) {
            // não falha o fluxo por auditoria
            payload = "{\"error\":\"payload_serialization_failed\",\"eventType\":\"" + event.getEventType() + "\"}";
            log.warn("[AUDIT] falha ao serializar DomainEvent para JSON. eventType={}, correlationId={}", event.getEventType(), correlationId, e);
        }

        NfeAuditEventEntity row = new NfeAuditEventEntity();
        row.setEventId(event.getEventId());
        row.setEventType(event.getEventType());
        row.setOccurredAt(event.getOccurredAt());
        row.setCorrelationId(correlationId);
        row.setPayloadJson(payload);

        try {
            repo.save(row);
        } catch (Exception ex) {
            // não falha o fluxo por auditoria
            log.warn("[AUDIT] falha ao persistir DomainEvent. eventType={}, eventId={}, correlationId={}",
                    event.getEventType(), event.getEventId(), correlationId, ex);
        }
    }
}

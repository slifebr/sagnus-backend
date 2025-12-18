package com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import com.slifesys.sagnus.nfe.application.config.NfeOutboxRabbitProperties;
import com.slifesys.sagnus.nfe.application.port.OutboxMessage;
import com.slifesys.sagnus.nfe.application.port.OutboxTransportPort;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import java.time.Instant;

/**
 * Transporte RabbitMQ (fila de trabalho) para o Outbox.
 *
 * - Publica um envelope JSON com metadados + payloadJson.
 * - Usa o RabbitTemplate (Spring AMQP).
 *
 * Observação: o Outbox já faz retries/backoff/DEAD. Aqui queremos apenas
 * propagar erro de publish para que o Outbox reprocese.
 */
@Slf4j
@Component
@ConditionalOnProperty(prefix = "sagnus.nfe.outbox", name = "transport", havingValue = "RABBIT")
public class RabbitOutboxTransportAdapter implements OutboxTransportPort {

    private final RabbitTemplate rabbit;
    private final ObjectMapper mapper;
    private final NfeOutboxRabbitProperties props;

    public RabbitOutboxTransportAdapter(RabbitTemplate rabbit, ObjectMapper mapper, NfeOutboxRabbitProperties props) {
        this.rabbit = rabbit;
        this.mapper = mapper.copy()
                .registerModule(new JavaTimeModule())
                .disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
        this.props = props;
    }
    @Override
    public void send(OutboxMessage message) throws Exception {
        String envelopeJson = mapper.writeValueAsString(new OutboxEnvelope(
                message.eventId(),
                message.eventType(),
                message.occurredAt(),
                message.correlationId(),
                message.payloadJson()
        ));

        try {
            rabbit.convertAndSend(props.getExchange(), props.getRoutingKey(), envelopeJson);
            log.info("[OUTBOX->RABBIT] published eventType={}, eventId={}, correlationId={}, exchange={}, routingKey={}",
                    message.eventType(), message.eventId(), message.correlationId(), props.getExchange(), props.getRoutingKey());
        } catch (AmqpException ex) {
            // Propaga para o Outbox agendar retry/backoff.
            log.warn("[OUTBOX->RABBIT] publish FAILED eventType={}, eventId={}, correlationId={}, exchange={}, routingKey={}, error={}",
                    message.eventType(), message.eventId(), message.correlationId(), props.getExchange(), props.getRoutingKey(), ex.getMessage());
            throw ex;
        }
    }

    /** Envelope canônico para transporte. */
    public record OutboxEnvelope(
            String eventId,
            String eventType,
            Instant occurredAt,
            String correlationId,
            String payloadJson
    ) {}
}

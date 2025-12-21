package com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit.worker;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.slifesys.sagnus.nfe.application.config.NfeOutboxRabbitProperties;
import com.slifesys.sagnus.nfe.application.context.CorrelationIdHolder;
import com.slifesys.sagnus.nfe.application.port.OutboxMessage;
import com.slifesys.sagnus.nfe.infrastructure.outbox.inbox.InboxIdempotencyService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import com.rabbitmq.client.Channel;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

/**
 * Worker que consome eventos publicados no Rabbit via Outbox.
 *
 * - idempotência por eventId (tabela inbox)
 * - retry via DLX -> retry queue (TTL) -> volta para fila principal
 * - após N tentativas, envia para DLQ e ACK (para não ficar em loop)
 */
@Slf4j
@Component
@ConditionalOnProperty(prefix = "sagnus.nfe.worker", name = "enabled", havingValue = "true")
public class OutboxRabbitWorkerListener {

    private final ObjectMapper mapper;
    private final RabbitTemplate rabbit;
    private final NfeOutboxRabbitProperties props;
    private final InboxIdempotencyService inbox;
    private final List<OutboxWorkerHandler> handlers;

    public OutboxRabbitWorkerListener(ObjectMapper mapper,
                                     RabbitTemplate rabbit,
                                     NfeOutboxRabbitProperties props,
                                     InboxIdempotencyService inbox,
                                     List<OutboxWorkerHandler> handlers) {
        this.mapper = mapper;
        this.rabbit = rabbit;
        this.props = props;
        this.inbox = inbox;
        this.handlers = handlers;
    }

    @RabbitListener(queues = "${sagnus.nfe.outbox.rabbit.queue}", containerFactory = "nfeWorkerRabbitListenerContainerFactory")
    public void onMessage(Message msg, Channel channel) throws IOException {
        long tag = msg.getMessageProperties().getDeliveryTag();
        String body = new String(msg.getBody(), StandardCharsets.UTF_8);

        OutboxMessage envelope;
        try {
            envelope = mapper.readValue(body, OutboxMessage.class);
        } catch (Exception ex) {
            // payload inválido: manda para DLQ para análise e ACK.
            log.warn("[WORKER] envelope inválido. enviando para DLQ. error={}", ex.getMessage());
            rabbit.convertAndSend(props.getDlxExchange(), props.getDlqRoutingKey(), body);
            channel.basicAck(tag, false);
            return;
        }

        String correlationId = envelope.correlationId();
        try {
            if (correlationId != null && !correlationId.isBlank()) {
                MDC.put("correlationId", correlationId);
                CorrelationIdHolder.set(correlationId);
            }

            if (inbox.alreadyProcessed(envelope.eventId())) {
                log.info("[WORKER] evento já processado (idempotência). eventType={}, eventId={}",
                        envelope.eventType(), envelope.eventId());
                channel.basicAck(tag, false);
                return;
            }

            OutboxWorkerHandler h = handlers.stream()
                    .filter(x -> x.supports(envelope.eventType()))
                    .findFirst()
                    .orElse(null);

            if (h == null) {
                log.warn("[WORKER] nenhum handler para eventType={}. ACK para evitar loop.", envelope.eventType());
                inbox.markProcessed(envelope.eventId(), envelope.eventType(), correlationId);
                channel.basicAck(tag, false);
                return;
            }

            h.handle(envelope);
            inbox.markProcessed(envelope.eventId(), envelope.eventType(), correlationId);
            channel.basicAck(tag, false);
        } catch (Exception ex) {
            int failures = getFailureCount(msg, props.getQueue());
            int attempt = failures + 1;

            if (attempt >= props.getMaxDeliveries()) {
                log.error("[WORKER] excedeu tentativas. enviando para DLQ. eventType={}, eventId={}, attempt={}, max={}, error={}",
                        envelope.eventType(), envelope.eventId(), attempt, props.getMaxDeliveries(), ex.getMessage());
                rabbit.convertAndSend(props.getDlxExchange(), props.getDlqRoutingKey(), body);
                // marca como processado para não reprocessar caso DLQ seja reencaminhada sem querer
                inbox.markProcessed(envelope.eventId(), envelope.eventType(), correlationId);
                channel.basicAck(tag, false);
            } else {
                log.warn("[WORKER] falha ao processar. NACK para retry. eventType={}, eventId={}, attempt={}, max={}, error={}",
                        envelope.eventType(), envelope.eventId(), attempt, props.getMaxDeliveries(), ex.getMessage());
                channel.basicNack(tag, false, false); // requeue=false -> DLX -> retryQueue
            }
        } finally {
            CorrelationIdHolder.clear();
            MDC.remove("correlationId");
        }
    }

    @SuppressWarnings("unchecked")
    private static int getFailureCount(Message msg, String mainQueueName) {
        Object xDeath = msg.getMessageProperties().getHeaders().get("x-death");
        if (!(xDeath instanceof List<?> list)) {
            return 0;
        }
        long total = 0;
        for (Object o : list) {
            if (!(o instanceof Map<?, ?> m)) continue;
            Object q = m.get("queue");
            if (q != null && mainQueueName.equals(q.toString())) {
                Object c = m.get("count");
                if (c instanceof Long l) total += l;
                else if (c instanceof Integer i) total += i.longValue();
            }
        }
        if (total > Integer.MAX_VALUE) return Integer.MAX_VALUE;
        return (int) total;
    }
}

package com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit;

import com.slifesys.sagnus.nfe.application.config.NfeOutboxRabbitProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Infra Rabbit (exchange/queue/binding) para DEV/local.
 *
 * Topologia (quando dlqEnabled=true):
 *
 *  Outbox publish -> exchange (props.exchange/routingKey) -> MAIN QUEUE
 *
 *  Worker NACK (requeue=false) -> DLX (props.dlxExchange) -> RETRY QUEUE (TTL)
 *  RETRY QUEUE (TTL expirou) -> dead-letter -> exchange original -> MAIN QUEUE
 *
 *  Worker decide DLQ (envelope inválido ou maxDeliveries) -> publish -> DLX -> DLQ
 */
@Slf4j
@Configuration
@ConditionalOnProperty(prefix = "sagnus.nfe.outbox", name = "transport", havingValue = "RABBIT")
@ConditionalOnExpression("'${sagnus.nfe.outbox.rabbit.autoDeclare:true}'=='true'")
public class OutboxRabbitInfraConfig {

    @Bean
    public Exchange nfeOutboxExchange(NfeOutboxRabbitProperties props) {
        return switch (props.getExchangeType().toLowerCase()) {
            case "topic" -> new TopicExchange(props.getExchange(), true, false);
            case "fanout" -> new FanoutExchange(props.getExchange(), true, false);
            default -> new DirectExchange(props.getExchange(), true, false);
        };
    }

    /**
     * Exchange DLX (dead-letter). Usado para RETRY e DLQ.
     */
    @Bean
    @ConditionalOnExpression("'${sagnus.nfe.outbox.rabbit.dlqEnabled:true}'=='true'")
    public DirectExchange nfeOutboxDlxExchange(NfeOutboxRabbitProperties props) {
        return new DirectExchange(props.getDlxExchange(), true, false);
    }

    /**
     * Fila principal (work queue).
     */
    @Bean
    public Queue nfeOutboxQueue(NfeOutboxRabbitProperties props) {
        QueueBuilder builder = QueueBuilder.durable(props.getQueue());

        // Para retry via dead-letter: mainQueue -> DLX -> retryQueue
        if (props.isDlqEnabled()) {
            builder.withArgument("x-dead-letter-exchange", props.getDlxExchange());
            builder.withArgument("x-dead-letter-routing-key", props.getRetryQueue());
        }

        return builder.build();
    }

    /**
     * Retry queue (TTL). Após o TTL, volta para o exchange principal.
     */
    @Bean
    @ConditionalOnExpression("'${sagnus.nfe.outbox.rabbit.dlqEnabled:true}'=='true'")
    public Queue nfeOutboxRetryQueue(NfeOutboxRabbitProperties props) {
        return QueueBuilder.durable(props.getRetryQueue())
                .withArgument("x-message-ttl", props.getRetryTtlMs())
                .withArgument("x-dead-letter-exchange", props.getExchange())
                .withArgument("x-dead-letter-routing-key", props.getRoutingKey())
                .build();
    }

    @Bean
    @ConditionalOnExpression("'${sagnus.nfe.outbox.rabbit.dlqEnabled:true}'=='true'")
    public Binding nfeOutboxRetryBinding(Queue nfeOutboxRetryQueue, DirectExchange nfeOutboxDlxExchange, NfeOutboxRabbitProperties props) {
        log.info("[OUTBOX->RABBIT] autoDeclare RETRY dlxExchange={}, retryQueue={}, retryRoutingKey={}, retryTtlMs={}ms",
                props.getDlxExchange(), props.getRetryQueue(), props.getRetryQueue(), props.getRetryTtlMs());
        // RoutingKey = retryQueue name (prático e sem novos properties)
        return BindingBuilder.bind(nfeOutboxRetryQueue).to(nfeOutboxDlxExchange).with(props.getRetryQueue());
    }

    /**
     * Dead-letter queue (parking).
     */
    @Bean
    @ConditionalOnExpression("'${sagnus.nfe.outbox.rabbit.dlqEnabled:true}'=='true'")
    public Queue nfeOutboxDlqQueue(NfeOutboxRabbitProperties props) {
        return QueueBuilder.durable(props.getDlq()).build();
    }

    @Bean
    @ConditionalOnExpression("'${sagnus.nfe.outbox.rabbit.dlqEnabled:true}'=='true'")
    public Binding nfeOutboxDlqBinding(Queue nfeOutboxDlqQueue, DirectExchange nfeOutboxDlxExchange, NfeOutboxRabbitProperties props) {
        log.info("[OUTBOX->RABBIT] autoDeclare DLQ dlxExchange={}, dlqQueue={}, dlqRoutingKey={}",
                props.getDlxExchange(), props.getDlq(), props.getDlqRoutingKey());
        return BindingBuilder.bind(nfeOutboxDlqQueue).to(nfeOutboxDlxExchange).with(props.getDlqRoutingKey());
    }

    @Bean
    public Binding nfeOutboxBinding(Queue nfeOutboxQueue, Exchange nfeOutboxExchange, NfeOutboxRabbitProperties props) {
        log.info("[OUTBOX->RABBIT] autoDeclare exchange={}, type={}, queue={}, routingKey={}",
                props.getExchange(), props.getExchangeType(), props.getQueue(), props.getRoutingKey());

        if (nfeOutboxExchange instanceof FanoutExchange fe) {
            return BindingBuilder.bind(nfeOutboxQueue).to(fe);
        }
        if (nfeOutboxExchange instanceof TopicExchange te) {
            return BindingBuilder.bind(nfeOutboxQueue).to(te).with(props.getRoutingKey());
        }
        return BindingBuilder.bind(nfeOutboxQueue).to((DirectExchange) nfeOutboxExchange).with(props.getRoutingKey());
    }
}

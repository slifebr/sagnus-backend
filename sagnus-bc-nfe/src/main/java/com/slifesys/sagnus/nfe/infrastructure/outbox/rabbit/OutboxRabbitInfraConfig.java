package com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit;

import com.slifesys.sagnus.nfe.application.config.NfeOutboxRabbitProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

/**
 * Infra Rabbit (exchange/queue/binding) para DEV/local.
 *
 * Em PROD, você pode desligar auto-declare e provisionar via infraestrutura.
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

    @Bean
    public Queue nfeOutboxQueue(NfeOutboxRabbitProperties props) {
        // Fila principal: quando o worker rejeitar (nack/reject), vai para a fila de retry.
        return QueueBuilder.durable(props.getQueue())
                .withArguments(Map.of(
                        "x-dead-letter-exchange", props.getExchange(),
                        "x-dead-letter-routing-key", props.getRetryRoutingKey()
                ))
                .build();
    }

    @Bean
    public Queue nfeOutboxRetryQueue(NfeOutboxRabbitProperties props) {
        // Fila de retry: segura a mensagem por TTL e depois devolve para a fila principal.
        return QueueBuilder.durable(props.getRetryQueue())
                .withArguments(Map.of(
                        "x-message-ttl", props.getRetryTtlMs(),
                        "x-dead-letter-exchange", props.getExchange(),
                        "x-dead-letter-routing-key", props.getRoutingKey()
                ))
                .build();
    }

    @Bean
    public Queue nfeOutboxDlq(NfeOutboxRabbitProperties props) {
        return QueueBuilder.durable(props.getDlq()).build();
    }

    @Bean
    public Binding nfeOutboxBinding(Queue nfeOutboxQueue, Exchange nfeOutboxExchange, NfeOutboxRabbitProperties props) {
        log.info("[OUTBOX->RABBIT] autoDeclare exchange={}, type={}, queue={}, routingKey={}",
                props.getExchange(), props.getExchangeType(), props.getQueue(), props.getRoutingKey());

        if (nfeOutboxExchange instanceof FanoutExchange) {
            return BindingBuilder.bind(nfeOutboxQueue).to((FanoutExchange) nfeOutboxExchange);
        }
        if (nfeOutboxExchange instanceof TopicExchange) {
            return BindingBuilder.bind(nfeOutboxQueue).to((TopicExchange) nfeOutboxExchange).with(props.getRoutingKey());
        }
        return BindingBuilder.bind(nfeOutboxQueue).to((DirectExchange) nfeOutboxExchange).with(props.getRoutingKey());
    }

    @Bean
    public Binding nfeOutboxRetryBinding(Queue nfeOutboxRetryQueue, Exchange nfeOutboxExchange, NfeOutboxRabbitProperties props) {
        if (nfeOutboxExchange instanceof FanoutExchange) {
            return BindingBuilder.bind(nfeOutboxRetryQueue).to((FanoutExchange) nfeOutboxExchange);
        }
        if (nfeOutboxExchange instanceof TopicExchange) {
            return BindingBuilder.bind(nfeOutboxRetryQueue).to((TopicExchange) nfeOutboxExchange).with(props.getRetryRoutingKey());
        }
        return BindingBuilder.bind(nfeOutboxRetryQueue).to((DirectExchange) nfeOutboxExchange).with(props.getRetryRoutingKey());
    }

    @Bean
    public Binding nfeOutboxDlqBinding(Queue nfeOutboxDlq, Exchange nfeOutboxExchange, NfeOutboxRabbitProperties props) {
        if (nfeOutboxExchange instanceof FanoutExchange) {
            return BindingBuilder.bind(nfeOutboxDlq).to((FanoutExchange) nfeOutboxExchange);
        }
        if (nfeOutboxExchange instanceof TopicExchange) {
            return BindingBuilder.bind(nfeOutboxDlq).to((TopicExchange) nfeOutboxExchange).with(props.getDlqRoutingKey());
        }
        return BindingBuilder.bind(nfeOutboxDlq).to((DirectExchange) nfeOutboxExchange).with(props.getDlqRoutingKey());
    }
}

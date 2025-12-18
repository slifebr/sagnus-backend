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
        return QueueBuilder.durable(props.getQueue()).build();
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
}

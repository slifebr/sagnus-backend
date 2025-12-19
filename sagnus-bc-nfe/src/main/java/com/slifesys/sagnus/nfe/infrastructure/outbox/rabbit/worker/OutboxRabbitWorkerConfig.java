package com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit.worker;

import com.slifesys.sagnus.nfe.application.config.NfeOutboxRabbitProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.config.SimpleRabbitListenerContainerFactory;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.support.converter.SimpleMessageConverter;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.amqp.core.AcknowledgeMode;

/**
 * Configuração do worker consumidor de eventos no Rabbit.
 */
@Slf4j
@Configuration
@ConditionalOnProperty(prefix = "sagnus.nfe.worker", name = "enabled", havingValue = "true")
public class OutboxRabbitWorkerConfig {

    @Bean
    public SimpleRabbitListenerContainerFactory nfeWorkerRabbitListenerContainerFactory(ConnectionFactory connectionFactory,
                                                                                        NfeOutboxRabbitProperties props) {
        SimpleRabbitListenerContainerFactory f = new SimpleRabbitListenerContainerFactory();
        f.setConnectionFactory(connectionFactory);
        f.setAcknowledgeMode(AcknowledgeMode.MANUAL);
        // não requeue automático em exceção; nós controlamos via nack/reject.
        f.setDefaultRequeueRejected(false);
        f.setPrefetchCount(10);
        f.setConcurrentConsumers(1);
        f.setMaxConcurrentConsumers(4);
        f.setMessageConverter(new SimpleMessageConverter());
        log.info("[WORKER] Rabbit listener factory ativo. queue={}, retryQueue={}, dlq={}, maxDeliveries={}, retryTtlMs={}",
                props.getQueue(), props.getRetryQueue(), props.getDlq(), props.getMaxDeliveries(), props.getRetryTtlMs());
        return f;
    }
}

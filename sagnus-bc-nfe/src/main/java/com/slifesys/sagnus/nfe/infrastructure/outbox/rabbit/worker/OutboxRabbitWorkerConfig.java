package com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit.worker;

import com.slifesys.sagnus.nfe.application.config.NfeOutboxRabbitProperties;
import com.slifesys.sagnus.nfe.application.config.NfeWorkerProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.AcknowledgeMode;
import org.springframework.amqp.rabbit.config.SimpleRabbitListenerContainerFactory;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.support.converter.SimpleMessageConverter;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Configuração do worker consumidor de eventos no Rabbit.
 */
@Slf4j
@Configuration
@ConditionalOnProperty(prefix = "sagnus.nfe.worker", name = "enabled", havingValue = "true")
public class OutboxRabbitWorkerConfig {

    @Bean
    public SimpleRabbitListenerContainerFactory nfeWorkerRabbitListenerContainerFactory(
            ConnectionFactory connectionFactory,
            NfeWorkerProperties workerProps,
            NfeOutboxRabbitProperties outboxRabbitProps
    ) {
        SimpleRabbitListenerContainerFactory f = new SimpleRabbitListenerContainerFactory();
        f.setConnectionFactory(connectionFactory);
        f.setAcknowledgeMode(AcknowledgeMode.MANUAL);

        // não requeue automático em exceção; nós controlamos via nack/reject.
        f.setDefaultRequeueRejected(false);

        int prefetch = workerProps.getRabbit().getPrefetch();
        int concurrency = workerProps.getRabbit().getConcurrency();
        int maxConcurrency = workerProps.getRabbit().getMaxConcurrency();

        f.setPrefetchCount(prefetch);
        f.setConcurrentConsumers(concurrency);
        f.setMaxConcurrentConsumers(maxConcurrency);
        f.setMessageConverter(new SimpleMessageConverter());

        log.info("[WORKER] Rabbit listener factory ativo. queue={}, prefetch={}, concurrency={}, maxConcurrency={}, retryQueue={}, dlq={}, maxDeliveries={}, retryTtlMs={}ms",
                outboxRabbitProps.getQueue(), prefetch, concurrency, maxConcurrency,
                outboxRabbitProps.getRetryQueue(), outboxRabbitProps.getDlq(),
                outboxRabbitProps.getMaxDeliveries(), outboxRabbitProps.getRetryTtlMs());

        return f;
    }
}

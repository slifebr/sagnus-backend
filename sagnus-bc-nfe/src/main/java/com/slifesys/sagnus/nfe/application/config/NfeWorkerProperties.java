package com.slifesys.sagnus.nfe.application.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * Configurações do Worker (consumer) do módulo NFe.
 *
 * Quando enabled=true, o processamento pós-emissão (ex.: geração de XML) ocorre via fila (RabbitMQ),
 * e listeners in-process são desativados.
 */
@Getter
@Setter
@Configuration
@ConfigurationProperties(prefix = "sagnus.nfe.worker")
public class NfeWorkerProperties {

    /** Ativa o worker consumidor. */
    private boolean enabled = false;

    /**
     * Parâmetros do listener Rabbit.
     * Observação: por padrão, ele consome da mesma fila do outbox Rabbit.
     */
    private Rabbit rabbit = new Rabbit();

    @Getter
    @Setter
    public static class Rabbit {
        /** Quantidade inicial de consumidores. */
        private int concurrency = 1;
        /** Máximo de consumidores. */
        private int maxConcurrency = 4;
        /** Quantidade de mensagens pré-buscadas por consumer antes de ACK. */
        private int prefetch = 20;
        /** Se true, manda falhas para DLQ (requeue=false). */
        private boolean dlqOnError = true;
    }
}

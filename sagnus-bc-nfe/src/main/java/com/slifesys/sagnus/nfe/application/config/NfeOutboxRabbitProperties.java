package com.slifesys.sagnus.nfe.application.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Configuração do transporte RabbitMQ para o Outbox.
 *
 * Filosofia: "fila de trabalho".
 * - Outbox envia uma mensagem por evento.
 * - Consumidores fazem ACK/Retry/DLQ no próprio Rabbit.
 */
@ConfigurationProperties(prefix = "sagnus.nfe.outbox.rabbit")
public class NfeOutboxRabbitProperties {

    /**
     * Se true, declara exchange/queue/binding via Spring (útil em DEV).
     * Em PROD, normalmente a infra declara.
     */
    private boolean autoDeclare = true;

    /** Exchange do Rabbit para os eventos do NFe. */
    private String exchange = "sagnus.nfe.events";

    /** Tipo de exchange: direct|topic|fanout. */
    private String exchangeType = "direct";

    /** Nome da fila (quando autoDeclare=true). */
    private String queue = "sagnus.nfe.events.q";

    /** Fila de retry (TTL) (quando autoDeclare=true). */
    private String retryQueue = "sagnus.nfe.events.retry.q";

    /** Fila dead-letter (DLQ) (quando autoDeclare=true). */
    private String dlq = "sagnus.nfe.events.dlq";

    /** Routing key usada no publish (direct/topic). */
    private String routingKey = "nfe.event";

    /** Routing key para mensagens em retry (dead-letter do consumidor). */
    private String retryRoutingKey = "nfe.event.retry";

    /** Routing key para DLQ (quando exceder tentativas). */
    private String dlqRoutingKey = "nfe.event.dlq";

    /** TTL (ms) da fila de retry antes de voltar para a fila principal. */
    private int retryTtlMs = 10_000;

    /** Máximo de tentativas no worker antes de enviar para DLQ. */
    private int maxDeliveries = 10;

    public boolean isAutoDeclare() {
        return autoDeclare;
    }

    public void setAutoDeclare(boolean autoDeclare) {
        this.autoDeclare = autoDeclare;
    }

    public String getExchange() {
        return exchange;
    }

    public void setExchange(String exchange) {
        this.exchange = exchange;
    }

    public String getExchangeType() {
        return exchangeType;
    }

    public void setExchangeType(String exchangeType) {
        this.exchangeType = exchangeType;
    }

    public String getQueue() {
        return queue;
    }

    public void setQueue(String queue) {
        this.queue = queue;
    }

    public String getRetryQueue() {
        return retryQueue;
    }

    public void setRetryQueue(String retryQueue) {
        this.retryQueue = retryQueue;
    }

    public String getDlq() {
        return dlq;
    }

    public void setDlq(String dlq) {
        this.dlq = dlq;
    }

    public String getRoutingKey() {
        return routingKey;
    }

    public void setRoutingKey(String routingKey) {
        this.routingKey = routingKey;
    }

    public String getRetryRoutingKey() {
        return retryRoutingKey;
    }

    public void setRetryRoutingKey(String retryRoutingKey) {
        this.retryRoutingKey = retryRoutingKey;
    }

    public String getDlqRoutingKey() {
        return dlqRoutingKey;
    }

    public void setDlqRoutingKey(String dlqRoutingKey) {
        this.dlqRoutingKey = dlqRoutingKey;
    }

    public int getRetryTtlMs() {
        return retryTtlMs;
    }

    public void setRetryTtlMs(int retryTtlMs) {
        this.retryTtlMs = retryTtlMs;
    }

    public int getMaxDeliveries() {
        return maxDeliveries;
    }

    public void setMaxDeliveries(int maxDeliveries) {
        this.maxDeliveries = maxDeliveries;
    }
}

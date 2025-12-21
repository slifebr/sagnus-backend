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

    /** Routing key usada no publish (direct/topic). */
    private String routingKey = "nfe.event";

    /** Habilita DLQ em DEV/local (via autoDeclare). */
    private boolean dlqEnabled = true;

    /** Exchange DLX para dead-letter (quando dlqEnabled=true). */
    private String dlxExchange = "sagnus.nfe.events.dlx";

    /** Fila DLQ (quando dlqEnabled=true). */
    private String dlq = "sagnus.nfe.events.dlq";

    /** Routing key usada para enviar para DLQ (quando dlqEnabled=true). */
    private String dlqRoutingKey = "nfe.event.dlq";

    /**  */
    private String retryQueue = "sagnus.nfe.events.retry.q";
    private int maxDeliveries = 3;
    private int retryTtlMs = 60000;

    public String getRetryQueue() {
        return retryQueue;
    }

    public void setRetryQueue(String retryQueue) {
        this.retryQueue = retryQueue;
    }

    public int getMaxDeliveries() {
        return maxDeliveries;
    }

    public void setMaxDeliveries(int maxDeliveries) {
        this.maxDeliveries = maxDeliveries;
    }

    public int getRetryTtlMs() {
        return retryTtlMs;
    }

    public void setRetryTtlMs(int retryTtlMs) {
        this.retryTtlMs = retryTtlMs;
    }

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

    public String getRoutingKey() {
        return routingKey;
    }

    public void setRoutingKey(String routingKey) {
        this.routingKey = routingKey;
    }

    public boolean isDlqEnabled() {
        return dlqEnabled;
    }

    public void setDlqEnabled(boolean dlqEnabled) {
        this.dlqEnabled = dlqEnabled;
    }

    public String getDlxExchange() {
        return dlxExchange;
    }

    public void setDlxExchange(String dlxExchange) {
        this.dlxExchange = dlxExchange;
    }

    public String getDlq() {
        return dlq;
    }

    public void setDlq(String dlq) {
        this.dlq = dlq;
    }

    public String getDlqRoutingKey() {
        return dlqRoutingKey;
    }

    public void setDlqRoutingKey(String dlqRoutingKey) {
        this.dlqRoutingKey = dlqRoutingKey;
    }
}

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
}

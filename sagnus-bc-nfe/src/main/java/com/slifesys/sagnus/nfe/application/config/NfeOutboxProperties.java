package com.slifesys.sagnus.nfe.application.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Outbox (padrão transacional) para eventos de domínio.
 *
 * Objetivo:
 * - garantir atomicidade: "salva agregado + enfileira evento" na mesma transação
 * - entregar com retries/backoff e marcação de DEAD quando exceder tentativas
 *
 * Propriedades:
 * - sagnus.nfe.outbox.enabled: true|false
 * - sagnus.nfe.outbox.pollIntervalMs: intervalo de polling (ms)
 * - sagnus.nfe.outbox.batchSize: tamanho do lote
 * - sagnus.nfe.outbox.maxAttempts: máximo de tentativas antes de marcar DEAD
 * - sagnus.nfe.outbox.lockTtlSeconds: TTL do lock (recovery se worker cair)
 * - sagnus.nfe.outbox.backoffInitialMs/multiplier/maxMs: backoff exponencial
 * - sagnus.nfe.outbox.transport: LOG (default) | RABBIT
 */
@ConfigurationProperties(prefix = "sagnus.nfe.outbox")
public class NfeOutboxProperties {

    public enum Transport {
        LOG,
        RABBIT
    }

    private boolean enabled = true;

    /** polling do dispatcher */
    private long pollIntervalMs = 2000;

    /** número máximo de eventos por ciclo */
    private int batchSize = 50;

    /** máximo de tentativas antes de marcar DEAD */
    private int maxAttempts = 10;

    /** TTL do lock de processamento, em segundos */
    private long lockTtlSeconds = 300;

    /** backoff exponencial */
    private long backoffInitialMs = 1000;
    private double backoffMultiplier = 2.0;
    private long backoffMaxMs = 600_000;

    private Transport transport = Transport.LOG;

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public long getPollIntervalMs() {
        return pollIntervalMs;
    }

    public void setPollIntervalMs(long pollIntervalMs) {
        this.pollIntervalMs = pollIntervalMs;
    }

    public int getBatchSize() {
        return batchSize;
    }

    public void setBatchSize(int batchSize) {
        this.batchSize = batchSize;
    }

    public int getMaxAttempts() {
        return maxAttempts;
    }

    public void setMaxAttempts(int maxAttempts) {
        this.maxAttempts = maxAttempts;
    }

    public long getLockTtlSeconds() {
        return lockTtlSeconds;
    }

    public void setLockTtlSeconds(long lockTtlSeconds) {
        this.lockTtlSeconds = lockTtlSeconds;
    }

    public long getBackoffInitialMs() {
        return backoffInitialMs;
    }

    public void setBackoffInitialMs(long backoffInitialMs) {
        this.backoffInitialMs = backoffInitialMs;
    }

    public double getBackoffMultiplier() {
        return backoffMultiplier;
    }

    public void setBackoffMultiplier(double backoffMultiplier) {
        this.backoffMultiplier = backoffMultiplier;
    }

    public long getBackoffMaxMs() {
        return backoffMaxMs;
    }

    public void setBackoffMaxMs(long backoffMaxMs) {
        this.backoffMaxMs = backoffMaxMs;
    }

    public Transport getTransport() {
        return transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }
}

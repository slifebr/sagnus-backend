package com.slifesys.sagnus.nfe.application.context;

/**
 * CorrelationId do request (ThreadLocal).
 *
 * Objetivo:
 * - correlacionar logs e DomainEvents com a chamada HTTP que originou o processamento.
 *
 * Observação:
 * - em cenários assíncronos/thread pool, propagar via MDC/TaskDecorator (etapa futura).
 */
public final class CorrelationIdHolder {

    private static final ThreadLocal<String> TL = new ThreadLocal<>();

    private CorrelationIdHolder() {}

    public static void set(String correlationId) {
        TL.set(correlationId);
    }

    public static String get() {
        return TL.get();
    }

    public static void clear() {
        TL.remove();
    }
}

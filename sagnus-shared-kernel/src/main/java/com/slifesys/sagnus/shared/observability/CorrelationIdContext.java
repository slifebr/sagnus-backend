package com.slifesys.sagnus.shared.observability;

import org.slf4j.MDC;

/**
 * Contexto de CorrelationId (ThreadLocal + MDC).
 *
 * Objetivo:
 * - Padronizar o acesso ao correlationId em fluxos HTTP e em workers/outbox.
 * - Evitar implementação duplicada em cada BC.
 *
 * Regras:
 * - Quem cria/define o correlationId (filtros HTTP, listeners, workers) deve chamar {@link #set(String)}.
 * - Quem só consome deve chamar {@link #get()}.
 */
public final class CorrelationIdContext {

    private static final ThreadLocal<String> TL = new ThreadLocal<>();

    private CorrelationIdContext() {
    }

    /**
     * Define o correlationId no ThreadLocal e propaga no MDC.
     */
    public static void set(String correlationId) {
        if (correlationId == null || correlationId.isBlank()) {
            return;
        }
        String cid = correlationId.trim();
        TL.set(cid);
        MDC.put(CorrelationId.MDC_KEY, cid);
    }

    /**
     * Obtém o correlationId do ThreadLocal; se vazio, tenta o MDC.
     */
    public static String get() {
        String cid = TL.get();
        if (cid == null || cid.isBlank()) {
            cid = MDC.get(CorrelationId.MDC_KEY);
        }
        return cid;
    }

    /**
     * Limpa o contexto.
     */
    public static void clear() {
        TL.remove();
        MDC.remove(CorrelationId.MDC_KEY);
    }
}

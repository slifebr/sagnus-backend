package com.slifesys.sagnus.platform.security.web;

/**
 * Contrato de correlação do Sagnus:
 * - Header padrão: X-Correlation-Id
 * - Attribute no request: sagnusCorrelationId
 * - MDC key: correlationId
 */
public final class CorrelationId {
    private CorrelationId() {}

    public static final String HEADER = "X-Correlation-Id";
    public static final String ATTRIBUTE = "sagnusCorrelationId";
    public static final String MDC_KEY = "correlationId";
}

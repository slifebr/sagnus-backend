package com.slifesys.sagnus.nfe.api.filter;

import com.slifesys.sagnus.nfe.application.context.CorrelationIdHolder;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.MDC;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.UUID;

/**
 * CorrelationId por request.
 *
 * Lê (nessa ordem):
 * - X-Correlation-Id
 * - X-Request-Id
 *
 * Se não houver, gera um UUID compactado.
 *
 * Propaga:
 * - MDC (chave: correlationId)
 * - CorrelationIdHolder (ThreadLocal)
 * - response header X-Correlation-Id
 */
@Component
public class NfeCorrelationIdFilter extends OncePerRequestFilter {

    public static final String HEADER_CORRELATION_ID = "X-Correlation-Id";
    public static final String HEADER_REQUEST_ID = "X-Request-Id";
    public static final String MDC_KEY = "correlationId";

    @Override
    protected void doFilterInternal(HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain) throws ServletException, IOException {

        String cid = firstNonBlank(request.getHeader(HEADER_CORRELATION_ID), request.getHeader(HEADER_REQUEST_ID));
        if (cid == null) {
            cid = UUID.randomUUID().toString().replace("-", "");
        }

        // aplica contexto
        CorrelationIdHolder.set(cid);
        MDC.put(MDC_KEY, cid);

        // retorna no response para rastreabilidade
        response.setHeader(HEADER_CORRELATION_ID, cid);

        try {
            filterChain.doFilter(request, response);
        } finally {
            MDC.remove(MDC_KEY);
            CorrelationIdHolder.clear();
        }
    }

    private static String firstNonBlank(String a, String b) {
        if (a != null && !a.isBlank())
            return a.trim();
        if (b != null && !b.isBlank())
            return b.trim();
        return null;
    }
}

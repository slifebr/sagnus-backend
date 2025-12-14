package com.slifesys.sagnus.auth.infrastructure.web;

import com.slifesys.sagnus.auth.shared.CorrelationId;
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
 * Gera/propaga correlationId:
 * - Se vier no header X-Correlation-Id, reaproveita.
 * - Se não vier, gera.
 * - Publica no request attribute e no MDC (para logs).
 * - Devolve no response header para o cliente rastrear.
 */
@Component
public class CorrelationIdFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {

        String cid = request.getHeader(CorrelationId.HEADER);
        if (cid == null || cid.isBlank()) {
            cid = UUID.randomUUID().toString().replace("-", "");
        }

        request.setAttribute(CorrelationId.ATTRIBUTE, cid);
        MDC.put(CorrelationId.MDC_KEY, cid);

        // garante retorno do header (mesmo em erro)
        response.setHeader(CorrelationId.HEADER, cid);

        try {
            filterChain.doFilter(request, response);
        } finally {
            MDC.remove(CorrelationId.MDC_KEY);
        }
    }
}

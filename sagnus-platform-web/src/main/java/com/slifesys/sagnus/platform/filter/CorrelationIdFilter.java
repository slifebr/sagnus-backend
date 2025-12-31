package com.slifesys.sagnus.platform.filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.UUID;

@org.springframework.stereotype.Component
@org.springframework.core.annotation.Order(org.springframework.core.Ordered.HIGHEST_PRECEDENCE)
public class CorrelationIdFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain) throws ServletException, IOException {

        String cid = request.getHeader(com.slifesys.sagnus.shared.observability.CorrelationId.HEADER);
        if (cid == null || cid.isBlank()) {
            cid = UUID.randomUUID().toString().replace("-", "");
        }

        request.setAttribute(com.slifesys.sagnus.shared.observability.CorrelationId.ATTRIBUTE, cid);
        org.slf4j.MDC.put(com.slifesys.sagnus.shared.observability.CorrelationId.MDC_KEY, cid);
        response.setHeader(com.slifesys.sagnus.shared.observability.CorrelationId.HEADER, cid);

        try {
            filterChain.doFilter(request, response);
        } finally {
            org.slf4j.MDC.remove(com.slifesys.sagnus.shared.observability.CorrelationId.MDC_KEY);
        }
    }
}

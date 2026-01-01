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

    private static final String HEADER_REQUEST_ID = "X-Request-Id";

    @Override
    protected void doFilterInternal(HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain) throws ServletException, IOException {

        String cid = firstNonBlank(
                request.getHeader(com.slifesys.sagnus.shared.observability.CorrelationId.HEADER),
                request.getHeader(HEADER_REQUEST_ID));
        if (cid == null || cid.isBlank()) {
            cid = UUID.randomUUID().toString().replace("-", "");
        }

        request.setAttribute(com.slifesys.sagnus.shared.observability.CorrelationId.ATTRIBUTE, cid);
        com.slifesys.sagnus.shared.observability.CorrelationIdContext.set(cid);
        response.setHeader(com.slifesys.sagnus.shared.observability.CorrelationId.HEADER, cid);

        try {
            filterChain.doFilter(request, response);
        } finally {
            com.slifesys.sagnus.shared.observability.CorrelationIdContext.clear();
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

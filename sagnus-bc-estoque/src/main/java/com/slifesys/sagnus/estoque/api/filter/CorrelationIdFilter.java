package com.slifesys.sagnus.estoque.api.filter;

import com.slifesys.sagnus.shared.observability.CorrelationId;
import com.slifesys.sagnus.shared.observability.CorrelationIdContext;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CorrelationIdFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String correlationId = httpServletRequest.getHeader(CorrelationId.HEADER);

        CorrelationIdContext.set(correlationId);

        try {
            chain.doFilter(request, response);
        } finally {
            CorrelationIdContext.clear();
        }
    }
}

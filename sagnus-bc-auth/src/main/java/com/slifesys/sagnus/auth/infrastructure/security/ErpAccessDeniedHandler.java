package com.slifesys.sagnus.auth.infrastructure.security;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.slifesys.sagnus.shared.error.ErrorResponse;
import com.slifesys.sagnus.shared.error.ErrorType;
import com.slifesys.sagnus.auth.shared.CorrelationId;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.UUID;

/**
 * Padroniza o JSON de erro 403 (autenticado, mas sem permissão),
 * alinhado ao sagnus-shared-api-error.
 */
@Component
public class ErpAccessDeniedHandler implements AccessDeniedHandler {

    private final ObjectMapper mapper = new ObjectMapper();

    @Override
    public void handle(HttpServletRequest request,
                       HttpServletResponse response,
                       AccessDeniedException accessDeniedException) throws IOException, ServletException {

        String correlationId = (String) request.getAttribute(CorrelationId.ATTRIBUTE);
        if (correlationId == null || correlationId.isBlank()) {
            correlationId = java.util.UUID.randomUUID().toString().replace("-", "");
        }
        String path = request.getRequestURI();

        ErrorResponse body = ErrorResponse.of(
                HttpStatus.FORBIDDEN.value(),
                HttpStatus.FORBIDDEN.getReasonPhrase(),
                "AUTH-403",
                "Acesso negado.",
                path,
                correlationId,
                ErrorType.ACCESS_DENIED
        );

        response.setStatus(HttpStatus.FORBIDDEN.value());
        response.setContentType("application/json;charset=UTF-8");
        mapper.writeValue(response.getOutputStream(), body);
    }
}

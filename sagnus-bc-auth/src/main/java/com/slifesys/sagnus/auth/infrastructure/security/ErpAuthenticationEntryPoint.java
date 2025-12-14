package com.slifesys.sagnus.auth.infrastructure.security;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.slifesys.sagnus.shared.error.ErrorResponse;
import com.slifesys.sagnus.shared.error.ErrorType;
import com.slifesys.sagnus.auth.shared.CorrelationId;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.UUID;

/**
 * Padroniza o JSON de erro 401 (não autenticado / token inválido / expirado),
 * alinhado ao sagnus-shared-api-error.
 */
@Component
public class ErpAuthenticationEntryPoint implements AuthenticationEntryPoint {

    private final ObjectMapper mapper = new ObjectMapper();

    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authException) throws IOException, ServletException {

        String correlationId = (String) request.getAttribute(CorrelationId.ATTRIBUTE);
        if (correlationId == null || correlationId.isBlank()) {
            correlationId = java.util.UUID.randomUUID().toString().replace("-", "");
        }
        String path = request.getRequestURI();

        ErrorResponse body = ErrorResponse.of(
                HttpStatus.UNAUTHORIZED.value(),
                HttpStatus.UNAUTHORIZED.getReasonPhrase(),
                "AUTH-401",
                "Não autenticado ou token inválido.",
                path,
                correlationId,
                ErrorType.AUTH_ERROR
        );

        response.setStatus(HttpStatus.UNAUTHORIZED.value());
        response.setHeader("WWW-Authenticate", "Bearer");
        response.setContentType("application/json;charset=UTF-8");
        mapper.writeValue(response.getOutputStream(), body);
    }
}

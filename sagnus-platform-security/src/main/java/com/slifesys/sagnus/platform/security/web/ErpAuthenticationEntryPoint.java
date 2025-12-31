package com.slifesys.sagnus.platform.security.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.slifesys.sagnus.shared.error.ErrorResponse;
import com.slifesys.sagnus.shared.error.ErrorType;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import com.slifesys.sagnus.shared.observability.CorrelationId;
import java.io.IOException;
import java.util.UUID;

/**
 * Padroniza o JSON de erro 401 (não autenticado / token inválido/expirado).
 */
@Component
public class ErpAuthenticationEntryPoint implements AuthenticationEntryPoint {

    private final ObjectMapper mapper = new ObjectMapper();

    @Override
    public void commence(HttpServletRequest request,
            HttpServletResponse response,
            AuthenticationException authException) throws IOException {

        String correlationId = (String) request.getAttribute(CorrelationId.ATTRIBUTE);
        if (correlationId == null || correlationId.isBlank()) {
            correlationId = UUID.randomUUID().toString().replace("-", "");
        }

        ErrorResponse body = ErrorResponse.of(
                HttpStatus.UNAUTHORIZED.value(),
                HttpStatus.UNAUTHORIZED.getReasonPhrase(),
                "AUTH-401",
                "Não autenticado ou token inválido.",
                request.getRequestURI(),
                correlationId,
                ErrorType.AUTH_ERROR);

        response.setStatus(HttpStatus.UNAUTHORIZED.value());
        response.setHeader("WWW-Authenticate", "Bearer");
        response.setContentType("application/json;charset=UTF-8");
        mapper.writeValue(response.getOutputStream(), body);
    }
}

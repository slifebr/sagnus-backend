package com.slifesys.sagnus.security;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.slifesys.sagnus.api.error.ApiErrorResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.UUID;

@Component
public class RestAuthenticationEntryPoint implements AuthenticationEntryPoint {

    // estes atributos serão preenchidos pelo JWTAuthorizationFilter
    public static final String ATTR_JWT_ERROR_MESSAGE = "JWT_ERROR_MESSAGE";
    public static final String ATTR_JWT_ERROR_CODE    = "JWT_ERROR_CODE";

    private final ObjectMapper mapper;

    public RestAuthenticationEntryPoint(ObjectMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authException) throws IOException {

        String correlationId = UUID.randomUUID().toString().replace("-", "");

        // defaults
        int status          = HttpStatus.UNAUTHORIZED.value();
        String error        = HttpStatus.UNAUTHORIZED.getReasonPhrase();
        String code         = "UNAUTHORIZED";
        String message      = "Token ausente ou inválido.";
        String requestPath  = request.getRequestURI();

        // se o filtro JWT tiver colocado uma mensagem/código mais específico
        Object attrMsg = request.getAttribute(ATTR_JWT_ERROR_MESSAGE);
        Object attrCod = request.getAttribute(ATTR_JWT_ERROR_CODE);

        if (attrMsg instanceof String s && !s.isBlank()) {
            message = s;
        }
        if (attrCod instanceof String s && !s.isBlank()) {
            code = s;
        }

        ApiErrorResponse body = ApiErrorResponse.of(
                status,
                error,
                code,        // ex: ERP-AUTH-401-JWT-EXPIRED
                message,     // ex: "Token JWT expirado."
                requestPath,
                correlationId
        );

        response.setStatus(status);
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        response.setCharacterEncoding("UTF-8");

        mapper.writeValue(response.getWriter(), body);
    }
}

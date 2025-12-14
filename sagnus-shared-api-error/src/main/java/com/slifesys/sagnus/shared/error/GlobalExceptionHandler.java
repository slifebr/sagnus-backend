package com.slifesys.sagnus.shared.error;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.UUID;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(BaseException.class)
    public ResponseEntity<ErrorResponse> handleBase(BaseException ex, HttpServletRequest req) {

        String correlationId = (String) req.getAttribute("sagnusCorrelationId");
        if (correlationId == null) {
            correlationId = UUID.randomUUID().toString().replace("-", "");
        }

        ErrorResponse resp = ErrorResponse.of(
                ex.getHttpStatus().value(),
                ex.getHttpStatus().getReasonPhrase(),
                ex.getCode(),
                ex.getMessage(),
                req.getRequestURI(),
                correlationId,
                ex.getErrorType()
        );

        return ResponseEntity.status(ex.getHttpStatus()).body(resp);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponse> handleGeneric(Exception ex, HttpServletRequest req) {

        String correlationId = (String) req.getAttribute("sagnusCorrelationId");
        if (correlationId == null) {
            correlationId = UUID.randomUUID().toString().replace("-", "");
        }

        ErrorResponse resp = ErrorResponse.of(
                500,
                "Internal Server Error",
                "GEN-500",
                "Erro interno inesperado.",
                req.getRequestURI(),
                correlationId,
                ErrorType.INTERNAL_ERROR
        );

        return ResponseEntity.status(500).body(resp);
    }
}

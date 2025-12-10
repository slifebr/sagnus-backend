package com.slifesys.sagnus.api.error;

import com.slifesys.sagnus.core.exception.BusinessException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.ErrorResponseException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.UUID;

@RestControllerAdvice
public class GlobalExceptionHandler {

    // ====== Validação de @Valid em DTOs (body) ======
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ApiErrorResponse> handleMethodArgumentNotValid(
            MethodArgumentNotValidException ex,
            HttpServletRequest request) {

        String correlationId = gerarCorrelationId();

        ApiErrorResponse resp = ApiErrorResponse.of(
                HttpStatus.BAD_REQUEST.value(),
                HttpStatus.BAD_REQUEST.getReasonPhrase(),
                "VALIDATION_ERROR",
                "Dados de entrada inválidos.",
                request.getRequestURI(),
                correlationId,
                ErrorType.VALIDATION_ERROR
        );

        ex.getBindingResult().getFieldErrors().forEach(fe ->
                resp.addFieldError(fe.getField(), fe.getDefaultMessage())
        );

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(resp);
    }

    // ====== Validação em parâmetros (ex: @RequestParam, @PathVariable) ======
    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<ApiErrorResponse> handleConstraintViolation(
            ConstraintViolationException ex,
            HttpServletRequest request) {

        String correlationId = gerarCorrelationId();

        ApiErrorResponse resp = ApiErrorResponse.of(
                HttpStatus.BAD_REQUEST.value(),
                HttpStatus.BAD_REQUEST.getReasonPhrase(),
                "VALIDATION_ERROR",
                "Dados de entrada inválidos.",
                request.getRequestURI(),
                correlationId,
                ErrorType.VALIDATION_ERROR
        );

        for (ConstraintViolation<?> violation : ex.getConstraintViolations()) {
            String field = violation.getPropertyPath().toString();
            resp.addFieldError(field, violation.getMessage());
        }

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(resp);
    }

    // ====== JSON mal formado, tipo errado no body, etc. ======
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<ApiErrorResponse> handleHttpMessageNotReadable(
            HttpMessageNotReadableException ex,
            HttpServletRequest request) {

        String correlationId = gerarCorrelationId();

        ApiErrorResponse resp = ApiErrorResponse.of(
                HttpStatus.BAD_REQUEST.value(),
                HttpStatus.BAD_REQUEST.getReasonPhrase(),
                "INVALID_REQUEST_BODY",
                "Corpo da requisição inválido ou mal formatado.",
                request.getRequestURI(),
                correlationId,
                ErrorType.BAD_REQUEST
        );

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(resp);
    }

    // ====== Exceções de negócio ======
    @ExceptionHandler(BusinessException.class)
    public ResponseEntity<ApiErrorResponse> handleBusinessException(
            BusinessException ex,
            HttpServletRequest request) {

        String correlationId = gerarCorrelationId();
        HttpStatus status = ex.getHttpStatus() != null
                ? ex.getHttpStatus()
                : HttpStatus.BAD_REQUEST;

        ApiErrorResponse resp = ApiErrorResponse.of(
                status.value(),
                status.getReasonPhrase(),
                ex.getCode(),
                ex.getMessage(),
                request.getRequestURI(),
                correlationId,
                ex.getErrorType() != null ? ex.getErrorType() : ErrorType.BUSINESS_ERROR
        );

        return ResponseEntity.status(status).body(resp);
    }

    // ====== Erro de credenciais (caso BadCredentialsException suba) ======
    @ExceptionHandler(BadCredentialsException.class)
    public ResponseEntity<ApiErrorResponse> handleBadCredentials(
            BadCredentialsException ex,
            HttpServletRequest request) {

        String correlationId = gerarCorrelationId();
        HttpStatus status = HttpStatus.UNAUTHORIZED;

        ApiErrorResponse resp = ApiErrorResponse.of(
                status.value(),
                status.getReasonPhrase(),
                "AUTH_INVALID_CREDENTIALS",
                "Usuário ou senha inválidos.",
                request.getRequestURI(),
                correlationId,
                ErrorType.AUTH_ERROR
        );

        return ResponseEntity.status(status).body(resp);
    }

    // ====== Violação de integridade de dados (FK, unique, etc.) ======
    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<ApiErrorResponse> handleDataIntegrity(
            DataIntegrityViolationException ex,
            HttpServletRequest request) {

        String correlationId = gerarCorrelationId();

        ApiErrorResponse resp = ApiErrorResponse.of(
                HttpStatus.CONFLICT.value(),
                HttpStatus.CONFLICT.getReasonPhrase(),
                "DATA_INTEGRITY_VIOLATION",
                "Operação não permitida devido a restrição de integridade.",
                request.getRequestURI(),
                correlationId,
                ErrorType.BUSINESS_ERROR
        );

        return ResponseEntity.status(HttpStatus.CONFLICT).body(resp);
    }

    // ===== Erros do Spring mais "genéricos" com status embutido (404, 405, etc.) =====
    @ExceptionHandler(ErrorResponseException.class)
    public ResponseEntity<ApiErrorResponse> handleErrorResponseException(
            ErrorResponseException ex,
            HttpServletRequest request) {

        String correlationId = gerarCorrelationId();

        HttpStatusCode statusCode = ex.getStatusCode();
        HttpStatus httpStatus = HttpStatus.resolve(statusCode.value());
        String error = (httpStatus != null
                ? httpStatus.getReasonPhrase()
                : statusCode.toString());

        String message;
        if (ex.getBody() != null && ex.getBody().getDetail() != null) {
            message = ex.getBody().getDetail();
        } else {
            message = ex.getMessage();
        }

        ErrorType type;
        if (statusCode.is4xxClientError()) {
            type = ErrorType.BAD_REQUEST;
        } else if (statusCode.is5xxServerError()) {
            type = ErrorType.INTERNAL_ERROR;
        } else {
            type = ErrorType.BUSINESS_ERROR;
        }

        ApiErrorResponse resp = ApiErrorResponse.of(
                statusCode.value(),
                error,
                "GENERIC_ERROR",
                message,
                request.getRequestURI(),
                correlationId,
                type
        );

        return ResponseEntity.status(statusCode).body(resp);
    }

    // ====== Fallback geral (NullPointer, etc.) ======
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiErrorResponse> handleGenericException(
            Exception ex,
            HttpServletRequest request) {

        String correlationId = gerarCorrelationId();
        HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;

        ApiErrorResponse resp = ApiErrorResponse.of(
                status.value(),
                status.getReasonPhrase(),
                "INTERNAL_ERROR",
                "Erro interno inesperado.",
                request.getRequestURI(),
                correlationId,
                ErrorType.INTERNAL_ERROR
        );

        // aqui você pode logar com stack trace e correlationId
        ex.printStackTrace();

        return ResponseEntity.status(status).body(resp);
    }

    private String gerarCorrelationId() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}

package com.slifesys.sagnus.platform.error;

import com.slifesys.sagnus.platform.filter.CorrelationIdFilter;
import com.slifesys.sagnus.shared.error.BusinessException;
import com.slifesys.sagnus.shared.error.ErrorResponse;
import com.slifesys.sagnus.shared.error.ErrorType;
import com.slifesys.sagnus.shared.observability.CorrelationId;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.ErrorResponseException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@org.springframework.stereotype.Component("platformGlobalExceptionHandler")
public class GlobalExceptionHandler {

    // ====== Validação de @Valid em DTOs (body) ======
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ErrorResponse> handleMethodArgumentNotValid(
            MethodArgumentNotValidException ex,
            HttpServletRequest request) {

        String correlationId = correlationId(request);

        ErrorResponse resp = ErrorResponse.of(
                HttpStatus.BAD_REQUEST.value(),
                HttpStatus.BAD_REQUEST.getReasonPhrase(),
                "VALIDATION_ERROR",
                "Dados de entrada inválidos.",
                request.getRequestURI(),
                correlationId,
                ErrorType.VALIDATION_ERROR);

        ex.getBindingResult().getFieldErrors().forEach(fe -> resp.addFieldError(fe.getField(), fe.getDefaultMessage()));

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(resp);
    }

    // ====== Validação em parâmetros (@RequestParam, @PathVariable) ======
    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<ErrorResponse> handleConstraintViolation(
            ConstraintViolationException ex,
            HttpServletRequest request) {

        String correlationId = correlationId(request);

        ErrorResponse resp = ErrorResponse.of(
                HttpStatus.BAD_REQUEST.value(),
                HttpStatus.BAD_REQUEST.getReasonPhrase(),
                "VALIDATION_ERROR",
                "Dados de entrada inválidos.",
                request.getRequestURI(),
                correlationId,
                ErrorType.VALIDATION_ERROR);

        for (ConstraintViolation<?> violation : ex.getConstraintViolations()) {
            String field = violation.getPropertyPath().toString();
            resp.addFieldError(field, violation.getMessage());
        }

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(resp);
    }

    // ====== JSON mal formado, tipo errado no body, etc. ======
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<ErrorResponse> handleHttpMessageNotReadable(
            HttpMessageNotReadableException ex,
            HttpServletRequest request) {

        String correlationId = correlationId(request);

        ErrorResponse resp = ErrorResponse.of(
                HttpStatus.BAD_REQUEST.value(),
                HttpStatus.BAD_REQUEST.getReasonPhrase(),
                "INVALID_REQUEST_BODY",
                "Corpo da requisição inválido ou mal formatado.",
                request.getRequestURI(),
                correlationId,
                ErrorType.BAD_REQUEST);

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(resp);
    }

    // ====== Exceções de negócio ======
    @ExceptionHandler(BusinessException.class)
    public ResponseEntity<ErrorResponse> handleBusinessException(
            BusinessException ex,
            HttpServletRequest request) {

        String correlationId = correlationId(request);

        HttpStatus status = mapToHttpStatus(ex.getErrorType());

        ErrorResponse resp = ErrorResponse.of(
                status.value(),
                status.getReasonPhrase(),
                ex.getCode(),
                ex.getMessage(),
                request.getRequestURI(),
                correlationId,
                ex.getErrorType() != null ? ex.getErrorType() : ErrorType.BUSINESS_ERROR);

        return ResponseEntity.status(status).body(resp);
    }

    // ====== Erro de credenciais (se subir) ======
    @ExceptionHandler(BadCredentialsException.class)
    public ResponseEntity<ErrorResponse> handleBadCredentials(
            BadCredentialsException ex,
            HttpServletRequest request) {

        String correlationId = correlationId(request);
        HttpStatus status = HttpStatus.UNAUTHORIZED;

        ErrorResponse resp = ErrorResponse.of(
                status.value(),
                status.getReasonPhrase(),
                "AUTH_INVALID_CREDENTIALS",
                "Usuário ou senha inválidos.",
                request.getRequestURI(),
                correlationId,
                ErrorType.AUTH_ERROR);

        return ResponseEntity.status(status).body(resp);
    }

    // ====== Violação de integridade (FK, unique, etc.) ======
    // @ExceptionHandler(DataIntegrityViolationException.class)
    // public ResponseEntity<ErrorResponse> handleDataIntegrity(
    // DataIntegrityViolationException ex,
    // HttpServletRequest request) {
    //
    // String correlationId = correlationId(request);
    // HttpStatus status = HttpStatus.CONFLICT;
    //
    // ErrorResponse resp = ErrorResponse.of(
    // status.value(),
    // status.getReasonPhrase(),
    // "DATA_INTEGRITY_VIOLATION",
    // "Operação não permitida devido a restrição de integridade.",
    // request.getRequestURI(),
    // correlationId,
    // ErrorType.BUSINESS_ERROR
    // );
    //
    // return ResponseEntity.status(status).body(resp);
    // }

    // ===== Erros do Spring (404/405 etc.) =====
    @ExceptionHandler(ErrorResponseException.class)
    public ResponseEntity<ErrorResponse> handleErrorResponseException(
            ErrorResponseException ex,
            HttpServletRequest request) {

        String correlationId = correlationId(request);

        HttpStatusCode statusCode = ex.getStatusCode();
        HttpStatus httpStatus = HttpStatus.resolve(statusCode.value());
        String error = (httpStatus != null ? httpStatus.getReasonPhrase() : statusCode.toString());

        String message = (ex.getBody() != null && ex.getBody().getDetail() != null)
                ? ex.getBody().getDetail()
                : ex.getMessage();

        ErrorType type;
        if (statusCode.is4xxClientError())
            type = ErrorType.BAD_REQUEST;
        else if (statusCode.is5xxServerError())
            type = ErrorType.INTERNAL_ERROR;
        else
            type = ErrorType.BUSINESS_ERROR;

        ErrorResponse resp = ErrorResponse.of(
                statusCode.value(),
                error,
                "GENERIC_ERROR",
                message,
                request.getRequestURI(),
                correlationId,
                type);

        return ResponseEntity.status(statusCode).body(resp);
    }

    // ====== Fallback geral ======
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponse> handleGenericException(
            Exception ex,
            HttpServletRequest request) {

        String correlationId = correlationId(request);
        HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;

        ErrorResponse resp = ErrorResponse.of(
                status.value(),
                status.getReasonPhrase(),
                "INTERNAL_ERROR",
                "Erro interno inesperado.",
                request.getRequestURI(),
                correlationId,
                ErrorType.INTERNAL_ERROR);

        ex.printStackTrace(); // trocar por logger + correlationId

        return ResponseEntity.status(status).body(resp);
    }

    private String correlationId(HttpServletRequest request) {
        Object v = request.getAttribute(CorrelationId.ATTRIBUTE);

        return (v != null ? v.toString() : null);
    }

    private HttpStatus mapToHttpStatus(ErrorType type) {
        if (type == null)
            return HttpStatus.BAD_REQUEST;
        return switch (type) {
            case VALIDATION_ERROR, BAD_REQUEST -> HttpStatus.BAD_REQUEST;
            case NOT_FOUND -> HttpStatus.NOT_FOUND;
            case AUTH_ERROR -> HttpStatus.UNAUTHORIZED;
            case ACCESS_DENIED -> HttpStatus.FORBIDDEN;
            case INTERNAL_ERROR -> HttpStatus.INTERNAL_SERVER_ERROR;
            case INTEGRATION_ERROR -> HttpStatus.BAD_GATEWAY; // 502
            case BUSINESS_ERROR -> HttpStatus.UNPROCESSABLE_ENTITY; // 422 (recomendado)
        };
    }
}

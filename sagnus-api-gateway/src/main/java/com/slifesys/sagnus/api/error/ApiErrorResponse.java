package com.slifesys.sagnus.api.error;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiErrorResponse {

    private int status;
    private String error;
    private String code;
    private String message;
    private String path;
    private String correlationId;
    private ErrorType errorType;
    private Instant timestamp;
    private List<FieldError> fieldErrors;

    // ======================================================
    // FACTORY: Método padrão já usado pelos handlers
    // ======================================================
    public static ApiErrorResponse of(int status,
                                      String error,
                                      String code,
                                      String message,
                                      String path,
                                      String correlationId) {
        ApiErrorResponse resp = new ApiErrorResponse();
        resp.status = status;
        resp.error = error;
        resp.code = code;
        resp.message = message;
        resp.path = path;
        resp.correlationId = correlationId;
        resp.timestamp = Instant.now();
        resp.fieldErrors = new ArrayList<>();
        return resp;
    }

    // ======================================================
    // ⭐ SUGAR SYNTAX #1 — Criação direta com ErrorType
    // ======================================================
    public static ApiErrorResponse of(int status,
                                      String error,
                                      String code,
                                      String message,
                                      String path,
                                      String correlationId,
                                      ErrorType errorType) {
        ApiErrorResponse resp = of(status, error, code, message, path, correlationId);
        resp.setErrorType(errorType);
        return resp;
    }

    // ======================================================
    // ⭐ SUGAR SYNTAX #2 — Adicionar vários fieldErrors de uma vez
    // ======================================================
    public ApiErrorResponse withFieldErrors(List<FieldError> errors) {
        if (this.fieldErrors == null) {
            this.fieldErrors = new ArrayList<>();
        }
        if (errors != null) {
            this.fieldErrors.addAll(errors);
        }
        return this;
    }

    // ======================================================
    // Helper para adicionar erro de campo individual
    // ======================================================
    public void addFieldError(String field, String message) {
        if (fieldErrors == null) {
            fieldErrors = new ArrayList<>();
        }
        fieldErrors.add(new FieldError(field, message));
    }

    // ======================================================
    // Getters/Setters
    // ======================================================
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getCorrelationId() {
        return correlationId;
    }

    public void setCorrelationId(String correlationId) {
        this.correlationId = correlationId;
    }

    public ErrorType getErrorType() {
        return errorType;
    }

    public void setErrorType(ErrorType errorType) {
        this.errorType = errorType;
    }

    public Instant getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Instant timestamp) {
        this.timestamp = timestamp;
    }

    public List<FieldError> getFieldErrors() {
        return fieldErrors;
    }

    public void setFieldErrors(List<FieldError> fieldErrors) {
        this.fieldErrors = fieldErrors;
    }

    // ======================================================
    // Inner class para erros de campo
    // ======================================================
    public static class FieldError {
        private String field;
        private String message;

        public FieldError() {
        }

        public FieldError(String field, String message) {
            this.field = field;
            this.message = message;
        }

        public String getField() {
            return field;
        }
        public void setField(String field) {
            this.field = field;
        }
        public String getMessage() {
            return message;
        }
        public void setMessage(String message) {
            this.message = message;
        }
    }
}

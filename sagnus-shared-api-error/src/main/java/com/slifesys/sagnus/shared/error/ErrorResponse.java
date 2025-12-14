package com.slifesys.sagnus.shared.error;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ErrorResponse {

    private int status;
    private String error;
    private String code;
    private String message;
    private String path;
    private String correlationId;
    private ErrorType errorType;
    private Instant timestamp;

    @Builder.Default
    private List<FieldError> fieldErrors = new ArrayList<>();

    public static ErrorResponse of(int status,
                                   String error,
                                   String code,
                                   String message,
                                   String path,
                                   String correlationId,
                                   ErrorType errorType) {
        return ErrorResponse.builder()
                .status(status)
                .error(error)
                .code(code)
                .message(message)
                .path(path)
                .correlationId(correlationId)
                .errorType(errorType)
                .timestamp(Instant.now())
                .build();
    }

    public void addFieldError(String field, String message) {
        fieldErrors.add(new FieldError(field, message));
    }

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    public static class FieldError {
        private String field;
        private String message;
    }
}

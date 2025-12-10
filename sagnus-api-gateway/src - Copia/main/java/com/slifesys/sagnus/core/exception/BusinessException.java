package com.slifesys.sagnus.core.exception;

import com.slifesys.sagnus.api.error.ErrorType;
import org.springframework.http.HttpStatus;

public class BusinessException extends RuntimeException {

    private final String code;
    private final HttpStatus httpStatus;
    private final ErrorType errorType;

    public BusinessException(String message,
                             String code,
                             HttpStatus httpStatus,
                             ErrorType errorType) {
        super(message);
        this.code = code;
        this.httpStatus = httpStatus;
        this.errorType = errorType;
    }

    public String getCode() {
        return code;
    }

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }

    public ErrorType getErrorType() {
        return errorType;
    }
}

package com.slifesys.sagnus.shared.error;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public abstract class BaseException extends RuntimeException {

    private final String code;
    private final ErrorType errorType;
    private final HttpStatus httpStatus;

    protected BaseException(String code, String message, ErrorType errorType, HttpStatus httpStatus) {
        super(message);
        this.code = code;
        this.errorType = errorType;
        this.httpStatus = httpStatus;
    }
}

package com.slifesys.sagnus.shared.error;

import org.springframework.http.HttpStatus;

public class BusinessException extends BaseException {

    public BusinessException(String code, String message) {
        super(code, message, ErrorType.BUSINESS_ERROR, HttpStatus.BAD_REQUEST);
    }

    public BusinessException(String code, String message, ErrorType type) {
        super(code, message, type, HttpStatus.BAD_REQUEST);
    }
}

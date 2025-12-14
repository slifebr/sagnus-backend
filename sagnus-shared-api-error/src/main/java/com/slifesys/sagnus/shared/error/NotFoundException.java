package com.slifesys.sagnus.shared.error;

import org.springframework.http.HttpStatus;

public class NotFoundException extends BaseException {

    public NotFoundException(String code, String message) {
        super(code, message, ErrorType.NOT_FOUND, HttpStatus.NOT_FOUND);
    }
}

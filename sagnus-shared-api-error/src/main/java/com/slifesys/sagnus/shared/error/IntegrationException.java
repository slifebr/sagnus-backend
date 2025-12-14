package com.slifesys.sagnus.shared.error;

import org.springframework.http.HttpStatus;

public class IntegrationException extends BaseException {

    public IntegrationException(String code, String message) {
        super(code, message, ErrorType.INTEGRATION_ERROR, HttpStatus.BAD_GATEWAY);
    }

    public IntegrationException(String code, String message, HttpStatus status) {
        super(code, message, ErrorType.INTEGRATION_ERROR, status);
    }
}

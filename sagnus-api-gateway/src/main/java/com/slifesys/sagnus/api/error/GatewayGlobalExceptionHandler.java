package com.slifesys.sagnus.api.error;

import com.slifesys.sagnus.shared.error.BusinessException;
import com.slifesys.sagnus.shared.error.ErrorResponse;
import com.slifesys.sagnus.shared.observability.CorrelationIdContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.util.List;

/**
 * Manipulador global de exceções para a camada de API/Gateway.
 *
 * Diferente do {@code DefaultGlobalExceptionHandler} (que é genérico),
 * este handler pode ter dependências de outros módulos e tratar exceções
 * específicas de cada BC.
 */
@Slf4j
@RestControllerAdvice
@Order(1) // Prioridade sobre o DefaultGlobalExceptionHandler
public class GatewayGlobalExceptionHandler extends ResponseEntityExceptionHandler {

    // --------------------------------------------------------------------------------
    // Métodos utilitários
    // --------------------------------------------------------------------------------

    /**
     * Cria uma resposta de erro padronizada (ApiErrorResponse).
     *
     * @param status O status HTTP da resposta.
     * @param errors A lista de erros a serem incluídos na resposta.
     * @return Um ResponseEntity contendo o corpo da resposta de erro.
     */
    private ResponseEntity<Object> createErrorResponse(HttpStatus status, List<ErrorResponse.FieldError> errors) {
        ErrorResponse response = ErrorResponse.builder()
                .correlationId(CorrelationIdContext.get())
                .status(status.value())
                .fieldErrors(errors)
                .build();
        return new ResponseEntity<>(response, status);
    }

    /**
     * Cria uma resposta de erro para um único erro.
     *
     * @param status  O status HTTP da resposta.
     * @param message A mensagem de erro.
     * @return Um ResponseEntity contendo o corpo da resposta de erro.
     */
    private ResponseEntity<Object> createSingleErrorResponse(HttpStatus status, String message) {
        ErrorResponse response = ErrorResponse.builder()
                .correlationId(CorrelationIdContext.get())
                .status(status.value())
                .message(message)
                .build();
        return new ResponseEntity<>(response, status);
    }

    // --------------------------------------------------------------------------------
    // Tratamento de exceções
    // --------------------------------------------------------------------------------

    /**
     * Trata exceções de validação de argumentos de método (ex: @Valid).
     *
     * @param ex      A exceção MethodArgumentNotValidException lançada.
     * @param headers Os cabeçalhos da requisição.
     * @param status  O status HTTP da resposta.
     * @param request A requisição web.
     * @return Um ResponseEntity contendo os erros de validação.
     */
    @Override
    protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex, HttpHeaders headers, HttpStatusCode status, WebRequest request) {
        List<ErrorResponse.FieldError> validationErrors = ex.getBindingResult().getFieldErrors().stream()
                .map(error -> new ErrorResponse.FieldError(error.getField(), error.getDefaultMessage()))
                .toList();
        return createErrorResponse(HttpStatus.BAD_REQUEST, validationErrors);
    }

    /**
     * Trata exceções de negócio (BusinessException).
     *
     * @param ex A exceção BusinessException lançada.
     * @return Um ResponseEntity contendo o erro de negócio.
     */
    @ExceptionHandler(BusinessException.class)
    @ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY) // 422
    public ResponseEntity<Object> handleBusinessException(BusinessException ex) {
        return createSingleErrorResponse(HttpStatus.UNPROCESSABLE_ENTITY, ex.getMessage());
    }
}

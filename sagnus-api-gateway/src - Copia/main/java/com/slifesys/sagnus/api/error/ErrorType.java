package com.slifesys.sagnus.api.error;

public enum ErrorType {

    // Erros de validação (Bean Validation, parâmetros, etc.)
    VALIDATION_ERROR,

    // Erros de regra de negócio (BusinessException)
    BUSINESS_ERROR,

    // Problemas de autenticação (login inválido, token inválido/expirado)
    AUTH_ERROR,

    // Usuário autenticado, mas sem permissão para o recurso
    ACCESS_DENIED,

    // Recurso não encontrado (404)
    NOT_FOUND,

    // Erro interno genérico (500)
    INTERNAL_ERROR,

    // Erro de requisicao
    BAD_REQUEST
}

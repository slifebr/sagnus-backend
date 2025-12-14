# sagnus-platform-security

Módulo de plataforma para Segurança do Sagnus ERP.

## O que ele provê
- Contrato e filtro de `X-Correlation-Id` (MDC + request attribute)
- Padronização de 401/403 em JSON (ErrorResponse do `sagnus-shared-api-error`)
- Utilitários de JWT (`JwtProperties`, `JwtUtils`)
- Portas para lookup de usuário (`UserSecurityPort`)

## Como usar em um BC (AUTH/CORP/NFE)
1) Adicionar dependência `sagnus-platform-security`
2) No `SecurityFilterChain` do BC, ligar:
   - `.exceptionHandling(eh -> eh.authenticationEntryPoint(ErpAuthenticationEntryPoint).accessDeniedHandler(ErpAccessDeniedHandler))`
3) Garantir secret em config:
```yml
sagnus:
  security:
    jwt:
      secret: ${SAGNUS_JWT_SECRET:troque-por-um-secret-com-32+chars}
      issuer: sagnus
      accessTokenMinutes: 30
```

## Migração (promoção)
Após adicionar este módulo, remova do AUTH (e demais BCs) as classes locais:
- CorrelationId / CorrelationIdFilter
- ErpAuthenticationEntryPoint / ErpAccessDeniedHandler

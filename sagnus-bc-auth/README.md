# sagnus-bc-auth (v3)

Endpoints:
- POST `/auth/login` -> access+refresh
- POST `/auth/refresh` -> rotaciona refresh e retorna novo access+refresh
- GET  `/auth/me` -> retorna dados do usuário autenticado
- POST `/auth/users` -> cria usuário (pode vincular pessoaId)

Segurança:
- `POST /auth/users` requer `ROLE_AUTH_ADMIN` (via `@PreAuthorize`).
- `@EnableMethodSecurity` habilitado em `AuthConfig`.

Refresh token:
- armazenado como HASH (SHA-256) em `auth_refresh_token`.


Regras de rota (SecurityFilterChain):
- `/auth/login` e `/auth/refresh`: `permitAll()`
- demais endpoints: `authenticated()`
- autorização fina: `@PreAuthorize` (ex.: `ROLE_AUTH_ADMIN` em `/auth/users`)


Erros 401/403 em padrão ERP:
- 401 usa `ErpAuthenticationEntryPoint` (ErrorType.AUTH_ERROR)
- 403 usa `ErpAccessDeniedHandler` (ErrorType.ACCESS_DENIED)
- ambos retornam `ApiErrorResponse` do `sagnus-shared-api-error`

Observabilidade (correlationId):
- Header padrão: `X-Correlation-Id`
- Filtro: `CorrelationIdFilter` (propaga/gera, coloca no MDC e devolve no response)
- 401/403 reaproveitam o mesmo `correlationId` no `ApiErrorResponse`

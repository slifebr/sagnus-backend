# Refatoração v260101 (DDD/Java)

Este pacote aplica uma primeira rodada de ajustes estruturais para consolidar o padrão arquitetural antes de escalar para novos módulos.

## Principais mudanças

### 1) Limpeza de artefatos de build
- Removidos todos os diretórios `target/` do repositório (não devem ser versionados nem distribuídos no zip).

### 2) Padronização de CorrelationId (cross-cutting)
**Problema anterior**
- Existiam implementações duplicadas de correlationId:
  - `sagnus-platform-web` tinha `CorrelationIdFilter` (request attribute + MDC)
  - `sagnus-bc-nfe` tinha `NfeCorrelationIdFilter` + `CorrelationIdHolder` (ThreadLocal)
  - `sagnus-shared-api-error` tinha um handler próprio buscando `sagnusCorrelationId`

**Solução aplicada**
- Criado `com.slifesys.sagnus.shared.observability.CorrelationIdContext` no `sagnus-shared-kernel`:
  - ThreadLocal + MDC (padronizado pelo `CorrelationId.MDC_KEY`)
- `sagnus-platform-web/CorrelationIdFilter` agora:
  - Lê `X-Correlation-Id` e, se ausente, tenta `X-Request-Id`
  - Gera UUID compacto se necessário
  - Define request attribute (`CorrelationId.ATTRIBUTE`)
  - Define `CorrelationIdContext.set(...)`
  - Propaga header de resposta `X-Correlation-Id`
  - Limpa contexto no finally
- No `sagnus-bc-nfe`:
  - Removidos `NfeCorrelationIdFilter` e `CorrelationIdHolder`
  - Substituído por `CorrelationIdContext` em todos os pontos de uso
  - Workers/listeners continuam podendo setar/limpar o contexto quando o processamento não nasce em HTTP

Resultado: um único contrato e uma única forma de obter correlationId no código de aplicação/infra.

### 3) Separação correta de responsabilidades entre `shared-api-error` e `platform-web`
- Removido `GlobalExceptionHandler` de `sagnus-shared-api-error`.
- Mantido o tratamento central de exceções no `sagnus-platform-web` (que é o lugar correto para concerns web).
- Ajustado o `pom.xml` do `sagnus-shared-api-error` para depender de `spring-web` (e não `spring-boot-starter-web`), evitando trazer stack web completa para uma lib compartilhada.

### 4) Padronização de versões / build no POM raiz
- Atualizado `pom.xml` raiz com:
  - propriedades centralizadas: `jjwt.version`, `mapstruct.version`, `lombok.version`, `lombok.mapstruct.binding.version`
  - `pluginManagement` para `maven-compiler-plugin` com annotation processors (Lombok + MapStruct + binding)
  - `maven-enforcer-plugin` para exigir Java 21+
- `sagnus-api-gateway` passou a usar `${mapstruct.version}` e removeu configuração duplicada do compiler plugin.
- `sagnus-bc-auth` passou a usar `${jjwt.version}` (alinhado com o POM raiz).
- Removido bloco redundante de `<properties>` no `pom.xml` do `sagnus-bc-nfe`.

### 5) Higienização de arquivos redundantes
- Removidos do `sagnus-bc-nfe`:
  - `pom_raiz.xml` (cópia antiga do POM raiz)
  - `run_nfe_jpa.log` (log de execução local)

## Padrão consolidado para próximos módulos (recomendação)

- Cada BC deve manter a separação:
  - `api` (controllers/DTOs)
  - `application` (usecases/ports/commands/results)
  - `domain` (entidades/VOs/regras/eventos)
  - `infrastructure` (JPA/adapters/integrations/messaging)
- Cross-cutting de web (filters/exception handler) fica em `sagnus-platform-web`.
- Cross-cutting de security fica em `sagnus-platform-security`.
- Tipos realmente universais (CorrelationId e Context) ficam no `sagnus-shared-kernel`.
- Erros/DTO de erro e hierarquia de exceções de API ficam em `sagnus-shared-api-error`.



## Complemento (v260101) — Template BC + Scripts

- Adicionado `sagnus-bc-template` com regras ArchUnit (camadas DDD) para evitar regressões.
- Adicionados scripts `new-bc` (criar BC) e `delete-bc` (remover BC e atualizar pom raiz).

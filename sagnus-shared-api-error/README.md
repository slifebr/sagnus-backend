# sagnus-shared-api-error

Módulo compartilhado de erros do Sagnus ERP.

## Objetivo
Centralizar:
- modelo de resposta de erro REST
- exceções de negócio, not-found e integração
- convenções de código por Bounded Context

## Convenção de códigos
- AUTH-xxx → Segurança / Autenticação
- CORP-xxx → Cadastro corporativo
- NFE-xxx  → Fiscal / NFe

## Exceções
- BusinessException → 400 (regra de negócio)
- NotFoundException → 404 (recurso inexistente)
- IntegrationException → 502/503 (falha externa)

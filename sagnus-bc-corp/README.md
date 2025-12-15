# sagnus-bc-corp (Domain A)

Este módulo contém o núcleo do Bounded Context CORP iniciado pela Aggregate Root **Pessoa** (DDD puro).

## Estrutura
- `domain` → modelo e invariantes (sem Spring/JPA)
- `application` → casos de uso (orquestração)
- `infrastructure` → (B e C virão depois)

## Status
- Etapa A concluída: VO `Documento` com validação real CPF/CNPJ + demais VOs/AR base.

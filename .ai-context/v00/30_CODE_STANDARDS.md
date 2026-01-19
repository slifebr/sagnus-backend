# Padrões de Código — Java / Erros / Testes

## Java
- Lombok por padrão
- MapStruct para mapeamentos:
  - Domain ↔ Persistence Entity
  - Domain ↔ API DTO
- Evitar expor entidades JPA fora da infraestrutura

## Erros e observabilidade
- Modelo de erro padronizado: `sagnus-shared-api-error`
- Tratamento web: `sagnus-platform-web`
- CorrelationId e logging ficam em `api/` e/ou `infrastructure/`, nunca no domínio

## Testes
- Testes de domínio: unitários puros (sem Spring)
- Fiscal: testes unitários representativos (casos IBS/CBS)
- Infra: testes slice/integration quando necessário

## Git / documentação
- Conventional Commits: `feat:`, `fix:`, `refactor:`, `test:`, `docs:`, `chore:`
- Ao descrever mudanças, referenciar classes com **package+classe**
- Sempre incluir checklist de merge/aplicação em notas/PRs (padrão do projeto)


# AI_PLAYBOOK — Sagnus ERP (Cursor/LLM Working Agreement)
Data: 2026-01-04

Este playbook define como a IA deve trabalhar no monorepo Sagnus para:
- manter DDD + Hexagonal consistente
- preservar independência de banco
- evitar duplicação de regras fiscais
- acelerar refatorações de legado (Forms/PLSQL) com segurança

---

## 1) Regra de Ouro: limites de responsabilidade
### Dentro de cada BC (ex.: sagnus-bc-corp, sagnus-bc-nfe, sagnus-bc-adm, sagnus-bc-auth)
- **domain**: regras puras, invariantes, Value Objects, Domain Services, Domain Exceptions
  - proibido: Spring, JPA, HTTP, JWT, logging
- **application**: UseCases + Ports + orquestração (transações/fluxos)
- **infrastructure**: adapters (persistence, clients externos, xml, messaging)
- **api**: controllers/resolvers + DTOs de borda (request/response) sem regra de negócio

### Contratos (ex.: sagnus-bc-corp-contracts)
- apenas: interfaces, DTOs estáveis, enums
- proibido: controller, JPA, regras, services

### Gateway (sagnus-api-gateway)
- **deve ser fino**
- apenas: routing/composição/edge concerns
- proibido: domínio próprio, repos/persistência, regras fiscais/cadastro

---

## 2) Workflow recomendado no Cursor (prático)
### 2.1 Antes de codar
1. Localize o BC correto (corp/nfe/adm/auth).
2. Busque padrões existentes no repo:
   - UseCase naming, ports, adapters, mappers
3. Identifique se é:
   - regra de negócio (domain)
   - orquestração (application)
   - detalhe técnico (infrastructure)
   - endpoint (api)

### 2.2 Durante a implementação
- Sempre crie primeiro a interface do **Port** no `application`
- Depois implemente o adapter no `infrastructure`
- Só depois exponha

## 3) Documentação Obrigatória
Sempre que criar/aprovar um:
- **Task List** (`task.md`): Salve cópia em `docs/tasks/TaskName.md`
- **Implementation Plan** (`implementation_plan.md`): Salve cópia em `docs/plans/YYYY-MM-DD-FeatureName.md`
- **Walkthrough** (`walkthrough.md`): Salve cópia em `docs/walkthroughs/YYYY-MM-DD-FeatureName.md`

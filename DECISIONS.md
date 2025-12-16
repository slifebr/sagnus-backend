# Sagnus ERP — Architectural Decisions (DECISIONS.md)

Data: 2025-12-16

Este documento registra decisões arquiteturais (estilo **ADR — Architecture Decision Records**).
O objetivo é manter o “porquê” das decisões, reduzindo retrabalho e discussões recorrentes.

---

## ADR-0001 — Monorepo Maven multi-módulo

**Decisão:** usar Maven multi-módulo em um único repositório.

**Motivo:**
- build consistente e reprodutível
- contratos `*-api` versionados no mesmo ciclo
- facilita refactor inicial e acelera evolução do “core”

**Consequências:**
- IDE pode exigir reload/reopen para reindexar módulos
- versionamento de releases pode precisar de disciplina (tags/releases por marco)

---

## ADR-0002 — DDD + Bounded Contexts como padrão

**Decisão:** modelar o ERP por Bounded Contexts (AUTH, CORP, NFe…).

**Motivo:**
- ERP fiscal cresce e muda muito: separar contextos reduz risco
- linguagens de domínio diferentes por área (cadastro vs fiscal)
- equipes podem evoluir módulos sem travar o todo

**Consequências:**
- exige contratos explícitos e governança de dependências
- evita “atalhos” (importar entidade/JPA do vizinho)

---

## ADR-0003 — Contratos `*-api` (Java) entre BCs

**Decisão:** comunicação direta em-process entre BCs (no monorepo) via contrato Java,
com possibilidade de trocar para HTTP/mensageria no futuro.

**Motivo:**
- reduz complexidade na fase inicial
- mantém acoplamento controlado e explícito (ports + DTOs mínimos)

**Consequências:**
- contratos precisam ser estáveis (versionamento, compatibilidade)
- no futuro, contrato pode ganhar implementação via HTTP sem mudar consumidor

---

## ADR-0004 — Domínio puro (sem framework)

**Decisão:** o domínio não depende de Spring/JPA/HTTP/JWT.

**Motivo:**
- domínio altamente testável
- regras fiscais ficam “blindadas” contra mudanças de infra
- facilita portabilidade e reuso

**Consequências:**
- mapeamentos para persistência/XML ficam em infra/adapters
- exige disciplina (não “vazar” anotações no domínio)

---

## ADR-0005 — Segurança como plataforma (JWT stateless)

**Decisão:** consolidar segurança em `sagnus-platform-security`.

**Motivo:**
- padroniza filtros, configuração e claims em todos os BCs
- reduz duplicação e divergências de segurança

**Consequências:**
- mudanças de segurança impactam todos os BCs (mas de forma controlada)
- exige integração com `platform-web` para padronizar 401/403

---

## ADR-0006 — Erro padronizado (ErrorResponse) compartilhado

**Decisão:** padronizar erros em `sagnus-shared-api-error` e tratamento em `sagnus-platform-web`.

**Motivo:**
- respostas consistentes para front-end e integrações
- melhora suporte (correlationId + code por BC)

**Consequências:**
- requer convenção de códigos (ex.: `NFE-001`, `AUTH-001`)
- evita que cada BC “inventar” formato de erro

---

## ADR-0007 — Naming: UseCases explícitos (`EmitirNfeUseCase`)

**Decisão:** nomear casos de uso com sufixo `UseCase` na camada Application.

**Motivo:**
- deixa claro o papel (orquestração)
- facilita busca e onboarding
- separa “serviço de app” de “serviço de domínio”

**Consequências:**
- mais classes, mas organização melhor
- reduz ambiguidade (service genérico vs fluxo)

---

## ADR-0008 — Segredos por variáveis de ambiente

**Decisão:** usar env vars para DB/JWT secrets, não commitar senhas em YAML.

**Motivo:**
- segurança e compliance
- compatível com CI/CD e ambientes múltiplos

**Consequências:**
- dev precisa configurar ambiente local
- mais tarde podemos integrar Vault/KMS/Secrets do CI

---

## ADR-0009 — Roadmap NFe: Domínio → Application → Infra (SEFAZ/XML)

**Decisão:** construir o BC NFe na sequência:
1) Domínio puro
2) UseCases + Ports
3) Infra (persistência)
4) Integração SEFAZ / XML / eventos

**Motivo:**
- congela regras fiscais antes de “espalhar” para fora
- evita refactor caro depois

**Consequências:**
- entrega inicial sem SEFAZ, mas com base sólida
- permite testes unitários desde o início

---

## Como adicionar novas decisões
Copie e incremente o número:
- `ADR-00XX — Título`
Inclua: decisão, motivo e consequências.

# Contexto do Projeto — Sagnus ERP

## Macro-visão
- **Monorepo Maven multi-módulo** (ADR-0001).
- Arquitetura alvo: **DDD + Bounded Contexts + Hexagonal**.
- Objetivo estratégico: evoluir um ERP (legado Forms 6i) para **web**, preservando regras de domínio e mantendo o sistema **agnóstico de banco**.

## Principais módulos
- **Plataforma/Shared**
  - `sagnus-shared-api-error` (modelo de erro padronizado)
  - `sagnus-platform-web` (web infra: handlers, filtros, correlationId etc.)
  - `sagnus-platform-security` (segurança: JWT stateless)
  - `sagnus-shared-kernel` (tipos utilitários/compartilhados, quando aplicável)

- **Bounded Contexts (BCs)**
  - `sagnus-bc-corp` (cadastros centrais)
  - `sagnus-bc-auth` (autenticação/autorização)
  - `sagnus-bc-nfe` (fiscal: NFe/IVA Dual IBS/CBS)
  - `sagnus-bc-adm` (administrativo)
  - `sagnus-bc-template` (template para geração de BC)

- **Contracts (entre BCs)**
  - `sagnus-bc-corp-contracts` (ports + DTOs estáveis para consumo por outros BCs)
  - Regra: contratos são **mínimos** e **estáveis**.

- **Edge/BFF**
  - `sagnus-api-gateway` (gateway fino; pode agregar leitura)

## Assunções técnicas
- Java 21 + Spring Boot 3.x
- Lombok como padrão
- MapStruct como padrão (mapeamentos)


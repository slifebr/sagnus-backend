# 🟦 SAGNUS ERP — Plataforma Modular de Núcleos Inteligentes  
### Domain-Driven Design • Arquitetura Modular • Segurança Unificada • ERP de Próxima Geração

---

## 📌 Sobre o SAGNUS

**SAGNUS ERP** é um sistema ERP moderno, modular e escalável, projetado com princípios sólidos de  
**Domain-Driven Design (DDD)**, **Arquitetura Limpa**, **Arquitetura Modular** e **Bounded Contexts Independentes**.

O projeto foi concebido para:
- suportar domínios fiscais complexos (NF-e, IBS/CBS, integrações governamentais)
- permitir evolução independente de módulos
- minimizar acoplamento entre áreas do negócio
- servir como base de modernização de legados Oracle Forms / PL/SQL

---

## 🧩 Significado do nome SAGNUS

**SAGNUS** é um acrônimo de:

**S**istema de  
**A**rquitetura e  
**G**estão de  
**N**úcleos  
**U**nificados de  
**S**oftware  

> Representa múltiplos núcleos de negócio (Bounded Contexts) autônomos,  
integrados por uma infraestrutura comum e governada.

---

## 🎯 Princípios Arquiteturais

- Domain-Driven Design (DDD)
- Bounded Contexts explícitos
- Arquitetura Limpa / Ports & Adapters
- Domínio puro (sem Spring, JPA, HTTP, JWT)
- Contratos explícitos entre BCs (`*-api`)
- Segurança stateless centralizada (JWT)
- Padronização de erros (ErrorResponse)
- Preparado para microservices (futuro)

---

## 🧱 Estrutura Geral do Repositório

```
sagnus
├─ sagnus-shared-api-error         # Padrão unificado de erros
├─ sagnus-platform-web             # Infra web comum
├─ sagnus-platform-security        # Segurança JWT centralizada
│
├─ sagnus-bc-corp                  # BC CORP (cadastros centrais)
├─ sagnus-bc-corp-contracts              # Contratos CORP (ports + DTOs)
│
├─ sagnus-bc-auth                  # BC AUTH (login, JWT, usuários)
├─ sagnus-bc-nfe                   # BC NFe (domínio fiscal)
├─ sagnus-bc-adm                   # BC ADM (administrativo: agenda, módulos, parâmetros)
│
├─ pom.xml                         # Maven parent (multi-módulo)
├─ README.md
├─ ARCHITECTURE.md
├─ DEVELOPMENT.md
└─ DECISIONS.md
```

---

## 🔐 Segurança (JWT)

A segurança é centralizada em:

```
sagnus-platform-security
```

Inclui:
- TokenService
- JwtAuthentication / Authorization Filters
- JwtProperties
- PasswordEncoder
- Integração com `platform-web` para 401/403 padronizados

Cada BC define **apenas suas regras de autorização**, nunca autenticação.

---

## ❗ Padrão Unificado de Erros

Módulo:
```
sagnus-shared-api-error
```

Formato padrão:

```json
{
  "timestamp": "2025-12-10T14:35:00Z",
  "path": "/api/nfe",
  "status": 400,
  "errorType": "VALIDATION_ERROR",
  "code": "NFE-001",
  "message": "Dados inválidos.",
  "correlationId": "abc123",
  "fieldErrors": []
}
```

---

## 🧠 Bounded Contexts

### 🔷 CORP
Fonte de verdade para dados corporativos:
- Pessoa Física / Jurídica
- Base para AUTH e NFe
- Exposição apenas via contrato (`sagnus-bc-corp-contracts`)

### 🔷 AUTH
Responsável por autenticação e autorização:
- Login / Refresh / JWT
- Usuários do sistema
- Consome CORP somente via contrato

### 🔷 NFe
Domínio fiscal puro:
- Aggregate Root: `Nfe`
- Itens, totais e tributos
- UseCases (`EmitirNfeUseCase`)
- Integra CORP por contrato
- Infra (JPA/XML/SEFAZ) em etapas futuras

---

## 🔄 Comunicação entre Contextos

| Origem | Destino | Forma |
|------|--------|------|
| AUTH | CORP | Contrato Java |
| NFe  | CORP | Contrato Java |
| NFe  | AUTH | JWT |
| CORP | Outros | ❌ Não direto |

---

## 🧪 Testabilidade

- Domínio testável sem Spring
- UseCases testáveis com mocks
- Infra isolada por adapters

---

## 🛠️ Requisitos

- Java 21
- Maven 3.9+
- PostgreSQL
- IDE com Lombok

---

## 🧠 Convenção de Commits

Padrão **Conventional Commits**:

```text
feat(bc-nfe): add pure domain and EmitirNfeUseCase foundation
docs: merge and align global README with architecture
```

---

## 🚀 Roadmap (alto nível)

### Atual
- Arquitetura DDD consolidada
- AUTH + CORP + NFe (domínio puro)
- Segurança e erros centralizados

### Próximos
- Infra JPA NFe
- XML NF-e
- Integração SEFAZ
- IBS / CBS
- Eventos e mensageria
- Observabilidade

---

## 📚 Documentação complementar

- `ARCHITECTURE.md` — visão arquitetural detalhada
- `DEVELOPMENT.md` — onboarding técnico
- `DECISIONS.md` — decisões arquiteturais (ADR)

---

## ✨ Slogan

> **SAGNUS — Plataforma Modular de Núcleos Inteligentes**

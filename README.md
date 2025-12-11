# 🟦 SAGNUS ERP — Plataforma Modular de Núcleos Inteligentes  
### Domain-Driven Design • Arquitetura Modular • Segurança Unificada • ERP de Próxima Geração

---

## 📌 Sobre o SAGNUS

**SAGNUS** é um ERP moderno, modular e escalável, projetado com princípios sólidos de  
**Domain-Driven Design (DDD)**, **Arquitetura Modular** e **Bounded Contexts Independentes**.

Ele foi criado para atender sistemas empresariais de alta complexidade, garantindo:

- Separação clara de domínios (Cadastro, NFe, Financeiro, Estoque…)
- Evolução independente de módulos (BCs)
- Segurança e padronização centralizadas
- Baixo acoplamento e alta coesão
- Flexibilidade para escalar para microserviços no futuro

---

## 🧩 Significado do nome SAGNUS

O nome **SAGNUS** é um acrônimo:

**S**istema de  
**A**rquitetura e  
**G**estão de  
**N**úcleos  
**U**nificados de  
**S**oftware  

Ele representa exatamente a filosofia do ERP:

> **Múltiplos núcleos de negócio (Bounded Contexts) funcionando de forma autônoma,  
mas integrados por uma infraestrutura unificada.**

---

## 🏛️ Arquitetura Geral

O SAGNUS é composto por:

### 🔷 Módulos compartilhados (Cross-Cutting)

| Módulo                     | Descrição |
|---------------------------|-----------|
| **shared-kernel**         | Utilidades e abstrações comuns |
| **sagnus-shared-api-error** | Padrão unificado de erros (ErrorResponse, ErrorType, Exceptions) |
| **sagnus-platform-security** | Autenticação e Autorização JWT padronizadas |

### 🔷 Bounded Contexts (Domínio do ERP)

| BC                       | Responsabilidade |
|--------------------------|------------------|
| **sagnus-bc-cadastro**   | Pessoas, clientes e registros cadastrais |
| **sagnus-bc-faturamento-nfe** | Emissão de NFe, cálculos, integração fiscal |
| *(Futuros)* Financeiro, Estoque, Compras, Fiscal IBS/CBS | Expansão modular |

---

## 🧱 Estrutura do Repositório

```
sagnus-erp/
 ├── docs/
 │    ├── architecture/
 │    └── about/sagnus-name.md
 │
 ├── sagnus/
 │    ├── shared-kernel/
 │    ├── sagnus-shared-api-error/
 │    ├── sagnus-platform-security/
 │    ├── sagnus-bc-cadastro/
 │    └── sagnus-bc-faturamento-nfe/
 │
 ├── .github/
 │    ├── ISSUE_TEMPLATE/
 │    └── workflows/
 │
 ├── README.md
 └── pom.xml (pai)
```

---

## 🔐 Segurança (JWT)

A segurança é centralizada no módulo:

```
sagnus-platform-security
```

Inclui:

- TokenService  
- JwtAuthorizationFilter  
- JwtProperties  
- PasswordEncoder  
- Tratamento 401/403 padronizado (via shared-api-error)

Cada BC expõe *somente* suas regras de autorização.

---

## ❗ Padrão de Erros (ErrorResponse)

Todos os módulos utilizam:

```
sagnus-shared-api-error
```

O formato padrão retorna:

```json
{
  "timestamp": "2025-12-10T14:35:00",
  "path": "/api/clientes",
  "status": 400,
  "error": "VALIDATION_ERROR",
  "message": "Dados inválidos.",
  "details": [...]
}
```

---

## 🧠 Filosofia DDD aplicada

- Cada BC possui **modelo de domínio próprio**  
- Entidades JPA **não são compartilhadas** entre módulos  
- Comunicação entre BCs é feita por **DTOs via gateway REST**  
- Regras de negócio vivem somente na **camada domain**  
- Casos de uso na camada **application**  
- Controllers expõem a API (camada **api**)  
- Infraestrutura (JPA, mappers, clients) fica em **infrastructure**

---

## 🛠️ Requisitos

- **Java 21**  
- **Maven 3.9+**  
- Git  
- IDE com suporte a Lombok

---

## 🚀 Como executar (exemplo)

Na pasta raiz:

```bash
mvn clean package
```

Para subir apenas o módulo de Cadastro:

```bash
cd sagnus/sagnus-bc-cadastro
mvn spring-boot:run
```

E o de NFe:

```bash
cd sagnus/sagnus-bc-faturamento-nfe
mvn spring-boot:run
```

---

## 🛤️ Roadmap

### v1 (atual)
- Estrutura modular inicial
- Segurança JWT centralizada
- Padrão unificado de erros
- Cadastro + NFe com arquitetura DDD

### v2
- Logging padronizado
- Eventos de domínio
- Integração fiscal completa
- BC Financeiro
- BC Estoque

### v3
- Deploy distribuído (microservices-ready)
- Observabilidade integrada (OpenTelemetry)
- Orquestração de domínios

---

## 🤝 Contribuições

Antes de contribuir, leia:

```
docs/architecture/BC_Guidelines.md
```

E siga o padrão de branches:

- `feat/nome-da-feature`
- `fix/ajuste`
- `refactor/bc-cadastro`

---

## 📜 Licença

LICENSE (Apache 2.0)

---

## ✨ Slogan Oficial

> **SAGNUS — Plataforma Modular de Núcleos Inteligentes**

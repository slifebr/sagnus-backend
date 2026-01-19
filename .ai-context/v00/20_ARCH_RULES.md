# Regras Arquiteturais — DDD + Hexagonal

Estas regras são a tradução direta das ADRs + convenções do repositório.

## 1) Camadas (dentro de um BC)
### domain/ (puro)
Contém:
- Aggregates/Entities, Value Objects, Domain Services
- Domain Events, Domain Exceptions
- **Ports de persistência (repositórios)** em `domain/repository/` (ADR-0010)

Proibido:
- `@Component`, `@Service`, `@Repository`
- `@Entity`, `JpaRepository`, `EntityManager`
- Jackson, validação HTTP, JWT, `HttpServlet*`

### application/ (orquestração)
Contém:
- `usecase/*UseCase` (ADR-0007)
- Ports de integração externa em `application/port/out/` (ADR-0010)
- (Opcional) ports de entrada em `application/port/in/`

Regras:
- Use cases **não** contêm regra fiscal “miúda” duplicada (chamam domain services).

### infrastructure/ (adapters)
Contém:
- Persistência (JPA/JDBC), HTTP clients, mensageria, outbox, caches
- Implementações de ports (adapters)

Persistência:
- `infrastructure/persistence/` **só existe quando há DB real**
- `infrastructure/repository/` é reservado a **stubs/in-memory/fakes** quando não há DB

### api/ (controllers/resolvers)
Contém:
- REST controllers / GraphQL resolvers
- DTOs request/response
- Validação de entrada

Regra crítica:
- **Sem regra de negócio** (apenas delega para `application/usecase`).

## 2) Dependências entre BCs
Permitido:
- `bc-qualquer` → depende de `sagnus-bc-corp-contracts` (ou outro contracts) quando precisa de dados/capacidades

Proibido:
- Importar `com.slifesys.sagnus.<outrobc>.domain.*`
- Acessar tabelas do outro BC
- Compartilhar Entity JPA entre BCs

## 3) Contracts entre BCs
Um módulo contracts contém **apenas**:
- Ports (interfaces) expostas
- DTOs/enums/tipos mínimos e estáveis

Proibido:
- Spring, controllers, persistência, regra de negócio

## 4) Gateway (EDGE/BFF)
O `sagnus-api-gateway`:
- Não tem domínio próprio
- Não possui persistência
- Pode fazer agregação **read-only** via contracts (ADR-0011)
- Não deve duplicar regra fiscal ou regras de domínio

## 5) Fiscal (NFe / IVA Dual)
- Centralizar cálculos em Domain Services do BC NFe (ADR-0012)
- Regras de dinheiro:
  - `BigDecimal` com scale explícito
  - `RoundingMode.HALF_UP`
  - evitar constantes deprecated


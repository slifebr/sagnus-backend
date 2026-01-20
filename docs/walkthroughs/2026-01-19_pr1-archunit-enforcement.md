# PR-1: Architecture Enforcement (ArchUnit) — Walkthrough

**Data:** 2026-01-19  
**Objetivo:** Tornar violações arquiteturais impossíveis de commitar via testes automáticos  
**Status:** ✅ Implementado

---

## Resumo

Implementado enforcement automático de regras arquiteturais via ArchUnit em todos os 5 BCs principais:
- sagnus-bc-estoque (corrigido JUnit4 → JUnit5)
- sagnus-bc-corp (novo)
- sagnus-bc-adm (novo)
- sagnus-bc-nfe (novo)
- sagnus-bc-auth (novo)

---

## Mudanças Realizadas

### 1. bc-estoque: Fix JUnit4 → JUnit5

**Arquivo:** [ArchitectureTest.java](file:///d:/Projetos/2025/Sagnus/Fontes/Backend/sagnus/sagnus-bc-estoque/src/test/java/com/slifesys/sagnus/estoque/ArchitectureTest.java)

**Problema:** Usava anotações JUnit4 mas dependia de `archunit-junit5`

**Solução:**
```diff
-import com.tngtech.archunit.junit.AnalyzeClasses;
-import com.tngtech.archunit.junit.ArchTest;
+import com.tngtech.archunit.junit.jupiter.AnalyzeClasses;
+import com.tngtech.archunit.junit.jupiter.ArchTest;
```

---

### 2. bc-corp: Novo ArchitectureTest

**Arquivo:** [ArchitectureTest.java](file:///d:/Projetos/2025/Sagnus/Fontes/Backend/sagnus/sagnus-bc-corp/src/test/java/com/slifesys/sagnus/corp/ArchitectureTest.java)

**Regras Implementadas:**
- ✅ Domain não pode depender de Spring
- ✅ Domain não pode depender de JPA
- ✅ Domain não pode depender de API/Infrastructure
- ✅ Application não pode depender de Infrastructure
- ✅ Application não pode depender de API
- ✅ Sem imports diretos de outros BCs
- ✅ Controllers devem estar em `api..`
- ✅ UseCases devem terminar com `UseCase`

**Violações Detectadas:**
- 🔴 `Produto.java` tem JPA no domain (será corrigido em PR-2)

---

### 3. bc-adm: Novo ArchitectureTest

**Arquivo:** [ArchitectureTest.java](file:///d:/Projetos/2025/Sagnus/Fontes/Backend/sagnus/sagnus-bc-adm/src/test/java/com/slifesys/sagnus/adm/ArchitectureTest.java)

**Diferença:** Permite temporariamente `interfaces..` para controllers (será removido em PR-6)

```java
@ArchTest
static final ArchRule controllers_should_reside_in_api_or_interfaces =
    classes().that().areAnnotatedWith(RestController.class)
        .should().resideInAnyPackage(
            BASE + "api..",
            BASE + "interfaces.."  // Temporary: will be removed in PR-6
        )
```

**Violações Detectadas:**
- 🔴 Domain services com `@Service` (será corrigido em PR-5)
- 🔴 Application depende de Infrastructure (será corrigido em PR-5)

---

### 4. bc-nfe: Novo ArchitectureTest

**Arquivo:** [ArchitectureTest.java](file:///d:/Projetos/2025/Sagnus/Fontes/Backend/sagnus/sagnus-bc-nfe/src/test/java/com/slifesys/sagnus/nfe/ArchitectureTest.java)

**Regra Especial:** Enforcement de ADR-0012 (CalculadoraIvaService)

```java
@ArchTest
static final ArchRule calculadora_iva_must_be_in_domain_service =
    classes().that().haveSimpleNameContaining("CalculadoraIva")
        .should().resideInAPackage(BASE + "domain.service..")
        .because("Fiscal rules must be in domain services (ADR-0012)");
```

**Status:** ✅ Nenhuma violação detectada (bc-nfe está conforme!)

---

### 5. bc-auth: Novo ArchitectureTest

**Arquivo:** [ArchitectureTest.java](file:///d:/Projetos/2025/Sagnus/Fontes/Backend/sagnus/sagnus-bc-auth/src/test/java/com/slifesys/sagnus/auth/ArchitectureTest.java)

**Status:** Regras padrão implementadas

---

## Regras Enforçadas

### Todas as BCs

| Regra | Descrição | ADR |
|-------|-----------|-----|
| **Domain Purity** | Domain não depende de Spring/JPA/Hibernate | ADR-0001, ADR-0004 |
| **Layer Isolation** | Domain não depende de API/Infrastructure | Hexagonal |
| **Application Boundary** | Application não depende de Infrastructure | ADR-0001 |
| **BC Isolation** | Sem imports diretos entre BCs | ADR-0003 |
| **Controller Location** | Controllers em `api..` | CONVENSOES.md |
| **UseCase Naming** | UseCases terminam com `UseCase` | ADR-0007 |

### bc-nfe Específico

| Regra | Descrição | ADR |
|-------|-----------|-----|
| **Fiscal Rules** | CalculadoraIva em `domain.service..` | ADR-0012 |

---

## Violações Conhecidas (Serão Corrigidas)

### bc-corp
- 🔴 `Produto.java` → PR-2

### bc-adm
- 🔴 Domain services com Spring → PR-5
- 🔴 Application → Infrastructure → PR-5

### bc-estoque
- 🔴 Domain models com JPA → PR-4
- 🔴 Dependency em bc-corp → PR-4

---

## Como Executar

### Teste Individual
```bash
# Testar um BC específico
mvn test -Dtest=ArchitectureTest -pl sagnus-bc-nfe

# Testar todos os BCs
mvn test -Dtest=ArchitectureTest
```

### Teste Contínuo (CI)
```bash
# Executar apenas testes de arquitetura
mvn test -Dtest=*ArchitectureTest
```

---

## Próximos Passos

1. ✅ **PR-1 Completo** — ArchUnit enforcement ativo
2. 🔄 **PR-2** — Corrigir `Produto.java` (bc-corp)
3. 🔄 **PR-3** — Mover ports para domain (bc-corp)
4. 🔄 **PR-4** — Quebrar coupling estoque → corp
5. 🔄 **PR-5** — Corrigir layering (bc-adm)
6. 🔄 **PR-6** — Normalizar API packages (bc-adm)
7. 🔄 **PR-7** — Gateway strategy

---

## Commit Message

```
test(governance): enforce ADR-0001 with ArchUnit junit5 across all BCs

- Fix bc-estoque ArchitectureTest to use JUnit5 annotations
- Add ArchitectureTest to bc-corp, bc-adm, bc-nfe, bc-auth
- Enforce: domain purity, layer boundaries, BC isolation
- Add special rule for CalculadoraIvaService location (bc-nfe)
- Temporary allowance for interfaces.. package in bc-adm (PR-6 will fix)

Known violations (will be fixed in subsequent PRs):
- V1: Produto.java (bc-corp) has JPA in domain → PR-2
- V2/V3: bc-adm domain/application layering → PR-5
- V1/V4: bc-estoque domain + coupling → PR-4

Refs: ADR-0001, ADR-0003, ADR-0004, ADR-0007, ADR-0012, V6
Fixes: V6 (ArchUnit not effective)
```

---

**Implementado por:** Antigravity  
**Baseado em:** `.ai-context`, `DECISIONS.md`, `CONVENCOES.md`  
**Status:** ✅ Pronto para commit

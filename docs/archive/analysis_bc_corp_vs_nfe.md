# Analysis Report: bc-corp vs bc-nfe

**Date:** 2025-12-19
**Reference:** `bc-nfe` (Gold Standard)
**Target:** `bc-corp`

## Executive Summary

`bc-corp` follows the general DDD and Clean Architecture principles established in the project. However, there are structural divergences compared to the newer `bc-nfe` module, particularly regarding the location of **Ports** and the absence of **Domain Events**.

## Detailed Comparison

| Feature                  | `bc-nfe` (Reference)                             | `bc-corp` (Current)                              | Status            |
| :----------------------- | :----------------------------------------------- | :----------------------------------------------- | :---------------- |
| **Layer Structure**      | `api`, `application`, `domain`, `infrastructure` | `api`, `application`, `domain`, `infrastructure` | ✅ Consistent     |
| **Ports Location**       | `application/port`                               | `domain/port`                                    | ⚠️ **Divergence** |
| **Domain Model**         | Rich Entities, Value Objects, Factories          | Rich Entities, Value Objects, Factories          | ✅ Consistent     |
| **Domain Events**        | `domain/event` package present                   | Missing `domain/event` package                   | ⚠️ **Gap**        |
| **Use Cases**            | `application/usecase`                            | `application/usecase`                            | ✅ Consistent     |
| **Repository Interface** | In `application/port`                            | In `domain/port`                                 | ⚠️ **Divergence** |

## Findings & Recommendations

### 1. Ports Location (Structural Refactoring)

**Observation:**

- `bc-nfe` defines its ports (interfaces for repositories, gateways, etc.) within the `application/port` package. This aligns with the view that the Application layer defines the contracts it needs the Infrastructure to fulfill.
- `bc-corp` defines `PessoaRepository` inside `domain/port`.

**Recommendation:**

- Move `com.slifesys.sagnus.corp.domain.port` content to `com.slifesys.sagnus.corp.application.port`.
- Update package declarations and imports.

### 2. Domain Events (Feature Gap)

**Observation:**

- `bc-nfe` has a structured way to handle domain events (`domain/event`), allowing side effects to be decoupled from the main flow.
- `bc-corp` does not seem to have this structure yet.

**Recommendation:**

- Introduce `domain/event` package in `bc-corp`.
- Implement basic event publishing mechanism if `bc-corp` requires side effects (e.g., notifying other contexts of updates).

### 3. Use Case Consistency

**Observation:**

- Both modules use the `UseCase` suffix and separate classes for each action (`EmitirNfeUseCase`, `CadastrarPessoaUseCase`).
- This is a strong point of consistency.

## Proposed Action Plan

1.  **Refactor `bc-corp` Ports**: Move `PessoaRepository` and other ports from `domain` to `application`.
2.  **Standardize Package Structure**: Ensure `bc-corp` matches `bc-nfe`'s folder layout exactly.

---

**Conclusion:** `bc-corp` is very close to the standard. The primary adjustment is moving the Ports to the Application layer to match `bc-nfe`.

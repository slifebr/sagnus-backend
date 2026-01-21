# Walkthrough: Refactoring to Contracts

## Goal
The objective was to resolve compilation errors and standardize the codebase by decoupling the API layer from the Application layer, introducing a dedicated Contracts layer (`sagnus-bc-nfe-contracts`, `sagnus-bc-corp-contracts`).

## Changes

### 1. Contract DTOs and Request Objects
Shared Contract modules were populated (or used) to define the data structures for API requests and responses.
- **DTOs**: `MarcaDTO`, `PessoaDTO`, `TransportadoraDTO`, `EmitirNfeResponse`.
    - **Note**: `TransportadoraDTO` was implemented manually (POJO + Builder) to bypass Lombok environment issues.
- **Request Objects**: `MarcaCreateRequest`, `MarcaUpdateRequest`, `PessoaCreateRequest`, `PessoaUpdateRequest`, `EmitirNfeRequest`, `EmitirNfeItemRequest`.

### 2. Refactoring UseCases
Application UseCases were refactored to accept **Request Objects** directly (or `id` + `Request Object`) and return **DTOs**, removing the need for internal "Command" objects.
- **Corp Module**:
    - `AlterarMarcaUseCase` now accepts `(Long id, MarcaUpdateRequest cmd)` and returns `MarcaDTO`.
    - `CadastrarMarcaUseCase` accepts `MarcaCreateRequest` and returns `MarcaDTO`.
    - `AlterarPessoaUseCase` accepts `(Long id, PessoaUpdateRequest cmd)` and returns `PessoaDTO`.
    - `CadastrarTransportadoraUseCase` accepts `CadastrarTransportadoraCommand` and returns `TransportadoraDTO`. (Updated `Transportadora` domain model with manual getters).
- **NFe Module**:
    - `EmitirNfeUseCase` accepts `EmitirNfeRequest` and returns `EmitirNfeResponse`.

### 3. Refactoring Controllers
API Controllers (REST and GraphQL) were updated to use the new UseCase signatures and Contract objects.
- **REST**:
    - `MarcaController`: Updated to use `MarcaCreateRequest`/`MarcaUpdateRequest`.
    - `PessoaController`: Updated to pass `id` explicitly to `AlterarPessoaUseCase`.
- **GraphQL**:
    - `NfeGraphqlController`: Updated to parse String inputs to `BigDecimal`.
    - `CorpGraphqlController`: Updated to match the new `AlterarPessoaUseCase` signature.

### 4. Cleanup
- Deleted legacy files: `MarcaCreateRequest` (old API), `MarcaUpdateRequest`, `MarcaResponse`, `EmitirNfeCommand`, `EmitirNfeItemCommand`.
- Fixed typos and missing package declarations.

## Verification
Ran `mvn clean install -DskipTests` and confirmed successful compilation of:
- `sagnus-shared-kernel`
- `sagnus-bc-nfe-contracts`
- `sagnus-bc-corp-contracts`
- `sagnus-bc-nfe`
- `sagnus-bc-corp`
- `sagnus-api-gateway`
- `sagnus-bc-auth`

**Remaining Issues**:
- `sagnus-bc-adm`: Failures in `FilialEntity`, `PerfilEntity`, `EmpresaEntity` due to missing Lombok getters.

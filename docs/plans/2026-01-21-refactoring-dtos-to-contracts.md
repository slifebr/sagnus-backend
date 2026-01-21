# Refactoring DTOs to Contracts

The goal is to enforce architectural boundaries by moving DTOs and Commands used by the Gateway from the internal Application layer of Bounded Contexts (BCs) to public "Contracts" modules.

## User Review Required
> [!IMPORTANT]
> This change involves modifying the signatures of Application Services in `sagnus-bc-corp` and `sagnus-bc-nfe`. The Gateway currently calls these services directly. We will change the Application Services to accept/return the new Contract types.
> We will also introduce a `TipoPessoa` enum in the contracts package to avoid depending on the domain model.

## Proposed Changes

### sagnus-bc-corp-contracts
#### [NEW] DTOs and Requests
- `com.slifesys.sagnus.corp.contract.pessoa.PessoaDTO` (Replaces `PessoaResult`)
- `com.slifesys.sagnus.corp.contract.pessoa.PessoaCreateRequest` (Replaces `CadastrarPessoaCommand`)
- `com.slifesys.sagnus.corp.contract.pessoa.PessoaUpdateRequest` (Replaces `AlterarPessoaCommand`)
- `com.slifesys.sagnus.corp.contract.pessoa.TipoPessoa` (Enum copy for contract)
- `com.slifesys.sagnus.corp.contract.marca.MarcaDTO`
- `com.slifesys.sagnus.corp.contract.transportadora.TransportadoraDTO`
- `com.slifesys.sagnus.corp.contract.vendedor.VendedorDTO`
- `com.slifesys.sagnus.corp.contract.sindicato.SindicatoDTO`

### sagnus-bc-corp
#### [MODIFY] Application Services
- Modify `PessoaApplicationService` (and others) to accept `PessoaCreateRequest`/`UpdateRequest` and return `PessoaDTO`.
- Implement mapping internally (or use MapStruct) to convert Contract objects to Domain objects.

### sagnus-bc-nfe-contracts
#### [NEW] Module
- Create standard Maven module structure.
- `com.slifesys.sagnus.nfe.contract.emitir.EmitirNfeRequest`
- `com.slifesys.sagnus.nfe.contract.emitir.EmitirNfeResponse`

### sagnus-bc-nfe
#### [MODIFY] Application Services
- `NfeApplicationService` (or equivalent) to use the new contracts.

### sagnus-api-gateway
#### [MODIFY] GraphQL Controllers
- Update `CorpGraphqlController` and `NfeGraphqlController` to import the new Contract classes.
- Remove imports to `*.application.dto.*` and `*.application.command.*`.

## Verification Plan

### Automated Tests
- Run `mvn clean install` on `sagnus-bc-corp-contracts` (new modules first).
- Run `mvn clean install` on `sagnus-bc-corp`.
- Run `mvn clean install` on `sagnus-bc-nfe-contracts`.
- Run `mvn clean install` on `sagnus-bc-nfe`.
- Run `mvn clean install` on `sagnus-api-gateway`.
- Check if ArchUnit tests pass (if environment allows).

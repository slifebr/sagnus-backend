# BC NFe — Persistência JPA mínima (v1)

Este pacote adiciona persistência JPA **sem poluir o domínio**.

## O que foi criado
- Entities JPA:
  - `NfeEntity` (tabela `nfe_nfe`)
  - `NfeItemEntity` (tabela `nfe_item`)
- `NfeJpaRepository` (Spring Data)
- `NfeJpaRepositoryAdapter` implementando `NfeRepository`
- `NfeJpaConfig` (EntityScan + EnableJpaRepositories)

## RTC IBS/CBS — Persistência via JSON (v1)
Para suportar evolução do RTC sem ficar “refém” de schema em cada iteração, o item passa a ter:
- coluna `tributacao_json` (`TEXT` no PostgreSQL) contendo um JSON com IBS/CBS + CST + `cClassTrib`.

Script SQL sugerido (PostgreSQL):
- `docs/db/001_add_nfe_item_tributacao_json.sql`

## Como ativar
Por padrão, o projeto pode estar rodando com `InMemoryNfeRepositoryAdapter`.

Para ligar JPA, configure no `application.yml` do BC NFe:
```yaml
sagnus:
  nfe:
    persistence: jpa
```

E garanta dependências no POM do bc-nfe:
- spring-boot-starter-data-jpa
- postgresql
- (opcional) flyway-core / liquibase-core — se você quiser migração automática

## Observações importantes
1) O mapper assume que o domínio tem um método `rehydrate(...)` para reconstituir o agregado.
2) O JSON de tributos está versionado (`schema: RTC-IBSCBS-V1`) para facilitar compatibilidade futura.

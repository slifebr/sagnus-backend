# BC NFe — Persistência JPA mínima (v1)

Este pacote adiciona persistência JPA **sem poluir o domínio**.

## O que foi criado
- Entities JPA:
  - `NfeEntity` (tabela `nfe_nfe`)
  - `NfeItemEntity` (tabela `nfe_item`)
- `NfeJpaRepository` (Spring Data)
- `NfeJpaRepositoryAdapter` implementando `NfeRepository`
- `NfeJpaConfig` (EntityScan + EnableJpaRepositories)
- Flyway migration:
  - `db/migration/V1__nfe_persistencia_minima.sql`

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
- flyway-core (opcional, se você quiser migração automática)

## Observações importantes
1) O mapper assume que o domínio tem um método `rehydrate(...)` para reconstituir agregado.
   Se ainda não existir, eu ajusto para o seu modelo real (me diga como está a classe Nfe).
2) O schema/tabelas aqui são “mínimos para rodar”. Depois alinhamos nomes/constraints ao padrão do Sagnus.

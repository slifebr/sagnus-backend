# sagnus-bc-fina-base (Template Oficial)

Este módulo existe para você **copiar/renomear** e criar novos Bounded Contexts (BCs) mantendo o padrão DDD do Sagnus.

## Como criar um novo BC a partir deste template

1. **Copie** a pasta:
   - de: `sagnus-bc-fina-base`
   - para: `sagnus-bc-<seu-bc>`

2. Ajuste o `pom.xml` do novo módulo:
   - `<artifactId>sagnus-bc-<seu-bc></artifactId>`
   - `<name>` / `<description>`

3. Renomeie os packages:
   - de: `com.slifesys.sagnus.fina.base`
   - para: `com.slifesys.sagnus.<seu_bc>`

4. Inclua o módulo novo no `pom.xml` raiz em `<modules>`.

## Padrão de camadas (obrigatório)

- `api` (Controllers, DTOs, Mappers) — **entrada**
- `application` (UseCases, Commands/Queries, Ports) — **orquestração**
- `domain` (Aggregates, VOs, regras, eventos, exceptions) — **núcleo**
- `infrastructure` (Adapters: persistence, messaging, http clients) — **saída**

### Regras simples
- `domain` **não importa Spring**
- `application` importa o mínimo (ex.: `@Service`), sem `RestController` e sem `Entity`
- Tudo que acessa banco/fila/http fica em `infrastructure`

## Próximos upgrades recomendados para BC real
- Outbox Pattern + Rabbit/Kafka
- Persistência JPA (Entity separada do domínio)
- ArchUnit para garantir as regras

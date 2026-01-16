## Regras obrigatórias
1. **Ports do domínio**
   - Devem ficar em `domain/repository`.
   - Ex.: `domain/repository/ProdutoRepository.java`

2. **Persistência (JPA/JDBC)**
   - Spring Data: `infrastructure/persistence/repository/*JpaRepository.java`
   - Implementação do port: `infrastructure/persistence/adapter/*RepositoryImpl.java`
   - Entity JPA: `infrastructure/persistence/entity/*Entity.java`
   - Mapper Entity <-> Domain: `infrastructure/persistence/mapper/*EntityMapper.java`

3. **Quando criar infrastructure/persistence**
   - Apenas quando o BC possui persistência real (tabelas e/ou integração DB).
   - Se o BC ainda não tem DB, NÃO criar `persistence/`.
   - Stubs ficam em `infrastructure/repository/InMemory*`.

## Convenções de nomes
- Port do domínio: `XxxRepository`
- Spring Data: `XxxJpaRepository`
- Adapter: `XxxRepositoryImpl`
- Entity JPA: `XxxEntity`
- Mapper entity-domain: `XxxEntityMapper`
- Mapper dto-app: `XxxDtoMapper`

com.slifesys.sagnus.<bc>/
  api/
    controller/                (REST)
    graphql/                   (futuro / opcional)
    dto/
    mapper/                    (DTO <-> Application)
  application/
    usecase/
    service/                   (orquestração, se precisar)
    port/
      in/                      (interfaces de casos de uso, se quiser)
      out/                     (opcional, se você preferir ports aqui)
  domain/
    model/                     (Aggregates, Entities, ValueObjects)
    repository/                (PORTS de persistência)
    service/                   (Domain services)
    event/                     (Domain events)
    exception/
  infrastructure/
    config/                    (Spring config, beans)
    event/                     (outbox listener, handlers, publisher)
    persistence/               (SÓ SE houver banco)
      entity/                  (JPA entity)
      repository/              (Spring Data interfaces)
      mapper/                  (Entity <-> Domain)
      adapter/                 (implementa domain.repository.*)
    repository/                (SÓ stubs: InMemory*, Fake*, etc.)
    http/                      (clients externos: Feign/WebClient)
    messaging/                 (Rabbit/Kafka adapters)
Se quiser o nome mais “purista hexagonal”, pode renomear persistence/adapter 
para adapters/persistence e manter o resto igual. Mas o layout acima já está ótimo e pragmático.

Regras oficiais (para acabar com a “inconsistência”)

# Regra A — Ports (contratos) do repositório

✅ Ficam aqui:

domain/repository/* (recomendado no Sagnus)

Exemplo:

domain/repository/EstoqueLocalRepository.java (interface/port)

# Regra B — Spring Data NÃO é “o repositório do domínio”

✅ Fica aqui:

infrastructure/persistence/repository/*JpaRepository.java

Exemplo:

EstoqueLocalJpaRepository extends JpaRepository<EstoqueLocalEntity, Long>

Esse “repository” é do Spring Data, não do domínio.

# Regra C — Implementação do port do domínio (adapter)

✅ Fica aqui:

infrastructure/persistence/adapter/*RepositoryImpl.java

Exemplo:

EstoqueLocalRepositoryImpl implements domain.repository.EstoqueLocalRepository

# Regra D — Mappers

DTO <-> Application: api/mapper

Entity <-> Domain: infrastructure/persistence/mapper

# Regra E — Quando criar infrastructure/persistence

Só cria quando:

existe tabela / persistência real / JPA / JDBC / MyBatis etc.

Se o BC ainda é “base/stub”, não cria.

Use infrastructure/repository/InMemory* se precisar.

## Checklist de revisão rápida (para você validar BC por BC)

# DDD / Hexagonal

✅ Domain não depende de Spring, JPA, Jackson, Feign, etc.

 ✅Ports estão em domain/repository (ou application/port/out se você decidir isso globalmente).

 infrastructure/persistence/entity não é importada no domain/application.

# Persistência

 ✅ infrastructure/persistence/repository/*JpaRepository existe apenas se há DB

 ✅ infrastructure/persistence/adapter/*Impl implementa exatamente o port do domínio

 ✅ Mapper Entity <-> Domain existe (evitar “domain com annotation JPA”)

# Stubs

 Se o BC ainda não tem banco:

 ✅ infrastructure/repository/InMemory* pode existir

 não existe infrastructure/persistence/*

# API

 ✅ Controller usa application/usecase

 ✅ DTOs não vazam para Domain


Ajuste específico para  (bc-estoque vs bc-fina-base)
bc-estoque (já está quase no padrão)

✅ Já tem infrastructure/persistence/...

Sugestão pequena para consolidar:

mover EstoqueLocalRepositoryImpl para:

infrastructure/persistence/adapter/

deixar infrastructure/persistence/repository/ só para Spring Data

Fica bem claro:

repository/ = Spring Data

adapter/ = implementação do port do domínio

bc-fina-base (a diferença é natural)

✅ Hoje ele não tem persistência real — então não deve ter persistence/.

Quando entrar a primeira tabela persistida:

cria infrastructure/persistence/{entity,repository,mapper,adapter}

Como o new-bc-from-sql deve gerar (contrato para o template)
Se o SQL tiver tabelas do BC

Gerar automaticamente:

domain/repository/<Entidade>Repository.java

infrastructure/persistence/entity/<Entidade>Entity.java

infrastructure/persistence/repository/<Entidade>JpaRepository.java

infrastructure/persistence/mapper/<Entidade>EntityMapper.java

infrastructure/persistence/adapter/<Entidade>RepositoryImpl.java

Se o BC for “base / sem SQL”

Gerar:

infrastructure/repository/InMemoryExampleRepository.java (opcional)

NÃO gerar infrastructure/persistence

##  Convenções de nomes (para evitar deriva)

✅ Port do domínio: XxxRepository

✅ Spring Data: XxxJpaRepository

✅ Adapter: XxxRepositoryImpl

✅ Entity JPA: XxxEntity

✅ Mapper entity-domain: XxxEntityMapper

✅ Mapper dto-app: XxxDtoMapper



# (1) um trecho pronto de README (copiar/colar) 
# (2) um “diff conceitual” (lista objetiva de mudanças) para aplicar no bc-estoque e deixar o padrão 100% consolidado.

1) Texto pronto para README do Template (Sagnus BC Standard)

Cole isso no README do template (ou num docs/ARCHITECTURE_BC_STANDARD.md):

# Sagnus – Padrão Oficial de Pacotes por Bounded Context (DDD + Hexagonal)

Este projeto adota DDD + Arquitetura Hexagonal para manter o domínio independente de frameworks e de banco de dados.

## Princípios
- **Domain** contém regras e contratos (ports). Não depende de Spring/JPA/Jackson.
- **Application** orquestra casos de uso (use cases). Conhece o domínio e suas interfaces.
- **Infrastructure** contém detalhes técnicos (adapters): persistência, mensageria, HTTP clients, cache etc.
- A pasta **infrastructure/persistence** só existe quando há persistência real (JPA/JDBC/etc).
- A pasta **infrastructure/repository** é reservada a stubs/in-memory/fakes (quando não há DB).

## Estrutura padrão do BC
# Sagnus – Padrão Oficial de Pacotes por Bounded Context (DDD + Hexagonal)



com.slifesys.sagnus.<bc>/
api/
controller/
dto/
mapper/ # DTO <-> Application
graphql/ # opcional/futuro
application/
usecase/
port/
in/ # opcional
out/ # opcional (se ports não estiverem no domain)
domain/
model/
repository/ # PORTS (interfaces do domínio)
service/
event/
exception/
infrastructure/
config/
event/
persistence/ # SÓ se houver DB
entity/ # JPA Entities
repository/ # Spring Data (JpaRepository)
mapper/ # Entity <-> Domain
adapter/ # Implementa domain.repository.*
repository/ # SOMENTE stubs (InMemory*, Fake*)
http/ # clients externos (Feign/WebClient)
messaging/ # Rabbit/Kafka adapters


## Regras obrigatórias
1. **Ports do domínio**
   - Devem ficar em `domain/repository`.
   - Ex.: `domain/repository/ProdutoRepository.java`

2. **Persistência (JPA/JDBC)**
   - Spring Data: `infrastructure/persistence/repository/*JpaRepository.java`
   - Implementação do port: `infrastructure/persistence/adapter/*RepositoryImpl.java`
   - Entity JPA: `infrastructure/persistence/entity/*Entity.java`
   - Mapper Entity <-> Domain: `infrastructure/persistence/mapper/*EntityMapper.java`

3. **Quando criar infrastructure/persistence**
   - Apenas quando o BC possui persistência real (tabelas e/ou integração DB).
   - Se o BC ainda não tem DB, NÃO criar `persistence/`.
   - Stubs ficam em `infrastructure/repository/InMemory*`.

## Convenções de nomes
- Port do domínio: `XxxRepository`
- Spring Data: `XxxJpaRepository`
- Adapter: `XxxRepositoryImpl`
- Entity JPA: `XxxEntity`
- Mapper entity-domain: `XxxEntityMapper`
- Mapper dto-app: `XxxDtoMapper`

2) “Diff conceitual” para alinhar o bc-estoque ao padrão

O bc-estoque já tem infrastructure/persistence, mas está misturando “repository” (Spring Data) com “RepositoryImpl”.

# Mudança 1 — Criar pasta adapter dentro de infrastructure/persistence

✅ ANTES:

infrastructure/persistence/repository/EstoqueLocalRepositoryImpl.java
infrastructure/persistence/repository/EstoqueLocalJpaRepository.java

✅ DEPOIS (padrão oficial):

infrastructure/persistence/adapter/EstoqueLocalRepositoryImpl.java
infrastructure/persistence/repository/EstoqueLocalJpaRepository.java

📌 Regra:

repository/ = somente Spring Data

adapter/ = implementa o port do domínio

# Mudança 2 — Ajustar imports e package do RepositoryImpl

No EstoqueLocalRepositoryImpl:

alterar package com.slifesys.sagnus.estoque.infrastructure.persistence.repository;
para

package com.slifesys.sagnus.estoque.infrastructure.persistence.adapter;

E atualizar onde ele é referenciado (geralmente é Spring component, então só o package muda).

# Mudança 3 — Validar que o port do domínio está no lugar certo

Confirmar que existe algo como:

com.slifesys.sagnus.estoque.domain.repository.EstoqueLocalRepository

E que o EstoqueLocalRepositoryImpl faz:

implements EstoqueLocalRepository

✅ Isso mantém o contrato “posse do domínio”.

# Mudança 4 — Confirmar isolamento do domínio

Garantir que:

domain/model/* não tem @Entity, @Table, @Column

domain/* não importa org.springframework.* nem jakarta.persistence.*

Se tiver, mover anotação e campos técnicos para infrastructure/persistence/entity.

3) Ajuste equivalente para bc-fina-base (se quiser 100% “padrão” visual)

Hoje o bc-fina-base parece estar “base”, então é correto não ter persistence/.

Mas para não confundir a equipe, sugiro colocar uma nota no README do próprio BC:

“Este BC ainda não possui persistência real. Enquanto isso, pode conter stubs em infrastructure/repository.”

E só quando entrar tabela/DB nele:

criar infrastructure/persistence/{entity,repository,mapper,adapter}

Próximo passo sugerido (objetivo)

Aplicar a mudança do bc-estoque (mover RepositoryImpl para adapter/).

Colar o README padrão no template (e/ou docs).

Ajustar o new-bc-from-sql para:

quando houver tabelas: gerar persistence/*

quando não houver: não gerar persistence/* (somente stubs)


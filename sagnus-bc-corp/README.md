# sagnus-bc-corp (v3 - DDD Etapas A+B)

Este pacote entrega o BC CORP refatorado para DDD explícito e com persistência (Etapa B) via Adapter.

## Pacotes
- `com.slifesys.sagnus.corp.domain` → domínio puro (sem JPA/Spring)
- `com.slifesys.sagnus.corp.application` → UseCases + DTOs
- `com.slifesys.sagnus.corp.api` → REST (controller fino)
- `com.slifesys.sagnus.corp.infrastructure.persistence` → JPA + Spring Data + Adapter + Mapper

## Observações importantes (Etapa B)
- As tabelas/colunas do JPA aqui assumem:
  - `corp_pessoa(tipo, documento, nome, email, site, ativa, criada_em, atualizada_em)`
  - `corp_pessoa_endereco(pessoa_id, logradouro, numero, complemento, bairro, cidade, uf, cep, pais)`
- Se seu DDL tiver nomes diferentes, ajuste as anotações `@Column`/`@JoinColumn`.

Gerado em: 2025-12-15

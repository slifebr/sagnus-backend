# sagnus-bc-corp

BC CORP (Corporate Core) — Shared Kernel leve do SAGNUS ERP.

## Primeiro recorte: Pessoa

- corp_pessoa
- corp_pessoa_endereco
- corp_pessoa_telefone
- corp_pessoa_contato

## Rodar local

1) Ajuste `application.yml` para o seu Postgres (db/senha).
2) Rode:

```bash
mvn -pl sagnus-bc-corp spring-boot:run
```

Endpoints:
- GET `/corp/pessoas/{id}`
- POST `/corp/pessoas`

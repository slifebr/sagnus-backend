# Diretrizes de Banco — Agnóstico e Seguro

## Princípios
- Evitar SQL vendor-specific fora da infraestrutura
- Não usar identificadores entre aspas (evitar problemas "ID" vs id)
- Preferir migrações com convenções consistentes (Flyway/Liquibase se presentes)

## Onde colocar SQL
- SQL nativo somente em `infrastructure/` (nunca em domain/)

## Portabilidade
- Se precisar de recurso específico (Oracle/Postgres), isolar em adapter e documentar


# Sagnus BC Estoque

Bounded Context para Gestão de Estoque, Inventário e Movimentações.

## Padrão de camadas (obrigatório)

- `api` (Controllers, DTOs, Mappers) — **entrada**
- `application` (UseCases, Commands/Queries, Ports) — **orquestração**
- `domain` (Aggregates, VOs, regras, eventos, exceptions) — **núcleo**
- `infrastructure` (Adapters: persistence, messaging, http clients) — **saída**

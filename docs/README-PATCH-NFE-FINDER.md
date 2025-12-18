# NFe XML v2 — Finder adapters

Este patch adiciona as implementações do `NfeFinderPort` que faltavam para o pipeline de XML:

- `InMemoryNfeFinderAdapter` (fallback)
- `NfeJpaFinderAdapter` (quando `sagnus.nfe.persistence=jpa`)

## Onde copiar
Copie os arquivos para dentro do módulo `sagnus-bc-nfe` nas pastas indicadas no zip.

## Observação importante
O `NfeJpaFinderAdapter` usa `NfeJpaMapper.toDomain(entity)`.
Se o seu `NfeJpaMapper` ainda não possuir esse método, me mande o arquivo do mapper e eu adapto
(o adapter pode fazer mapping manual também, mas é melhor centralizar no mapper).

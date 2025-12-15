# Contrato Java CORP (v1)

Este pacote cria o módulo **sagnus-bc-corp-api** (contrato) e ajusta o **sagnus-bc-corp** para expor ports/DTOs sem vazar domínio/JPA.

## O que entra no contrato (`sagnus-bc-corp-api`)
- `CorpPessoaQueryPort` (consulta)
- `PessoaResumoDTO` (DTO enxuto para outros BCs, ex.: AUTH/NFe)

## Como integrar no seu repo
1. Copie as pastas:
   - `sagnus-bc-corp-api/`
   - `sagnus-bc-corp/` (apenas os arquivos adicionados/alterados desta entrega)
2. No POM pai (root), adicione o módulo:
   ```xml
   <modules>
     ...
     <module>sagnus-bc-corp-api</module>
     <module>sagnus-bc-corp</module>
     ...
   </modules>
   ```
3. Garanta dependência:
   - `bc-auth` e `bc-nfe` passam a depender **somente** do `sagnus-bc-corp-api`.

Gerado em: 2025-12-15

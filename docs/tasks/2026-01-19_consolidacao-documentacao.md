# Task: Consolidação de Documentação

**Data:** 2026-01-19  
**Status:** ✅ Concluída

## Objetivo

Consolidar e melhorar os três principais arquivos de documentação (`.cursorrules`, `DECISIONS.md`, `CONVENSOES.md`) para eliminar redundâncias, adicionar ADRs faltantes e estabelecer cross-references.

## Checklist

### Consolidar CONVENSOES.md
- [x] Remover duplicate package structure definitions (keep one canonical version)
- [x] Remover duplicate persistence rules sections
- [x] Remover duplicate naming conventions
- [x] Reorganizar em seções claras: Structure, Rules, Naming, Checklist, Examples

### Adicionar ADRs Faltantes ao DECISIONS.md
- [x] Add ADR-0010: Port location by type (repository vs external integration)
- [x] Add ADR-0011: API Gateway aggregation rules (read-only via contracts)
- [x] Add ADR-0012: Fiscal rules service classification (Domain vs Application)

### Atualizar .cursorrules
- [x] Add cross-references to CONVENSOES.md for package structure
- [x] Add reference to new ADRs for port location rules
- [x] Improve assistant behavior section with specific references

### Verificação
- [x] Review all three files for consistency
- [x] Ensure no conflicting rules remain
- [x] Verify cross-references are accurate

## Resultado

- **CONVENSOES.md:** Reduzido em 46% (362 → 195 linhas)
- **DECISIONS.md:** Adicionadas 3 novas ADRs
- **.cursorrules:** Atualizado com cross-references

**Walkthrough:** [2026-01-19_consolidacao-documentacao.md](../walkthroughs/2026-01-19_consolidacao-documentacao.md)

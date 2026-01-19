# .agent — Configuração do Antigravity

Este diretório contém configurações e regras personalizadas para o assistente **Antigravity** (Google Gemini).

## Arquivos

### `rules.md`
Regras obrigatórias que o Antigravity deve seguir ao trabalhar neste projeto.

**Principais diretrizes:**
- Consultar `.cursorrules`, `DECISIONS.md` e `CONVENSOES.md` antes de propor mudanças
- Seguir ADRs (Architecture Decision Records)
- Respeitar estrutura de pacotes e convenções de nomenclatura
- Manter domínio puro (sem frameworks)

## Como Funciona

### Antigravity (Google Gemini)
- Lê automaticamente `rules.md` ao iniciar trabalho no projeto
- Usa como guideline para todas as decisões arquiteturais
- Consulta os documentos referenciados quando necessário

### Cursor IDE
- Lê automaticamente `.cursorrules` na raiz do projeto
- Aplica regras ao assistente de IA integrado

## Diferença entre `.cursorrules` e `.agent/rules.md`

| Aspecto | `.cursorrules` | `.agent/rules.md` |
|---------|----------------|-------------------|
| **Usado por** | Cursor IDE | Antigravity (Gemini) |
| **Formato** | Texto livre | Markdown estruturado |
| **Conteúdo** | Regras técnicas detalhadas | Meta-regras + referências |
| **Atualização** | Quando regras mudam | Quando workflow muda |

## Sincronização

Os três documentos principais devem estar sempre sincronizados:

1. **`.cursorrules`** — Regras técnicas detalhadas
2. **`DECISIONS.md`** — ADRs (por que fazemos assim)
3. **`CONVENSOES.md`** — Estrutura e organização (como fazemos)

O arquivo `.agent/rules.md` **referencia** esses três documentos, não os duplica.

## Manutenção

### Quando atualizar `.agent/rules.md`

✅ **Atualizar quando:**
- Adicionar novos documentos de referência
- Mudar workflow de desenvolvimento
- Adicionar novas categorias de regras

❌ **NÃO atualizar quando:**
- Mudar regras técnicas (atualizar `.cursorrules`)
- Adicionar ADRs (atualizar `DECISIONS.md`)
- Mudar estrutura de pacotes (atualizar `CONVENSOES.md`)

### Checklist de Sincronização

Após atualizar qualquer documento:

- [ ] `.cursorrules` atualizado?
- [ ] `DECISIONS.md` atualizado (se ADR nova)?
- [ ] `CONVENSOES.md` atualizado (se estrutura mudou)?
- [ ] Cross-references validadas?
- [ ] `.agent/rules.md` aponta para documentos corretos?

## Workflows

O diretório `.agent/workflows/` pode conter workflows específicos do projeto (se necessário).

---

**Criado em:** 2026-01-19  
**Versão:** 1.0

# Histórico de Walkthroughs e Tasks

Este diretório mantém um histórico versionado de todos os walkthroughs e tasks executados no projeto Sagnus ERP.

## Estrutura

```
docs/
├── walkthroughs/          # Walkthroughs de implementações
│   ├── 2026-01-19_consolidacao-documentacao.md
│   ├── 2026-01-19_analise-violacoes.md
│   └── 2026-01-19_pr1-archunit-enforcement.md
├── tasks/                 # Tasks e checklists
│   ├── 2026-01-19_consolidacao-documentacao.md
│   ├── 2026-01-19_analise-violacoes.md
│   └── 2026-01-19_pr1-archunit-enforcement.md
└── README.md             # Este arquivo
```

## Convenção de Nomenclatura

### Walkthroughs
- **Formato:** `YYYY-MM-DD_nome-descritivo.md`
- **Exemplo:** `2026-01-19_pr1-archunit-enforcement.md`
- **Conteúdo:** Documentação completa do que foi implementado, mudanças, validações

### Tasks
- **Formato:** `YYYY-MM-DD_nome-descritivo.md`
- **Exemplo:** `2026-01-19_pr1-archunit-enforcement.md`
- **Conteúdo:** Checklist de tarefas, status de progresso

## Como Usar

### Ao Iniciar Nova Tarefa

1. Criar arquivo em `docs/tasks/YYYY-MM-DD_nome-tarefa.md`
2. Definir checklist de tarefas
3. Marcar progresso com `[ ]`, `[/]`, `[x]`

### Ao Completar Tarefa

1. Criar arquivo em `docs/walkthroughs/YYYY-MM-DD_nome-tarefa.md`
2. Documentar o que foi feito
3. Incluir links para arquivos modificados
4. Adicionar screenshots/evidências se relevante

### Referência Cruzada

Use links relativos entre documentos:
```markdown
Veja também: [Task Original](../tasks/2026-01-19_pr1-archunit-enforcement.md)
```

## Índice Cronológico

### 2026-01-19

#### Consolidação de Documentação
- **Task:** [2026-01-19_consolidacao-documentacao.md](tasks/2026-01-19_consolidacao-documentacao.md)
- **Walkthrough:** [2026-01-19_consolidacao-documentacao.md](walkthroughs/2026-01-19_consolidacao-documentacao.md)
- **Resumo:** Consolidou CONVENSOES.md, adicionou ADRs 0010-0012, criou .agent/rules.md

#### Análise de Violações Arquiteturais
- **Task:** [2026-01-19_analise-violacoes.md](tasks/2026-01-19_analise-violacoes.md)
- **Walkthrough:** [2026-01-19_analise-violacoes.md](walkthroughs/2026-01-19_analise-violacoes.md)
- **Resumo:** Análise completa de conformidade, identificou 1 violação crítica e 2 menores

#### PR-1: ArchUnit Enforcement
- **Task:** [2026-01-19_pr1-archunit-enforcement.md](tasks/2026-01-19_pr1-archunit-enforcement.md)
- **Walkthrough:** [2026-01-19_pr1-archunit-enforcement.md](walkthroughs/2026-01-19_pr1-archunit-enforcement.md)
- **Status:** 🔄 Em andamento
- **Resumo:** Implementação de testes ArchUnit em todos os BCs

---

**Última atualização:** 2026-01-19

# Sagnus ERP — Regras do Antigravity

## Contexto do Projeto

Este é o projeto **Sagnus ERP**, um sistema ERP fiscal brasileiro construído com:
- **Arquitetura:** DDD + Bounded Contexts + Hexagonal (Ports & Adapters)
- **Stack:** Java 21, Spring Boot 3.3.x, Maven multi-módulo
- **Domínio crítico:** NFe (Nota Fiscal Eletrônica) com IVA Dual (IBS/CBS)

## Documentos Obrigatórios de Consulta

Antes de propor qualquer mudança arquitetural, criação de módulos, ou alteração de padrões, você **DEVE** consultar os seguintes documentos na raiz do projeto:

### 1. `.cursorrules`
**Quando consultar:**
- Sempre que iniciar trabalho em qualquer módulo
- Antes de criar novos Bounded Contexts
- Ao implementar persistência, APIs ou casos de uso

**Conteúdo:**
- Regras de camadas (domain/application/infrastructure/api)
- Contratos entre BCs
- Regras do API Gateway
- Padrões fiscais (IVA Dual)
- Convenções de código Java

### 2. `DECISIONS.md`
**Quando consultar:**
- Antes de propor mudanças arquiteturais
- Ao decidir onde colocar ports (ADR-0010)
- Ao trabalhar no API Gateway (ADR-0011)
- Ao implementar regras fiscais (ADR-0012)
- Quando houver dúvida sobre "por que fazemos assim"

**Conteúdo:**
- ADRs (Architecture Decision Records)
- Justificativas de decisões arquiteturais
- Consequências de cada decisão

### 3. `CONVENSOES.md`
**Quando consultar:**
- Ao criar novos BCs ou módulos
- Ao implementar persistência (JPA/repositories)
- Ao nomear classes, interfaces e pacotes
- Ao fazer code review

**Conteúdo:**
- Estrutura de pacotes canônica (§ 1)
- Regras de persistência (§ 2)
- Convenções de nomenclatura (§ 3)
- Checklist de revisão (§ 5)

## Fluxo de Trabalho Obrigatório

### Para Mudanças Arquiteturais

1. **Ler** `.cursorrules` + `DECISIONS.md` + `CONVENSOES.md`
2. **Verificar** se há ADR existente que se aplica
3. **Propor** solução alinhada com as ADRs
4. **Se precisar desviar:** Sugerir nova ADR em `DECISIONS.md`

### Para Implementação de Código

1. **Consultar** `.cursorrules` para regras de camadas
2. **Consultar** `CONVENSOES.md` para estrutura de pacotes e nomenclatura
3. **Implementar** seguindo os padrões
4. **Validar** com checklist do `CONVENSOES.md` § 5

### Para Persistência (JPA/DB)

1. **Consultar** `CONVENSOES.md` § 2 (Regras de Persistência)
2. **Verificar** se deve criar `infrastructure/persistence/` ou usar stubs
3. **Seguir** convenções de nomenclatura (§ 3):
   - Port: `XxxRepository` em `domain/repository/`
   - Spring Data: `XxxJpaRepository` em `infrastructure/persistence/repository/`
   - Adapter: `XxxRepositoryImpl` em `infrastructure/persistence/adapter/`
   - Entity: `XxxEntity` em `infrastructure/persistence/entity/`
   - Mapper: `XxxEntityMapper` em `infrastructure/persistence/mapper/`

### Para Bounded Contexts

1. **Consultar** `.cursorrules` (seção "CONTRATOS ENTRE BOUNDED CONTEXTS")
2. **Consultar** `DECISIONS.md` ADR-0002 e ADR-0003
3. **Nunca** importar diretamente de outro BC (usar contratos `*-api`)
4. **Seguir** estrutura de pacotes do `CONVENSOES.md` § 1

## Referência Rápida

| Preciso de... | Consultar... |
|---------------|--------------|
| Estrutura de pacotes | `CONVENSOES.md` § 1 |
| Regras de persistência | `CONVENSOES.md` § 2 |
| Nomenclatura | `CONVENSOES.md` § 3 |
| Onde colocar ports | `DECISIONS.md` ADR-0010 |
| Regras do Gateway | `DECISIONS.md` ADR-0011 |
| Serviços fiscais | `DECISIONS.md` ADR-0012 |
| Regras gerais de camadas | `.cursorrules` |
| Por que fazemos assim | `DECISIONS.md` |

## Comportamento Esperado

### ✅ Fazer SEMPRE

- Ler os documentos antes de propor soluções
- Citar ADRs e seções ao justificar decisões
- Propor novas ADRs quando necessário desviar
- Validar código com checklist do `CONVENSOES.md` § 5
- Manter domínio puro (sem Spring/JPA)
- Usar contratos entre BCs

### ❌ Nunca Fazer

- Propor soluções que conflitem com ADRs sem justificativa
- Criar estruturas de pacotes diferentes do padrão
- Importar diretamente de outros BCs (sem contratos)
- Colocar anotações Spring/JPA no domínio
- Criar persistência no API Gateway
- Duplicar regras fiscais fora de `CalculadoraIvaService`

## Prioridade de Documentos

Em caso de dúvida sobre qual documento consultar:

1. **Decisões arquiteturais:** `DECISIONS.md` (o "porquê")
2. **Estrutura e organização:** `CONVENSOES.md` (o "como")
3. **Regras de implementação:** `.cursorrules` (o "checklist")

## Atualização de Documentos

Se você identificar:
- **Conflito entre documentos:** Reportar ao usuário
- **Regra faltante:** Sugerir adição ao documento apropriado
- **Regra obsoleta:** Sugerir atualização com justificativa

---

**Última atualização:** 2026-01-19  
**Versão:** 1.0

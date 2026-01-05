# 📌 Pull Request — Sagnus ERP

## 🧩 Contexto
Explique brevemente:
- Qual problema este PR resolve?
- Qual BC foi afetado (corp, nfe, adm, auth, gateway, contracts)?

---

## 🔧 O que foi alterado
Descreva objetivamente as mudanças:
- [ ] Novo UseCase
- [ ] Nova regra de domínio
- [ ] Refatoração
- [ ] Correção de bug
- [ ] Ajuste de arquitetura
- [ ] Infraestrutura / Persistência
- [ ] Fiscal (NFe / IBS / CBS)

---

## 🏗️ Arquitetura / DDD
Confirme explicitamente:

- [ ] `domain` permanece puro (sem Spring/JPA)
- [ ] Regras de negócio estão apenas no domínio
- [ ] Orquestração está no `application`
- [ ] Infraestrutura implementa ports
- [ ] Controllers/Resolvers não acessam repositories
- [ ] Comunicação entre BCs ocorre via `contracts`

---

## 💰 Fiscal (se aplicável)
- [ ] Cálculos utilizam `com.slifesys.sagnus.nfe.domain.service.CalculadoraIvaService`
- [ ] Escala e arredondamento estão consistentes (`HALF_UP`)
- [ ] Não há cálculo fiscal duplicado em adapters

---

## 🧪 Testes
- [ ] Testes unitários de domínio adicionados/atualizados
- [ ] Testes de UseCase adicionados/atualizados
- [ ] Testes de integração (se necessário)

---

## 🗄️ Banco de dados / Migração
- [ ] Não foi usado SQL vendor-specific fora de `infrastructure`
- [ ] Migrations seguem padrão (snake_case, sem aspas)
- [ ] Impacto em Oracle / Postgres analisado

---

## ⚠️ Impacto / Migração
Existe impacto para:
- [ ] Frontend
- [ ] Outro BC
- [ ] Dados existentes
- [ ] Deploy / Configuração

Descreva passos de migração (se houver):

---

## 📎 Referências técnicas
Classes principais alteradas (package + classe):

- `com.slifesys.sagnus.<bc>.application.usecase.XxxUseCase`
- `com.slifesys.sagnus.<bc>.domain.service.YyyService`

---

## ✅ Checklist final (obrigatório)
- [ ] Compilei localmente
- [ ] Revisei vazamentos de camada
- [ ] Segui `.cursorrules` e `AI_PLAYBOOK.md`
- [ ] Commit segue Conventional Commits (`feat:`, `fix:`, etc.)


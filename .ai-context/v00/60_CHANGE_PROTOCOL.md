# Protocolo de Mudança (para humanos e IA)

## Quando UMA MUDANÇA é “arquitetural”
Considere arquitetural quando envolver:
- novo BC ou contracts
- mudança na organização de camadas/pacotes
- regras de dependências entre módulos
- padrões transversais (segurança, erros, gateway, integração)

## Como proceder
1) Verificar se já existe ADR aplicável em `DECISIONS.md`.
2) Se conflitar, propor:
   - nova ADR (`ADR-00XX`) com: decisão, motivo, consequências
   - estratégia de compatibilidade/migração
3) Implementar respeitando `CONVENSOES.md` (estrutura canônica).

## Checklist de aplicação (sempre que houver mudança grande)
- [ ] Compila (`mvn -q -DskipTests=false test` ou pipeline equivalente)
- [ ] Importações respeitam boundaries (sem `domain` do vizinho)
- [ ] Gateway continua sem persistência e sem domínio próprio
- [ ] Contracts continuam mínimos e estáveis
- [ ] Erros seguem `sagnus-shared-api-error`
- [ ] Documentação atualizada (DECISIONS/CONVENSOES/ARCHITECTURE/.cursorrules se aplicável)


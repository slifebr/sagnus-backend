# Guia de Contribuição — SAGNUS ERP

Obrigado por contribuir com o Sagnus ERP!

## Fluxo básico

1. Crie um fork do repositório (se necessário)
2. Crie uma branch a partir de `main`:
   - `feat/nome-da-feature`
   - `fix/descricao-breve`
   - `refactor/algo`
3. Faça commits pequenos e bem descritos
4. Abra um Pull Request para `main` ou `dev`

## Padrão de commits

Exemplos:

- `feat(cadastro): inclusão de endpoint de criação de cliente`
- `fix(nfe): correção no cálculo de total da nota`
- `refactor(security): extração de configuração JWT para módulo compartilhado`

## Estilo de código

- Java 21
- Seguir convenções de código do Java e do Spring
- Usar Lombok apenas onde fizer sentido (entidades, DTOs, services com construtor)

## Testes

- Sempre que possível, adicionar testes
- `mvn clean test` deve passar antes de abrir PR

## Revisão de código

- Pelo menos 1 aprovação antes de merge
- Resolver todos os comentários de review

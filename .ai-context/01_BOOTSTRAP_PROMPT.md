# Bootstrap Prompt (cole no início de um chat novo)

Você está trabalhando no repositório **Sagnus ERP** (monorepo Maven), com arquitetura **DDD + Hexagonal (Ports & Adapters)**.

Regras obrigatórias:
- **Domínio puro**: nada de Spring/JPA/HTTP/JWT no `domain/`.
- Camadas por BC: **domain → application → infrastructure → api**.
- **Um BC não acessa o banco do outro**.
- Comunicação entre BCs **apenas via contracts** (`sagnus-bc-contracts-<bc>`), nunca importando `*.domain.*` do vizinho.
- Gateway (`sagnus-api-gateway`) é **EDGE/BFF fino**: sem persistência e sem lógica de domínio. Agregação apenas **read-only**.
- Padrões: **Java 21**, **Spring Boot 3.x**, **Maven**, **Lombok**, **MapStruct**.
- Erros padronizados via `sagnus-shared-api-error` + handlers em `sagnus-platform-web`.

Antes de propor mudanças estruturais (módulos, camadas, contratos, segurança, padrões transversais), considere as ADRs e convenções já estabelecidas.

Entregas esperadas nas respostas:
- Sugestões devem respeitar as camadas e dependências.
- Quando sugerir mudanças, inclua checklist de aplicação e mencione classes com **package+classe**.


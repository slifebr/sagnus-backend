# Sagnus - Bounded Context de Estoque

Este é o Bounded Context (BC) de Estoque, responsável por todas as funcionalidades relacionadas ao controle de estoque de produtos.

## Arquitetura

O BC de Estoque segue a arquitetura de referência do Sagnus, baseada em Domínios, Casos de Uso e uma separação clara entre as camadas de Aplicação, Domínio e Infraestrutura.

### Pontos Importantes da Arquitetura

*   **Domínio Rico:** O núcleo do BC é o seu modelo de domínio, que encapsula as regras de negócio e a lógica do sistema.
*   **Eventos de Domínio:** A comunicação entre diferentes partes do sistema (e com outros BCs) é feita através de eventos de domínio. Todos os eventos herdam da classe `CorrelatedDomainEvent`, garantindo a rastreabilidade e a idempotência através de um `eventId` e um `correlationId`.
*   **Correlation ID:** Para garantir a rastreabilidade das requisições através dos diferentes serviços, utilizamos um `CorrelationIdFilter` que intercepta todas as chamadas HTTP. Ele extrai o `X-Correlation-ID` do cabeçalho ou gera um novo, tornando-o disponível em todo o fluxo da aplicação.

## Estrutura de Pacotes

A estrutura de pacotes foi organizada da seguinte forma para refletir a arquitetura:

*   `com.slifesys.sagnus.estoque.api`: Controladores REST e filtros.
*   `com.slifesys.sagnus.estoque.application`: Casos de uso e portas para a camada de infraestrutura.
*   `com.slifesys.sagnus.estoque.domain`: Modelos de domínio, eventos e exceções.
*   `com.slifesys.sagnus.estoque.infrastructure`: Implementações das portas da camada de aplicação (ex: repositórios, gateways, etc.).

# Sagnus - Bounded Context Administrativo (`sagnus-bc-adm`)

Este Bounded Context (BC) é o coração administrativo da plataforma Sagnus. Ele é responsável por gerenciar as entidades e processos centrais que dão suporte às operações de outros contextos, garantindo a consistência e a integridade dos dados mestres.

## Propósito e Responsabilidades

O `sagnus-bc-adm` tem como principal responsabilidade a gestão de dados e funcionalidades administrativas essenciais, que são utilizadas por toda a plataforma.

Atualmente, sua principal funcionalidade é o **Módulo de Agenda**, que inclui:

*   **Gestão de Compromissos:** Criação e consulta de compromissos para os colaboradores.
*   **Categorias de Compromisso:** Organização dos compromissos em categorias personalizáveis (ex: Reunião, Foco, Pessoal).
*   **Convites e Notificações:** Gerenciamento de convidados para compromissos e envio de notificações.

## Arquitetura

Este BC segue o padrão de Arquitetura Limpa (Clean Architecture) adotado no Sagnus, com uma separação clara entre as camadas:

*   `api`: Controladores REST, DTOs e Mappers para a interação com o mundo externo.
*   `application`: Casos de uso que orquestram a lógica de negócio.
*   `domain`: Modelos de domínio, regras de negócio e eventos.
*   `infrastructure`: Implementações de persistência, mensageria e outros serviços externos.

Este módulo serve como um exemplo canônico da nossa arquitetura e deve ser usado como referência para a criação de novos Bounded Contexts.

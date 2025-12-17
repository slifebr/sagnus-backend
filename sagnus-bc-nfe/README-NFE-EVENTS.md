# BC NFe — Eventos (v1)

Este pacote introduz o mecanismo mínimo de eventos de domínio.

## Conteúdo
- `DomainEvent` (contrato do evento)
- `AbstractDomainEvent` (base: eventId + occurredAt)
- `NfeEmitidaEvent` (evento chave do fluxo)
- `DomainEventPublisher` (porta na camada Application)
- `SpringDomainEventPublisherAdapter` (adapter mínimo usando Spring events)
- `NfeEmitidaEventListener` (listener de demonstração/log)

## Como integrar no UseCase (padrão)
No `EmitirNfeUseCase`, injete `DomainEventPublisher` e publique após persistir:

```java
publisher.publish(NfeEmitidaEvent.builder()
   .nfeId(nfe.getId().getValue())
   .emitentePessoaId(nfe.getEmitente().getPessoaId())
   .destinatarioPessoaId(nfe.getDestinatario().getPessoaId())
   .status(nfe.getStatus().name())
   .build());
```

## Por que assim?
- Permite evoluir para **Outbox** sem mudar o domínio (apenas trocar o adapter)
- Permite listeners para XML/SEFAZ, auditoria e mensageria

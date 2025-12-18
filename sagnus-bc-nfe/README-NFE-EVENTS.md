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
   .correlationId(CorrelationIdHolder.get())
   .nfeId(nfe.getId().getValue())
   .emitentePessoaId(nfe.getEmitente().getPessoaId())
   .destinatarioPessoaId(nfe.getDestinatario().getPessoaId())
   .status(nfe.getStatus().name())
   .build());
```

## Por que assim?
- Permite evoluir para **Outbox** sem mudar o domínio (apenas trocar o adapter)
- Permite listeners para XML/SEFAZ, auditoria e mensageria

## CorrelationId + Auditoria Persistida
- CorrelationId por request via headers: `X-Correlation-Id` / `X-Request-Id` (fallback UUID)
- Persistência de DomainEvents em `nfe_audit_event` (Flyway V3)
  - property: `sagnus.nfe.audit.enabled=true|false`

## Outbox transacional (v2)

Para ambiente distribuído, o BC NFe já inclui um Outbox real:

- Tabela: `nfe_outbox_event` (Flyway V4)
- Writer: `DomainEventOutboxWriterListener` (grava PENDING na mesma transação)
- Dispatcher: `NfeOutboxDispatcher` + `NfeOutboxService`
  - usa `SKIP LOCKED` para concorrência segura
  - retries com backoff exponencial e marcação `DEAD` após `maxAttempts`
- Transporte default: `LOG` (`LogOutboxTransportAdapter`)

Config (local):
```yaml
sagnus:
  nfe:
    outbox:
      enabled: true
      transport: LOG
      pollIntervalMs: 2000
      batchSize: 50
      maxAttempts: 10
      lockTtlSeconds: 300
      backoffInitialMs: 1000
      backoffMultiplier: 2.0
      backoffMaxMs: 600000
```

## Evento RTC: RtcIbsCbsReconciledEvent

Quando `sagnus.nfe.rtc.validation=LENIENT` e o triplete (base, alíquota, valor) vier todo preenchido mas divergir acima de `valorTolerance`, o normalizador aplica a estratégia configurada (`reconcileStrategy`) e publica o evento:

- `RtcIbsCbsReconciledEvent`
  - `label` (inclui nItem/produtoId)
  - `configuredStrategy` / `resolvedStrategy`
  - valores *before/after* + `diff`/`tolerance`

Listener mínimo:
- `RtcIbsCbsReconciledEventListener` (apenas log; futuramente Outbox)

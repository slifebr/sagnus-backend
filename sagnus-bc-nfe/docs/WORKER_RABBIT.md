# Worker Rabbit (Outbox Consumer)

Este módulo implementa o padrão **Outbox + fila de trabalho (RabbitMQ)**.

Quando `sagnus.nfe.worker.enabled=true`:

- O evento de domínio **NfeEmitidaEvent** não gera XML “in-process”.
- O evento é persistido na tabela **nfe_outbox_event**.
- O dispatcher do outbox publica um **envelope JSON** na fila Rabbit.
- O **worker** consome, aplica **idempotência** e executa um **handler** por `eventType`.

## Como ligar (local)

No `application-local.yml`:

```yml
sagnus:
  nfe:
    outbox:
      transport: RABBIT
    worker:
      enabled: true
```

## Idempotência (Inbox)

Para evitar processamento duplicado (redelivery/retry), o worker grava o `eventId` em:

- tabela: `nfe_inbox_processed`

## DLQ

Se `sagnus.nfe.outbox.rabbit.dlqEnabled=true` (default em DEV/local), a fila principal é criada com:

- `x-dead-letter-exchange = sagnus.nfe.events.dlx`
- `x-dead-letter-routing-key = nfe.event.dlq`

E o worker, em falha, faz `basicReject(requeue=false)` para enviar a mensagem para a DLQ.

## Handlers pluggáveis

Para adicionar um novo processamento, crie um bean que implemente:

- `com.slifesys.sagnus.nfe.application.port.OutboxEventHandler`

Exemplos:

- `NfeEmitidaOutboxHandler` → gera e armazena XML
- `RtcIbsCbsReconciledOutboxHandler` → auditoria/log

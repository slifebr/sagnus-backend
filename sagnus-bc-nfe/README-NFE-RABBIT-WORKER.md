# NFe – RabbitMQ Worker (fila de trabalho)

Este módulo usa **Outbox transacional** para persistir eventos (`nfe_outbox_event`) e, em seguida,
publicar um **envelope JSON** no RabbitMQ quando `sagnus.nfe.outbox.transport=RABBIT`.

Quando o **Worker Rabbit** está habilitado, ele consome a fila e executa o processamento assíncrono
de eventos (ex.: `NfeEmitidaEvent -> gerar XML e armazenar`).

## Por que Worker + Outbox

- **Outbox** garante atomicidade: se a transação de emissão confirmar, o evento fica garantido no banco.
- **Worker** processa fora da transação de emissão, desacoplando tarefas caras (XML/assinatura/SEFAZ, etc.).
- **Retry/DLQ** fica no Rabbit (fila de retry com TTL + DLQ) e o Outbox continua responsável por retries no publish.

## Ativar (local)

1) Subir o RabbitMQ (exemplo):

```bash
docker run -d --name rabbit \
  -p 5672:5672 -p 15672:15672 \
  rabbitmq:3-management
```

2) Configurar as flags (application-local.yml ou env vars):

```yaml
sagnus:
  nfe:
    outbox:
      transport: RABBIT
    worker:
      enabled: true
```

> Observação: quando `worker.enabled=true`, o listener in-process (`NfeEmitidaToXmlListener`) é desativado
> para evitar processar o XML duas vezes.

## Topologia Rabbit (auto-declare)

Quando `sagnus.nfe.outbox.rabbit.autoDeclare=true`, o módulo declara:

- Exchange: `sagnus.nfe.events` (direct por default)
- Fila principal: `sagnus.nfe.events.q` (routingKey `nfe.event`)
- Fila retry: `sagnus.nfe.events.retry.q` (routingKey `nfe.event.retry`)
  - TTL (`retryTtlMs`) e dead-letter de volta para `nfe.event`
- Fila DLQ: `sagnus.nfe.events.dlq` (routingKey `nfe.event.dlq`)

## Retry / DLQ

- Em erro, o worker faz `NACK requeue=false`.
- A fila principal tem DLX configurado para enviar à fila de retry.
- A fila de retry aplica TTL e devolve para a fila principal.
- O worker lê o header `x-death` para contar tentativas e, ao exceder `maxDeliveries`, publica o envelope na DLQ e faz ACK.

## Idempotência (Inbox)

O worker marca `eventId` em `nfe_inbox_processed`. Se o mesmo evento chegar novamente (redelivery),
ele faz ACK e ignora (evita duplicidade).

Migration: `V3__create_nfe_inbox_processed.sql`.

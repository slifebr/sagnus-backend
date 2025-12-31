-- Outbox transacional de DomainEvents do BC NFe
--
-- Padrão:
-- - DomainEventOutboxWriterListener grava PENDING dentro da mesma transação
-- - NfeOutboxDispatcher busca PENDING, faz lock SKIP LOCKED, envia, marca SENT/DEAD

CREATE TABLE IF NOT EXISTS nfe_outbox_event (
    id              BIGSERIAL PRIMARY KEY,
    event_id         VARCHAR(64)  NOT NULL,
    event_type       VARCHAR(128) NOT NULL,
    occurred_at      TIMESTAMPTZ  NOT NULL,
    correlation_id   VARCHAR(128) NULL,
    payload_json     TEXT         NULL,

    status           VARCHAR(16)  NOT NULL DEFAULT 'PENDING',
    attempt_count    INTEGER      NOT NULL DEFAULT 0,
    next_attempt_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),

    locked_at        TIMESTAMPTZ  NULL,
    locked_by        VARCHAR(128) NULL,
    last_error       TEXT         NULL,
    processed_at     TIMESTAMPTZ  NULL,

    created_at       TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at       TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE UNIQUE INDEX IF NOT EXISTS ux_nfe_outbox_event_event_id ON nfe_outbox_event(event_id);
CREATE INDEX IF NOT EXISTS ix_nfe_outbox_event_status_due ON nfe_outbox_event(status, next_attempt_at, occurred_at);
CREATE INDEX IF NOT EXISTS ix_nfe_outbox_event_corr ON nfe_outbox_event(correlation_id);

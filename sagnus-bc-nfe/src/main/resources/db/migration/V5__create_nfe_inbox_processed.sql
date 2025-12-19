CREATE TABLE IF NOT EXISTS nfe_inbox_processed (
    event_id       VARCHAR(64) PRIMARY KEY,
    event_type     VARCHAR(120) NOT NULL,
    correlation_id VARCHAR(120),
    processed_at   TIMESTAMPTZ NOT NULL
);

CREATE INDEX IF NOT EXISTS ix_nfe_inbox_processed_at
    ON nfe_inbox_processed (processed_at DESC);

CREATE TABLE IF NOT EXISTS nfe_inbox_processed (
    id BIGSERIAL PRIMARY KEY,
    event_id VARCHAR(64) NOT NULL,
    event_type VARCHAR(120) NOT NULL,
    correlation_id VARCHAR(120),
    processed_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    CONSTRAINT uk_nfe_inbox_event_id UNIQUE (event_id)
);

CREATE INDEX IF NOT EXISTS ix_nfe_inbox_processed_event_type ON nfe_inbox_processed (event_type);
CREATE INDEX IF NOT EXISTS ix_nfe_inbox_processed_processed_at ON nfe_inbox_processed (processed_at);

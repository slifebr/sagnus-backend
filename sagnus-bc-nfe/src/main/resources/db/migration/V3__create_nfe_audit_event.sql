-- Auditoria mínima de DomainEvents do BC NFe

CREATE TABLE IF NOT EXISTS nfe_audit_event (
    id              BIGSERIAL PRIMARY KEY,
    event_id         VARCHAR(64)  NOT NULL,
    event_type       VARCHAR(128) NOT NULL,
    occurred_at      TIMESTAMPTZ  NOT NULL,
    correlation_id   VARCHAR(128) NULL,
    payload_json     TEXT         NULL
);

CREATE INDEX IF NOT EXISTS ix_nfe_audit_event_event_id ON nfe_audit_event(event_id);
CREATE INDEX IF NOT EXISTS ix_nfe_audit_event_occ ON nfe_audit_event(occurred_at);
CREATE INDEX IF NOT EXISTS ix_nfe_audit_event_corr ON nfe_audit_event(correlation_id);

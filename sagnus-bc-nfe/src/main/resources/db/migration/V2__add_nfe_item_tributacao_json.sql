-- Patch MVP: persistência de tributos (RTC IBS/CBS) via JSON no item
-- Banco alvo: PostgreSQL
--
-- Observação:
-- Se você já usa Flyway/Liquibase em outro repositório, migre este conteúdo para a sua convenção.

ALTER TABLE nfe_item
    ADD COLUMN IF NOT EXISTS tributacao_json JSONB;  -- text

-- Opcional (PostgreSQL): você pode preferir JSONB
-- ALTER TABLE nfe_item
--     ADD COLUMN IF NOT EXISTS tributacao_json JSONB;

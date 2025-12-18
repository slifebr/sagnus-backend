-- BC NFe - adicionar coluna para tributos (IBS/CBS) em JSON (v2)
-- Estratégia: JSON em TEXT para evoluir o RTC sem churn de schema.
-- Obs.: caso a coluna já exista, o IF NOT EXISTS evita erro.

ALTER TABLE nfe_item
    ADD COLUMN IF NOT EXISTS tributacao_json TEXT;

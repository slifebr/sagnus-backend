-- BC NFe - Persistência mínima (v1)
-- Tabelas: nfe_nfe, nfe_item
-- Observação: nomes genéricos para rodar agora; podemos alinhar depois com padrão definitivo do Sagnus.

CREATE TABLE IF NOT EXISTS nfe_nfe (
    id                   VARCHAR(36)  PRIMARY KEY,
    emitente_pessoa_id    BIGINT       NOT NULL,
    emitente_nome         VARCHAR(200) NOT NULL,
    emitente_documento    VARCHAR(14)  NOT NULL,
    destinatario_pessoa_id BIGINT      NOT NULL,
    destinatario_nome     VARCHAR(200) NOT NULL,
    destinatario_documento VARCHAR(14) NOT NULL,
    status               VARCHAR(30)   NOT NULL,
    created_at           TIMESTAMP     NOT NULL,
    updated_at           TIMESTAMP     NOT NULL
);

CREATE TABLE IF NOT EXISTS nfe_item (
    id            BIGSERIAL   PRIMARY KEY,
    nfe_id        VARCHAR(36) NOT NULL REFERENCES nfe_nfe(id) ON DELETE CASCADE,
    n_item        INTEGER     NOT NULL,
    produto_id    BIGINT      NOT NULL,
    descricao     VARCHAR(400) NOT NULL,
    ncm           VARCHAR(8)  NOT NULL,
    cfop          VARCHAR(4)  NOT NULL,
    ucom          VARCHAR(10) NOT NULL,
    quantidade    NUMERIC(18,6) NOT NULL,
    valor_unitario NUMERIC(18,6) NOT NULL,
    desconto      NUMERIC(18,6) NOT NULL DEFAULT 0,
    frete         NUMERIC(18,6) NOT NULL DEFAULT 0,
    seguro        NUMERIC(18,6) NOT NULL DEFAULT 0,
    outras        NUMERIC(18,6) NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS ix_nfe_item_nfe_id ON nfe_item(nfe_id);

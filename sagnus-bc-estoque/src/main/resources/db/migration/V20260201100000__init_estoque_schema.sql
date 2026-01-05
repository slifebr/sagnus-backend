-- V20260201100000__init_estoque_schema.sql
-- Tabelas para o Bounded Context de Estoque

-- Tabela principal para locais de estoque
CREATE TABLE sagnus.supr_estq_local (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

-- Tabela para saldo de produtos em cada local
CREATE TABLE sagnus.supr_estq_saldo (
    id_produto BIGINT NOT NULL,
    id_local INT NOT NULL,
    quantidade_atual NUMERIC(15,4) DEFAULT 0,
    quantidade_reservada NUMERIC(15,4) DEFAULT 0,
    custo_medio NUMERIC(15,4) DEFAULT 0,
    valor_total_estoque NUMERIC(15,4) DEFAULT 0,
    data_ultima_movimentacao TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_produto, id_local),
    CONSTRAINT fk_estq_saldo_produto FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id),
    CONSTRAINT fk_estq_saldo_local FOREIGN KEY (id_local) REFERENCES sagnus.supr_estq_local(id)
);

COMMENT ON COLUMN sagnus.supr_estq_saldo.custo_medio IS 'Valor unitário médio ponderado do produto neste local';

-- Tabela para histórico de movimentações de estoque
CREATE TABLE sagnus.supr_estq_movimentacao (
    id BIGSERIAL PRIMARY KEY,
    id_produto BIGINT NOT NULL,
    id_local INT NOT NULL,
    tipo_movimentacao VARCHAR(20) NOT NULL,
    quantidade NUMERIC(15,4) NOT NULL,
    data_hora TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    origem_documento VARCHAR(50),
    motivo_movimentacao VARCHAR(100),
    CONSTRAINT fk_estq_mov_produto FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id),
    CONSTRAINT fk_estq_mov_local FOREIGN KEY (id_local) REFERENCES sagnus.supr_estq_local(id)
);

-- Tabelas para atributos extendidos de produtos
CREATE TABLE sagnus.supr_estq_cor (
    id SERIAL PRIMARY KEY,
    codigo CHARACTER(4),
    nome VARCHAR(50)
);

CREATE TABLE sagnus.supr_estq_marca (
    id SERIAL PRIMARY KEY,
    codigo CHARACTER(4),
    nome VARCHAR(50)
);

CREATE TABLE sagnus.supr_estq_sabor (
    id SERIAL PRIMARY KEY,
    codigo CHARACTER(4),
    nome VARCHAR(50)
);

CREATE TABLE sagnus.supr_estq_tamanho (
    id SERIAL PRIMARY KEY,
    codigo CHARACTER(4),
    nome VARCHAR(50),
    altura NUMERIC(18,6),
    comprimento NUMERIC(18,6),
    largura NUMERIC(18,6)
);

-- Tabela de associação para a grade de produtos
CREATE TABLE sagnus.supr_estq_grade (
    id SERIAL PRIMARY KEY,
    id_estq_marca INT REFERENCES sagnus.supr_estq_marca(id),
    id_estq_sabor INT REFERENCES sagnus.supr_estq_sabor(id),
    id_estq_tamanho INT REFERENCES sagnus.supr_estq_tamanho(id),
    id_estq_cor INT REFERENCES sagnus.supr_estq_cor(id),
    id_produto BIGINT NOT NULL REFERENCES sagnus.corp_produto(id),
    codigo VARCHAR(50),
    quantidade NUMERIC(18,6)
);

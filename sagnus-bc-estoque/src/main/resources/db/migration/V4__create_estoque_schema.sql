-- V4__create_estoque_schema.sql
-- Script consolidado para criar o schema completo do Bounded Context de Estoque

-- Tabela para Almoxarifado
CREATE TABLE sagnus.supr_almoxarifado (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    dt_criacao TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    usu_criacao VARCHAR(30),
    dt_alteracao TIMESTAMP WITH TIME ZONE,
    usu_alteracao VARCHAR(30)
);

-- Tabelas para atributos de produtos
CREATE TABLE sagnus.supr_estq_cor (
    id BIGSERIAL PRIMARY KEY,
    codigo VARCHAR(4),
    nome VARCHAR(50),
    dt_criacao TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    usu_criacao VARCHAR(30),
    dt_alteracao TIMESTAMP WITH TIME ZONE,
    usu_alteracao VARCHAR(30)
);

CREATE TABLE sagnus.supr_estq_marca (
    id BIGSERIAL PRIMARY KEY,
    codigo VARCHAR(4),
    nome VARCHAR(50),
    dt_criacao TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    usu_criacao VARCHAR(30),
    dt_alteracao TIMESTAMP WITH TIME ZONE,
    usu_alteracao VARCHAR(30)
);

CREATE TABLE sagnus.supr_estq_sabor (
    id BIGSERIAL PRIMARY KEY,
    codigo VARCHAR(4),
    nome VARCHAR(50),
    dt_criacao TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    usu_criacao VARCHAR(30),
    dt_alteracao TIMESTAMP WITH TIME ZONE,
    usu_alteracao VARCHAR(30)
);

CREATE TABLE sagnus.supr_estq_tamanho (
    id BIGSERIAL PRIMARY KEY,
    codigo VARCHAR(4),
    nome VARCHAR(50),
    altura NUMERIC(18,6),
    comprimento NUMERIC(18,6),
    largura NUMERIC(18,6),
    dt_criacao TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    usu_criacao VARCHAR(30),
    dt_alteracao TIMESTAMP WITH TIME ZONE,
    usu_alteracao VARCHAR(30)
);

-- Tabela de associação para a Grade de produtos
CREATE TABLE sagnus.supr_estq_grade (
    id BIGSERIAL PRIMARY KEY,
    id_estq_marca BIGINT,
    id_estq_sabor BIGINT,
    id_estq_tamanho BIGINT,
    id_estq_cor BIGINT,
    id_produto BIGINT NOT NULL,
    codigo VARCHAR(50),
    quantidade NUMERIC(18,6),
    dt_criacao TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    usu_criacao VARCHAR(30),
    dt_alteracao TIMESTAMP WITH TIME ZONE,
    usu_alteracao VARCHAR(30),
    FOREIGN KEY (id_estq_marca) REFERENCES sagnus.supr_estq_marca(id),
    FOREIGN KEY (id_estq_sabor) REFERENCES sagnus.supr_estq_sabor(id),
    FOREIGN KEY (id_estq_tamanho) REFERENCES sagnus.supr_estq_tamanho(id),
    FOREIGN KEY (id_estq_cor) REFERENCES sagnus.supr_estq_cor(id)
);

-- Tabela para Estoque Local (saldo)
CREATE TABLE sagnus.supr_estq_local (
    id BIGSERIAL PRIMARY KEY,
    id_almoxarifado BIGINT NOT NULL,
    id_grade BIGINT NOT NULL,
    quantidade NUMERIC(15,4) DEFAULT 0,
    estq_max NUMERIC(15,4),
    estq_min NUMERIC(15,4),
    dt_criacao TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    usu_criacao VARCHAR(30),
    dt_alteracao TIMESTAMP WITH TIME ZONE,
    usu_alteracao VARCHAR(30),
    FOREIGN KEY (id_almoxarifado) REFERENCES sagnus.supr_almoxarifado(id),
    FOREIGN KEY (id_grade) REFERENCES sagnus.supr_estq_grade(id)
);

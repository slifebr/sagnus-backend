CREATE SCHEMA IF NOT EXISTS sagnus;

-- ======================
-- ADM: Módulos
-- ======================
CREATE TABLE IF NOT EXISTS sagnus.adm_modulo (
    id bigserial PRIMARY KEY,
    codigo char(3),
    nome varchar(100),
    descricao text,
    criado_em timestamp with time zone NOT NULL DEFAULT now(),
    usu_criacao varchar(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao varchar(30)
);

-- ======================
-- ADM: Parâmetros (configuração)
-- ======================
CREATE TABLE IF NOT EXISTS sagnus.adm_parametro (
    id bigserial PRIMARY KEY,
    fin_parcela_aberto bigint,
    fin_parcela_quitado bigint,
    fin_parcela_quitado_parcial bigint,
    fin_tipo_recebimento_edi bigint,
    compra_fin_doc_origem bigint,
    compra_conta_caixa bigint,
    criado_em timestamp with time zone NOT NULL DEFAULT now(),
    usu_criacao varchar(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao varchar(30)
);

-- ======================
-- ADM: Agenda - Categoria de compromisso
-- ======================
CREATE TABLE IF NOT EXISTS sagnus.adm_agen_cat_compromisso (
    id bigserial PRIMARY KEY,
    nome varchar(100),
    cor varchar(50),
    criado_em timestamp with time zone NOT NULL DEFAULT now(),
    usu_criacao varchar(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao varchar(30)
);

-- ======================
-- ADM: Agenda - Compromisso
-- ======================
CREATE TABLE IF NOT EXISTS sagnus.adm_agen_compromisso (
    id bigserial PRIMARY KEY,
    id_categoria bigint NOT NULL,
    id_colaborador bigint NOT NULL,
    data_compromisso date,
    hora varchar(8),
    duracao bigint,
    onde varchar(100),
    descricao varchar(100),
    tipo char(1),
    criado_em timestamp with time zone NOT NULL DEFAULT now(),
    usu_criacao varchar(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao varchar(30),
    CONSTRAINT adm_agen_compromisso_fk01 FOREIGN KEY (id_categoria)
        REFERENCES sagnus.adm_agen_cat_compromisso(id)
);

-- ======================
-- ADM: Agenda - Convidados do compromisso
-- ======================
CREATE TABLE IF NOT EXISTS sagnus.adm_agen_comp_conv (
    id bigserial PRIMARY KEY,
    id_compromisso bigint NOT NULL,
    id_colaborador bigint NOT NULL,
    criado_em timestamp with time zone NOT NULL DEFAULT now(),
    usu_criacao varchar(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao varchar(30),
    CONSTRAINT adm_agen_comp_conv_fk01 FOREIGN KEY (id_compromisso)
        REFERENCES sagnus.adm_agen_compromisso(id)
);

-- ======================
-- ADM: Agenda - Notificações
-- ======================
CREATE TABLE IF NOT EXISTS sagnus.adm_agen_notificacao (
    id bigserial PRIMARY KEY,
    id_compromisso bigint NOT NULL,
    data_notificacao date,
    hora varchar(8),
    tipo bigint NOT NULL,
    criado_em timestamp with time zone NOT NULL DEFAULT now(),
    usu_criacao varchar(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao varchar(30),
    CONSTRAINT adm_agen_notificacao_fk01 FOREIGN KEY (id_compromisso)
        REFERENCES sagnus.adm_agen_compromisso(id)
);

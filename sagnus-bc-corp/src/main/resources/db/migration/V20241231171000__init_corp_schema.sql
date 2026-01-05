CREATE SCHEMA IF NOT EXISTS sagnus;
-- Pessoa
CREATE TABLE sagnus.corp_pessoa (
    id bigserial PRIMARY KEY,
    tipo varchar(1) NOT NULL,
    documento varchar(14) NOT NULL,
    nome varchar(200) NOT NULL,
    email varchar(200),
    site varchar(200),
    ativa boolean NOT NULL,
    criada_em timestamp NOT NULL,
    atualizada_em timestamp NOT NULL
);
CREATE TABLE sagnus.corp_pessoa_endereco (
    id bigserial PRIMARY KEY,
    pessoa_id bigint NOT NULL,
    logradouro varchar(200),
    numero varchar(30),
    complemento varchar(100),
    bairro varchar(100),
    cidade varchar(100),
    uf varchar(2),
    cep varchar(20),
    pais varchar(60),
    CONSTRAINT fk_pessoa_endereco FOREIGN KEY (pessoa_id) REFERENCES sagnus.corp_pessoa (id)
);
-- Marca
CREATE TABLE sagnus.corp_produto_marca (
    id bigserial PRIMARY KEY,
    nome varchar(255),
    descricao varchar(255),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
-- Tabela Preco
CREATE TABLE sagnus.corp_tabela_preco (
    id bigserial PRIMARY KEY,
    nome varchar(255),
    principal varchar(1),
    dt_inicio date,
    dt_fim date,
    coeficiente numeric(19, 2),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
-- Unidade (sigla, descricao, pode_fracionar)
CREATE TABLE sagnus.corp_produto_unidade (
    id bigserial PRIMARY KEY,
    sigla varchar(255),
    descricao varchar(255),
    pode_fracionar varchar(1),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
-- Vendedor
CREATE TABLE sagnus.corp_vendedor (
    id bigserial PRIMARY KEY,
    id_colaborador bigint NOT NULL,
    id_comissao_perfil bigint,
    comissao numeric(19, 2),
    meta_venda numeric(19, 2),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
-- Promocao
CREATE TABLE sagnus.corp_produto_promocao (
    id bigserial PRIMARY KEY,
    id_produto bigint NOT NULL,
    data_inicio date,
    data_fim date,
    valor numeric(19, 2),
    quantidade_em_promocao numeric(19, 2),
    quantidade_maxima_cliente numeric(19, 2),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
-- Setor
CREATE TABLE sagnus.corp_setor (
    id bigserial PRIMARY KEY,
    nome varchar(255),
    descricao varchar(255),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
-- Sindicato
CREATE TABLE sagnus.corp_sindicato (
    id bigserial PRIMARY KEY,
    nome varchar(255),
    codigo_banco bigint,
    codigo_agencia bigint,
    conta_banco varchar(255),
    codigo_cedente varchar(255),
    logradouro varchar(255),
    numero varchar(255),
    bairro varchar(255),
    municipio_ibge bigint,
    uf varchar(255),
    fone1 varchar(255),
    fone2 varchar(255),
    email varchar(255),
    tipo_sindicato varchar(1),
    data_base date,
    piso_salarial numeric(19, 2),
    cnpj varchar(255),
    classificacao_contabil_conta varchar(255),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
-- Subgrupo
CREATE TABLE sagnus.corp_produto_subgrupo (
    id bigserial PRIMARY KEY,
    id_produto_grupo bigint NOT NULL,
    nome varchar(255),
    descricao varchar(255),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
-- Tipo Admissao
CREATE TABLE sagnus.corp_tipo_admissao (
    id bigserial PRIMARY KEY,
    codigo varchar(255),
    nome varchar(255),
    descricao varchar(255),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
-- Tipo Relacionamento
CREATE TABLE sagnus.corp_tipo_relacionamento (
    id bigserial PRIMARY KEY,
    codigo varchar(255),
    nome varchar(255),
    descricao varchar(255),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
-- Transportadora
CREATE TABLE sagnus.corp_transportadora (
    id bigserial PRIMARY KEY,
    id_pessoa bigint NOT NULL,
    data_cadastro date,
    observacao varchar(255),
    placa_veiculo varchar(255),
    rntc varchar(255),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
-- UF
CREATE TABLE sagnus.corp_uf (
    id bigserial PRIMARY KEY,
    sigla varchar(255),
    nome varchar(255),
    codigo_ibge bigint,
    icms_interno numeric(19, 2),
    icms_interestadual numeric(19, 2),
    dt_criacao timestamp NOT NULL,
    usu_criacao varchar(255),
    dt_alteracao timestamp,
    usu_alteracao varchar(255)
);
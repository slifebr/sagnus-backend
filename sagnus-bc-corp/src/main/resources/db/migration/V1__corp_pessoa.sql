-- V1__corp_pessoa.sql
-- Recorte inicial do CORP (Pessoa + dependentes diretas)

CREATE SCHEMA IF NOT EXISTS sagnus;

CREATE SEQUENCE IF NOT EXISTS sagnus.seq_corp_pessoa START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sagnus.seq_corp_pessoa_endereco START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sagnus.seq_corp_pessoa_telefone START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sagnus.seq_corp_pessoa_contato START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE TABLE IF NOT EXISTS sagnus.corp_pessoa (
  "ID" numeric(11,0) DEFAULT nextval('sagnus.seq_corp_pessoa'::regclass) NOT NULL,
  "NOME" varchar(150),
  "TIPO" char(1),
  "SITE" varchar(250),
  "EMAIL" varchar(250),
  "EH_CLIENTE" char(1),
  "EH_FORNECEDOR" char(1),
  "EH_TRANSPORTADORA" char(1),
  "EH_COLABORADOR" char(1),
  "EH_CONTADOR" char(1),
  "DT_CRIACAO" timestamptz DEFAULT now() NOT NULL,
  "USU_CRIACAO" varchar(30),
  "DT_ALTERACAO" timestamptz,
  "USU_ALTERACAO" varchar(30),
  CONSTRAINT "PK_CORP_PESSOA" PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS sagnus.corp_pessoa_endereco (
  "ID" numeric(11,0) DEFAULT nextval('sagnus.seq_corp_pessoa_endereco'::regclass) NOT NULL,
  "ID_PESSOA" numeric(11,0) NOT NULL,
  "LOGRADOURO" varchar(100),
  "NUMERO" varchar(30),
  "BAIRRO" varchar(100),
  "MUNICIPIO_IBGE" numeric(11,0),
  "UF" char(2),
  "CEP" varchar(10),
  "CIDADE" varchar(100),
  "COMPLEMENTO" varchar(250),
  "PRINCIPAL" char(1),
  "ENTREGA" char(1),
  "COBRANCA" char(1),
  "CORRESPONDENCIA" char(1),
  "DT_CRIACAO" timestamptz DEFAULT now() NOT NULL,
  "USU_CRIACAO" varchar(30),
  "DT_ALTERACAO" timestamptz,
  "USU_ALTERACAO" varchar(30),
  CONSTRAINT "PK_CORP_PESSOA_ENDERECO" PRIMARY KEY ("ID"),
  CONSTRAINT "FK_CORP_PESSOA_ENDERECO_PESSOA" FOREIGN KEY ("ID_PESSOA") REFERENCES sagnus.corp_pessoa("ID")
);

CREATE TABLE IF NOT EXISTS sagnus.corp_pessoa_telefone (
  "ID" numeric(11,0) DEFAULT nextval('sagnus.seq_corp_pessoa_telefone'::regclass) NOT NULL,
  "ID_PESSOA" numeric(11,0) NOT NULL,
  "TIPO" char(1),
  "NUMERO" varchar(15),
  "DT_CRIACAO" timestamptz DEFAULT now() NOT NULL,
  "USU_CRIACAO" varchar(30),
  "DT_ALTERACAO" timestamptz,
  "USU_ALTERACAO" varchar(30),
  CONSTRAINT "PK_CORP_PESSOA_TELEFONE" PRIMARY KEY ("ID"),
  CONSTRAINT "FK_CORP_PESSOA_TELEFONE_PESSOA" FOREIGN KEY ("ID_PESSOA") REFERENCES sagnus.corp_pessoa("ID")
);

CREATE TABLE IF NOT EXISTS sagnus.corp_pessoa_contato (
  "ID" numeric(11,0) DEFAULT nextval('sagnus.seq_corp_pessoa_contato'::regclass) NOT NULL,
  "ID_PESSOA" numeric(11,0) NOT NULL,
  "NOME" varchar(150),
  "EMAIL" varchar(250),
  "OBSERVACAO" varchar(250),
  "DT_CRIACAO" timestamptz DEFAULT now() NOT NULL,
  "USU_CRIACAO" varchar(30),
  "DT_ALTERACAO" timestamptz,
  "USU_ALTERACAO" varchar(30),
  CONSTRAINT "PK_CORP_PESSOA_CONTATO" PRIMARY KEY ("ID"),
  CONSTRAINT "FK_CORP_PESSOA_CONTATO_PESSOA" FOREIGN KEY ("ID_PESSOA") REFERENCES sagnus.corp_pessoa("ID")
);

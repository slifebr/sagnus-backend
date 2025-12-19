--
-- PostgreSQL database dump
--

\restrict bnNB2kaKpV0GCVkIq3e8bpOFCzLJ1QjvEZblKRdYefSoYRTHrfasMSMWtBI8dPo

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2025-12-19 14:07:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16390)
-- Name: sagnus; Type: SCHEMA; Schema: -; Owner: sagnus_app
--

CREATE SCHEMA sagnus;


ALTER SCHEMA sagnus OWNER TO sagnus_app;

--
-- TOC entry 239 (class 1259 OID 16874)
-- Name: seq_adm_agen_cat_comp; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_adm_agen_cat_comp
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_adm_agen_cat_comp OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 240 (class 1259 OID 16875)
-- Name: adm_agen_cat_compromisso; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.adm_agen_cat_compromisso (
    id bigint DEFAULT nextval('sagnus.seq_adm_agen_cat_comp'::regclass) NOT NULL,
    nome character varying(100),
    cor character varying(50),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.adm_agen_cat_compromisso OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16911)
-- Name: seq_adm_agen_comp_conv; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_adm_agen_comp_conv
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_adm_agen_comp_conv OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16912)
-- Name: adm_agen_comp_conv; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.adm_agen_comp_conv (
    id bigint DEFAULT nextval('sagnus.seq_adm_agen_comp_conv'::regclass) NOT NULL,
    id_compromisso bigint NOT NULL,
    id_colaborador bigint NOT NULL,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.adm_agen_comp_conv OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16886)
-- Name: seq_adm_agen_compromisso; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_adm_agen_compromisso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_adm_agen_compromisso OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16887)
-- Name: adm_agen_compromisso; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.adm_agen_compromisso (
    id bigint DEFAULT nextval('sagnus.seq_adm_agen_compromisso'::regclass) NOT NULL,
    id_categoria bigint NOT NULL,
    id_colaborador bigint NOT NULL,
    data_compromisso date,
    hora character varying(8),
    duracao bigint,
    onde character varying(100),
    descricao character varying(100),
    tipo character(1),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.adm_agen_compromisso OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16936)
-- Name: seq_adm_agen_notificacao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_adm_agen_notificacao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_adm_agen_notificacao OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16937)
-- Name: adm_agen_notificacao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.adm_agen_notificacao (
    id bigint DEFAULT nextval('sagnus.seq_adm_agen_notificacao'::regclass) NOT NULL,
    id_compromisso bigint NOT NULL,
    data_notificacao date,
    hora character varying(8),
    tipo bigint,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.adm_agen_notificacao OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16849)
-- Name: seq_adm_modulo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_adm_modulo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_adm_modulo OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16850)
-- Name: adm_modulo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.adm_modulo (
    id bigint DEFAULT nextval('sagnus.seq_adm_modulo'::regclass) NOT NULL,
    codigo character(3),
    nome character varying(100),
    descricao text,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.adm_modulo OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16863)
-- Name: seq_adm_parametro; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_adm_parametro
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_adm_parametro OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16864)
-- Name: adm_parametro; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.adm_parametro (
    id bigint DEFAULT nextval('sagnus.seq_adm_parametro'::regclass) NOT NULL,
    fin_parcela_aberto bigint,
    fin_parcela_quitado bigint,
    fin_parcela_quitado_parcial bigint,
    fin_tipo_recebimento_edi bigint,
    compra_fin_doc_origem bigint,
    compra_conta_caixa bigint,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.adm_parametro OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16482)
-- Name: auth_perfil; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.auth_perfil (
    id bigint NOT NULL,
    nome character varying(100) NOT NULL,
    descricao character varying(300),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.auth_perfil OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16524)
-- Name: auth_perfil_permissao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.auth_perfil_permissao (
    perfil_id bigint NOT NULL,
    permissao_id bigint NOT NULL,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.auth_perfil_permissao OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16511)
-- Name: auth_permissao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.auth_permissao (
    id bigint NOT NULL,
    codigo character varying(100) NOT NULL,
    descricao character varying(300),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.auth_permissao OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16462)
-- Name: auth_usuario; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.auth_usuario (
    id bigint NOT NULL,
    username character varying(80) CONSTRAINT auth_usuario_nome_not_null NOT NULL,
    email character varying(200) NOT NULL,
    senha_hash character varying(200) NOT NULL,
    ativo character varying(20) DEFAULT true NOT NULL,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone NOT NULL,
    usu_alteracao character varying(30),
    token_version bigint,
    pessoa_id bigint,
    role character varying(50)
);


ALTER TABLE sagnus.auth_usuario OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16544)
-- Name: auth_usuario_perfil; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.auth_usuario_perfil (
    usuario_id bigint NOT NULL,
    perfil_id bigint NOT NULL,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.auth_usuario_perfil OWNER TO postgres;

--
-- TOC entry 660 (class 1259 OID 26288)
-- Name: seq_vend_cab; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_cab
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_cab OWNER TO postgres;

--
-- TOC entry 686 (class 1259 OID 26682)
-- Name: com_vend_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_cab (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_cab'::regclass) CONSTRAINT "com_vend_cab_ID_not_null" NOT NULL,
    id_venda_orcamento_cab numeric(10,0) DEFAULT NULL::numeric,
    id_venda_condicoes_pagamento numeric(10,0) CONSTRAINT "com_vend_cab_ID_VENDA_CONDICOES_PAGAMENTO_not_null" NOT NULL,
    id_nota_fiscal_tipo numeric(10,0) CONSTRAINT "com_vend_cab_ID_NOTA_FISCAL_TIPO_not_null" NOT NULL,
    id_cliente numeric(11,0) CONSTRAINT "com_vend_cab_ID_CLIENTE_not_null" NOT NULL,
    id_transportadora numeric(11,0) DEFAULT NULL::numeric,
    id_vendedor numeric(11,0) CONSTRAINT "com_vend_cab_ID_VENDEDOR_not_null" NOT NULL,
    data_venda date,
    data_saida date,
    hora_saida character varying(8) DEFAULT NULL::character varying,
    numero_fatura numeric(10,0) DEFAULT NULL::numeric,
    local_entrega character varying(100) DEFAULT NULL::character varying,
    local_cobranca character varying(100) DEFAULT NULL::character varying,
    valor_subtotal numeric(18,6) DEFAULT NULL::numeric,
    taxa_comissao numeric(18,6) DEFAULT NULL::numeric,
    valor_comissao numeric(18,6) DEFAULT NULL::numeric,
    taxa_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_total numeric(18,6) DEFAULT NULL::numeric,
    tipo_frete character(1) DEFAULT NULL::bpchar,
    forma_pagamento character(1) DEFAULT NULL::bpchar,
    valor_frete numeric(18,6) DEFAULT NULL::numeric,
    valor_seguro numeric(18,6) DEFAULT NULL::numeric,
    observacao text,
    situacao character(1) DEFAULT NULL::bpchar,
    dia_fixo_parcela character(2) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_cab_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_cab OWNER TO postgres;

--
-- TOC entry 661 (class 1259 OID 26289)
-- Name: seq_vend_comissao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_comissao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_comissao OWNER TO postgres;

--
-- TOC entry 687 (class 1259 OID 26715)
-- Name: com_vend_comissao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_comissao (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_comissao'::regclass) CONSTRAINT "com_vend_comissao_ID_not_null" NOT NULL,
    id_venda_cab numeric(10,0) CONSTRAINT "com_vend_comissao_ID_VENDA_cab_not_null" NOT NULL,
    id_vendedor numeric(11,0) CONSTRAINT "com_vend_comissao_ID_VENDEDOR_not_null" NOT NULL,
    valor_venda numeric(18,6) DEFAULT NULL::numeric,
    tipo_contabil character(1) DEFAULT NULL::bpchar,
    valor_comissao numeric(18,6) DEFAULT NULL::numeric,
    situacao character(1) DEFAULT NULL::bpchar,
    data_lancamento date,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_comissao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_comissao OWNER TO postgres;

--
-- TOC entry 642 (class 1259 OID 26270)
-- Name: seq_vend_comissao_objetivo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_comissao_objetivo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_comissao_objetivo OWNER TO postgres;

--
-- TOC entry 668 (class 1259 OID 26296)
-- Name: com_vend_comissao_objetivo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_comissao_objetivo (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_comissao_objetivo'::regclass) CONSTRAINT "com_vend_comissao_objetivo_ID_not_null" NOT NULL,
    id_comissao_perfil numeric(10,0) CONSTRAINT "com_vend_comissao_objetivo_ID_COMISSAO_PERFIL_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "com_vend_comissao_objetivo_ID_PRODUTO_not_null" NOT NULL,
    codigo character(3) DEFAULT NULL::bpchar,
    nome character varying(100) DEFAULT NULL::character varying,
    descricao text,
    forma_pagamento character(1) DEFAULT NULL::bpchar,
    taxa_pagamento numeric(18,6) DEFAULT NULL::numeric,
    valor_pagamento numeric(18,6) DEFAULT NULL::numeric,
    valor_meta numeric(18,6) DEFAULT NULL::numeric,
    quantidade numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_comissao_objetivo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_comissao_objetivo OWNER TO postgres;

--
-- TOC entry 643 (class 1259 OID 26271)
-- Name: seq_vend_comissao_perfil; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_comissao_perfil
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_comissao_perfil OWNER TO postgres;

--
-- TOC entry 669 (class 1259 OID 26316)
-- Name: com_vend_comissao_perfil; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_comissao_perfil (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_comissao_perfil'::regclass) CONSTRAINT "com_vend_comissao_perfil_ID_not_null" NOT NULL,
    codigo character(3) DEFAULT NULL::bpchar,
    nome character varying(100) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_comissao_perfil_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_comissao_perfil OWNER TO postgres;

--
-- TOC entry 662 (class 1259 OID 26290)
-- Name: seq_vend_condicoes_pagamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_condicoes_pagamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_condicoes_pagamento OWNER TO postgres;

--
-- TOC entry 688 (class 1259 OID 26730)
-- Name: com_vend_condicoes_pagamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_condicoes_pagamento (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_condicoes_pagamento'::regclass) CONSTRAINT "com_vend_condicoes_pagamento_ID_not_null" NOT NULL,
    nome character varying(50) DEFAULT NULL::character varying,
    descricao text,
    faturamento_minimo numeric(18,6) DEFAULT NULL::numeric,
    faturamento_maximo numeric(18,6) DEFAULT NULL::numeric,
    indice_correcao numeric(18,6) DEFAULT NULL::numeric,
    dias_tolerancia numeric(10,0) DEFAULT NULL::numeric,
    valor_tolerancia numeric(18,6) DEFAULT NULL::numeric,
    prazo_medio numeric(10,0) DEFAULT NULL::numeric,
    vista_prazo character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_condicoes_pagamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_condicoes_pagamento OWNER TO postgres;

--
-- TOC entry 663 (class 1259 OID 26291)
-- Name: seq_vend_condicoes_parcelas; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_condicoes_parcelas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_condicoes_parcelas OWNER TO postgres;

--
-- TOC entry 689 (class 1259 OID 26749)
-- Name: com_vend_condicoes_parcelas; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_condicoes_parcelas (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_condicoes_parcelas'::regclass) CONSTRAINT "com_vend_condicoes_parcelas_ID_not_null" NOT NULL,
    id_venda_condicoes_pagamento numeric(10,0) CONSTRAINT "com_vend_condicoes_parcelas_ID_VENDA_CONDICOES_PAGAMEN_not_null" NOT NULL,
    parcela numeric(10,0) DEFAULT NULL::numeric,
    dias numeric(10,0) DEFAULT NULL::numeric,
    taxa numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_condicoes_parcelas_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_condicoes_parcelas OWNER TO postgres;

--
-- TOC entry 664 (class 1259 OID 26292)
-- Name: seq_vend_det; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_det
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_det OWNER TO postgres;

--
-- TOC entry 690 (class 1259 OID 26762)
-- Name: com_vend_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_det (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_det'::regclass) CONSTRAINT "com_vend_det_ID_not_null" NOT NULL,
    id_venda_cab numeric(10,0) CONSTRAINT "com_vend_det_ID_VENDA_cab_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "com_vend_det_ID_PRODUTO_not_null" NOT NULL,
    quantidade numeric(18,6) DEFAULT NULL::numeric,
    valor_unitario numeric(18,6) DEFAULT NULL::numeric,
    valor_subtotal numeric(18,6) DEFAULT NULL::numeric,
    taxa_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_total numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_det_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_det OWNER TO postgres;

--
-- TOC entry 665 (class 1259 OID 26293)
-- Name: seq_vend_frete; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_frete
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_frete OWNER TO postgres;

--
-- TOC entry 691 (class 1259 OID 26779)
-- Name: com_vend_frete; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_frete (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_frete'::regclass) CONSTRAINT "com_vend_frete_ID_not_null" NOT NULL,
    id_venda_cab numeric(10,0) CONSTRAINT "com_vend_frete_ID_VENDA_cab_not_null" NOT NULL,
    id_transportadora numeric(11,0) CONSTRAINT "com_vend_frete_ID_TRANSPORTADORA_not_null" NOT NULL,
    conhecimento numeric(10,0) DEFAULT NULL::numeric,
    responsavel character(1) DEFAULT NULL::bpchar,
    placa character varying(7) DEFAULT NULL::character varying,
    uf_placa character(2) DEFAULT NULL::bpchar,
    selo_fiscal numeric(11,0) DEFAULT NULL::numeric,
    quantidade_volume numeric(18,6) DEFAULT NULL::numeric,
    marca_volume character varying(50) DEFAULT NULL::character varying,
    especie_volume character varying(20) DEFAULT NULL::character varying,
    peso_bruto numeric(18,6) DEFAULT NULL::numeric,
    peso_liquido numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_frete_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_frete OWNER TO postgres;

--
-- TOC entry 644 (class 1259 OID 26272)
-- Name: seq_vend_integracao_pdv; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_integracao_pdv
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_integracao_pdv OWNER TO postgres;

--
-- TOC entry 670 (class 1259 OID 26327)
-- Name: com_vend_integracao_pdv; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_integracao_pdv (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_integracao_pdv'::regclass) CONSTRAINT "com_vend_integracao_pdv_ID_not_null" NOT NULL,
    identifica character varying(50) DEFAULT NULL::character varying,
    data_integracao date,
    hora_integracao character varying(8) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_integracao_pdv_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_integracao_pdv OWNER TO postgres;

--
-- TOC entry 666 (class 1259 OID 26294)
-- Name: seq_vend_orcamento_cab; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_orcamento_cab
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_orcamento_cab OWNER TO postgres;

--
-- TOC entry 692 (class 1259 OID 26800)
-- Name: com_vend_orcamento_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_orcamento_cab (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_orcamento_cab'::regclass) CONSTRAINT "com_vend_orcamento_cab_ID_not_null" NOT NULL,
    id_venda_condicoes_pagamento numeric(10,0) CONSTRAINT "com_vend_orcamento_cab_ID_VENDA_CONDICOES_PAGAMENTO_not_null" NOT NULL,
    id_vendedor numeric(11,0) CONSTRAINT "com_vend_orcamento_cab_ID_VENDEDOR_not_null" NOT NULL,
    id_cliente numeric(11,0) CONSTRAINT "com_vend_orcamento_cab_ID_CLIENTE_not_null" NOT NULL,
    id_transportadora numeric(11,0) DEFAULT NULL::numeric,
    codigo character varying(20) DEFAULT NULL::character varying,
    data_cadastro date,
    data_entrega date,
    validade date,
    tipo_frete character(1) DEFAULT NULL::bpchar,
    valor_subtotal numeric(18,6) DEFAULT NULL::numeric,
    valor_frete numeric(18,6) DEFAULT NULL::numeric,
    taxa_comissao numeric(18,6) DEFAULT NULL::numeric,
    valor_comissao numeric(18,6) DEFAULT NULL::numeric,
    taxa_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_total numeric(18,6) DEFAULT NULL::numeric,
    observacao text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_orcamento_cab_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_orcamento_cab OWNER TO postgres;

--
-- TOC entry 667 (class 1259 OID 26295)
-- Name: seq_vend_orcamento_det; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_orcamento_det
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_orcamento_det OWNER TO postgres;

--
-- TOC entry 693 (class 1259 OID 26824)
-- Name: com_vend_orcamento_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_orcamento_det (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_orcamento_det'::regclass) CONSTRAINT "com_vend_orcamento_det_ID_not_null" NOT NULL,
    id_venda_orcamento_cab numeric(10,0) CONSTRAINT "com_vend_orcamento_det_ID_VENDA_ORCAMENTO_cab_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "com_vend_orcamento_det_ID_PRODUTO_not_null" NOT NULL,
    quantidade numeric(18,6) DEFAULT NULL::numeric,
    valor_unitario numeric(18,6) DEFAULT NULL::numeric,
    valor_subtotal numeric(18,6) DEFAULT NULL::numeric,
    taxa_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_total numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_orcamento_det_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_orcamento_det OWNER TO postgres;

--
-- TOC entry 645 (class 1259 OID 26273)
-- Name: seq_vend_pdv_caixa; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pdv_caixa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pdv_caixa OWNER TO postgres;

--
-- TOC entry 671 (class 1259 OID 26338)
-- Name: com_vend_pdv_caixa; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pdv_caixa (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pdv_caixa'::regclass) CONSTRAINT "com_vend_pdv_caixa_ID_not_null" NOT NULL,
    nome character varying(30) DEFAULT NULL::character varying,
    data_cadastro date,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pdv_caixa_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pdv_caixa OWNER TO postgres;

--
-- TOC entry 646 (class 1259 OID 26274)
-- Name: seq_vend_pdv_configuracao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pdv_configuracao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pdv_configuracao OWNER TO postgres;

--
-- TOC entry 672 (class 1259 OID 26348)
-- Name: com_vend_pdv_configuracao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pdv_configuracao (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pdv_configuracao'::regclass) CONSTRAINT "com_vend_pdv_configuracao_ID_not_null" NOT NULL,
    nome_caixa character varying(30) DEFAULT NULL::character varying,
    id_gerado_caixa numeric(11,0) DEFAULT NULL::numeric,
    id_empresa numeric(11,0) DEFAULT NULL::numeric,
    id_ecf_impressora numeric(11,0) DEFAULT NULL::numeric,
    id_pdv_caixa numeric(11,0) DEFAULT NULL::numeric,
    mensagem_cupom character varying(250) DEFAULT NULL::character varying,
    porta_ecf character(10) DEFAULT NULL::bpchar,
    ip_servidor character varying(15) DEFAULT NULL::character varying,
    ip_sitef character varying(15) DEFAULT NULL::character varying,
    tipo_tef character(2) DEFAULT NULL::bpchar,
    titulo_tela_caixa character varying(100) DEFAULT NULL::character varying,
    caminho_imagens_produtos character varying(250) DEFAULT NULL::character varying,
    caminho_imagens_marketing character varying(250) DEFAULT NULL::character varying,
    cor_janelas_internas character varying(20) DEFAULT NULL::character varying,
    marketing_ativo character(1) DEFAULT NULL::bpchar,
    cfop_ecf numeric(11,0) DEFAULT NULL::numeric,
    timeout_ecf numeric(11,0) DEFAULT NULL::numeric,
    intervalo_ecf numeric(11,0) DEFAULT NULL::numeric,
    descricao_suprimento character varying(20) DEFAULT NULL::character varying,
    descricao_sangria character varying(20) DEFAULT NULL::character varying,
    tef_tipo_gp numeric(11,0) DEFAULT NULL::numeric,
    tef_tempo_espera numeric(11,0) DEFAULT NULL::numeric,
    tef_espera_sts numeric(11,0) DEFAULT NULL::numeric,
    tef_numero_vias numeric(11,0) DEFAULT NULL::numeric,
    decimais_quantidade numeric(11,0) DEFAULT NULL::numeric,
    decimais_valor numeric(11,0) DEFAULT NULL::numeric,
    bits_por_segundo numeric(11,0) DEFAULT NULL::numeric,
    qtde_maxima_cartoes numeric(11,0) DEFAULT NULL::numeric,
    pesquisa_parte character(1) DEFAULT NULL::bpchar,
    configuracao_balanca character varying(100) DEFAULT NULL::character varying,
    parametros_diversos character varying(250) DEFAULT NULL::character varying,
    ultima_exclusao numeric(11,0) DEFAULT NULL::numeric,
    laudo character varying(10) DEFAULT NULL::character varying,
    indice_gerencial character varying(100) DEFAULT NULL::character varying,
    data_atualizacao_estoque date,
    data_sincronizacao date,
    hora_sincronizacao character varying(8) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pdv_configuracao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pdv_configuracao OWNER TO postgres;

--
-- TOC entry 647 (class 1259 OID 26275)
-- Name: seq_vend_pdv_fechamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pdv_fechamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pdv_fechamento OWNER TO postgres;

--
-- TOC entry 673 (class 1259 OID 26394)
-- Name: com_vend_pdv_fechamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pdv_fechamento (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pdv_fechamento'::regclass) CONSTRAINT "com_vend_pdv_fechamento_ID_not_null" NOT NULL,
    nome_caixa character varying(30) DEFAULT NULL::character varying,
    id_gerado_caixa numeric(11,0) DEFAULT NULL::numeric,
    id_empresa numeric(11,0) DEFAULT NULL::numeric,
    id_pdv_movimento numeric(11,0) DEFAULT NULL::numeric,
    tipo_pagamento character varying(20) DEFAULT NULL::character varying,
    valor numeric(18,6) DEFAULT NULL::numeric,
    data_sincronizacao date,
    hora_sincronizacao character varying(8) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pdv_fechamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pdv_fechamento OWNER TO postgres;

--
-- TOC entry 648 (class 1259 OID 26276)
-- Name: seq_vend_pdv_movimento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pdv_movimento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pdv_movimento OWNER TO postgres;

--
-- TOC entry 674 (class 1259 OID 26410)
-- Name: com_vend_pdv_movimento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pdv_movimento (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pdv_movimento'::regclass) CONSTRAINT "com_vend_pdv_movimento_ID_not_null" NOT NULL,
    nome_caixa character varying(30) DEFAULT NULL::character varying,
    id_gerado_caixa numeric(11,0) DEFAULT NULL::numeric,
    id_empresa numeric(11,0) DEFAULT NULL::numeric,
    id_ecf_impressora numeric(11,0) DEFAULT NULL::numeric,
    id_pdv_operador numeric(11,0) DEFAULT NULL::numeric,
    id_pdv_caixa numeric(11,0) DEFAULT NULL::numeric,
    id_gerente_supervisor numeric(11,0) CONSTRAINT "com_vend_pdv_movimento_ID_GERENTE_SUPERVISOR_not_null" NOT NULL,
    data_abertura date,
    hora_abertura character varying(8) DEFAULT NULL::character varying,
    data_fechamento date,
    hora_fechamento character varying(8) DEFAULT NULL::character varying,
    total_suprimento numeric(18,6) DEFAULT NULL::numeric,
    total_sangria numeric(18,6) DEFAULT NULL::numeric,
    total_nao_fiscal numeric(18,6) DEFAULT NULL::numeric,
    total_venda numeric(18,6) DEFAULT NULL::numeric,
    total_desconto numeric(18,6) DEFAULT NULL::numeric,
    total_acrescimo numeric(18,6) DEFAULT NULL::numeric,
    total_final numeric(18,6) DEFAULT NULL::numeric,
    total_recebido numeric(18,6) DEFAULT NULL::numeric,
    total_troco numeric(18,6) DEFAULT NULL::numeric,
    total_cancelado numeric(18,6) DEFAULT NULL::numeric,
    status_movimento character(1) CONSTRAINT "com_vend_pdv_movimento_STATUS_MOVIMENTO_not_null" NOT NULL,
    data_sincronizacao date,
    hora_sincronizacao character varying(8) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pdv_movimento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pdv_movimento OWNER TO postgres;

--
-- TOC entry 649 (class 1259 OID 26277)
-- Name: seq_vend_pdv_sangria; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pdv_sangria
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pdv_sangria OWNER TO postgres;

--
-- TOC entry 675 (class 1259 OID 26440)
-- Name: com_vend_pdv_sangria; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pdv_sangria (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pdv_sangria'::regclass) CONSTRAINT "com_vend_pdv_sangria_ID_not_null" NOT NULL,
    nome_caixa character varying(30) DEFAULT NULL::character varying,
    id_gerado_caixa numeric(11,0) DEFAULT NULL::numeric,
    id_empresa numeric(11,0) DEFAULT NULL::numeric,
    id_pdv_movimento numeric(11,0) DEFAULT NULL::numeric,
    data_sangria date,
    valor numeric(18,6) DEFAULT NULL::numeric,
    data_sincronizacao date,
    hora_sincronizacao character varying(8) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pdv_sangria_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pdv_sangria OWNER TO postgres;

--
-- TOC entry 650 (class 1259 OID 26278)
-- Name: seq_vend_pdv_suprimento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pdv_suprimento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pdv_suprimento OWNER TO postgres;

--
-- TOC entry 676 (class 1259 OID 26455)
-- Name: com_vend_pdv_suprimento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pdv_suprimento (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pdv_suprimento'::regclass) CONSTRAINT "com_vend_pdv_suprimento_ID_not_null" NOT NULL,
    nome_caixa character varying(30) DEFAULT NULL::character varying,
    id_gerado_caixa numeric(11,0) DEFAULT NULL::numeric,
    id_empresa numeric(11,0) DEFAULT NULL::numeric,
    id_pdv_movimento numeric(11,0) DEFAULT NULL::numeric,
    data_suprimento date,
    valor numeric(18,6) DEFAULT NULL::numeric,
    data_sincronizacao date,
    hora_sincronizacao character varying(8) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pdv_suprimento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pdv_suprimento OWNER TO postgres;

--
-- TOC entry 651 (class 1259 OID 26279)
-- Name: seq_vend_pdv_tipo_pagamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pdv_tipo_pagamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pdv_tipo_pagamento OWNER TO postgres;

--
-- TOC entry 677 (class 1259 OID 26470)
-- Name: com_vend_pdv_tipo_pagamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pdv_tipo_pagamento (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pdv_tipo_pagamento'::regclass) CONSTRAINT "com_vend_pdv_tipo_pagamento_ID_not_null" NOT NULL,
    codigo character(3) DEFAULT NULL::bpchar,
    descricao character varying(20) DEFAULT NULL::character varying,
    tef character(1) DEFAULT NULL::bpchar,
    imprime_vinculado character(1) DEFAULT NULL::bpchar,
    permite_troco character(1) DEFAULT NULL::bpchar,
    tef_tipo_gp character(1) DEFAULT NULL::bpchar,
    gera_parcelas character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pdv_tipo_pagamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pdv_tipo_pagamento OWNER TO postgres;

--
-- TOC entry 652 (class 1259 OID 26280)
-- Name: seq_vend_pdv_total_tipo_pagamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pdv_total_tipo_pagamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pdv_total_tipo_pagamento OWNER TO postgres;

--
-- TOC entry 678 (class 1259 OID 26486)
-- Name: com_vend_pdv_total_tipo_pagamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pdv_total_tipo_pagamento (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pdv_total_tipo_pagamento'::regclass) CONSTRAINT "com_vend_pdv_total_tipo_pagamento_ID_not_null" NOT NULL,
    nome_caixa character varying(30) DEFAULT NULL::character varying,
    id_gerado_caixa numeric(11,0) DEFAULT NULL::numeric,
    id_empresa numeric(11,0) DEFAULT NULL::numeric,
    id_pdv_venda_cab numeric(11,0) DEFAULT NULL::numeric,
    id_pdv_tipo_pagamento numeric(11,0) DEFAULT NULL::numeric,
    serie_ecf character varying(20) DEFAULT NULL::character varying,
    coo numeric(11,0) DEFAULT NULL::numeric,
    ccf numeric(11,0) DEFAULT NULL::numeric,
    gnf numeric(11,0) DEFAULT NULL::numeric,
    valor numeric(18,6) DEFAULT NULL::numeric,
    nsu character varying(30) DEFAULT NULL::character varying,
    estorno character(1) DEFAULT NULL::bpchar,
    rede character varying(10) DEFAULT NULL::character varying,
    cartao_dc character(1) DEFAULT NULL::bpchar,
    data_venda date,
    hash_registro character varying(32) DEFAULT NULL::character varying,
    data_sincronizacao date,
    hora_sincronizacao character varying(8) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pdv_total_tipo_pagamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pdv_total_tipo_pagamento OWNER TO postgres;

--
-- TOC entry 653 (class 1259 OID 26281)
-- Name: seq_vend_pdv_venda_cab; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pdv_venda_cab
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pdv_venda_cab OWNER TO postgres;

--
-- TOC entry 679 (class 1259 OID 26511)
-- Name: com_vend_pdv_venda_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pdv_venda_cab (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pdv_venda_cab'::regclass) CONSTRAINT "com_vend_pdv_venda_cab_ID_not_null" NOT NULL,
    nome_caixa character varying(30) DEFAULT NULL::character varying,
    id_gerado_caixa numeric(11,0) DEFAULT NULL::numeric,
    id_empresa numeric(11,0) DEFAULT NULL::numeric,
    id_cliente numeric(11,0) DEFAULT NULL::numeric,
    id_pdv_funcionario numeric(11,0) DEFAULT NULL::numeric,
    id_pdv_movimento numeric(11,0) DEFAULT NULL::numeric,
    id_ecf_dav numeric(11,0) DEFAULT NULL::numeric,
    id_ecf_pre_venda_cab numeric(11,0) DEFAULT NULL::numeric,
    serie_ecf character varying(20) DEFAULT NULL::character varying,
    cfop numeric(11,0) DEFAULT NULL::numeric,
    coo numeric(11,0) DEFAULT NULL::numeric,
    ccf numeric(11,0) DEFAULT NULL::numeric,
    data_venda date,
    hora_venda character varying(8) DEFAULT NULL::character varying,
    valor_venda numeric(18,6) DEFAULT NULL::numeric,
    taxa_desconto numeric(18,6) DEFAULT NULL::numeric,
    desconto numeric(18,6) DEFAULT NULL::numeric,
    taxa_acrescimo numeric(18,6) DEFAULT NULL::numeric,
    acrescimo numeric(18,6) DEFAULT NULL::numeric,
    valor_final numeric(18,6) DEFAULT NULL::numeric,
    valor_recebido numeric(18,6) DEFAULT NULL::numeric,
    troco numeric(18,6) DEFAULT NULL::numeric,
    valor_cancelado numeric(18,6) DEFAULT NULL::numeric,
    total_produtos numeric(18,6) DEFAULT NULL::numeric,
    total_documento numeric(18,6) DEFAULT NULL::numeric,
    base_icms numeric(18,6) DEFAULT NULL::numeric,
    icms numeric(18,6) DEFAULT NULL::numeric,
    icms_outras numeric(18,6) DEFAULT NULL::numeric,
    issqn numeric(18,6) DEFAULT NULL::numeric,
    pis numeric(18,6) DEFAULT NULL::numeric,
    cofins numeric(18,6) DEFAULT NULL::numeric,
    acrescimo_itens numeric(18,6) DEFAULT NULL::numeric,
    desconto_itens numeric(18,6) DEFAULT NULL::numeric,
    status_venda character(1) DEFAULT NULL::bpchar,
    nome_cliente character varying(100) DEFAULT NULL::character varying,
    cpf_cnpj_cliente character varying(14) DEFAULT NULL::character varying,
    cupom_cancelado character(1) DEFAULT NULL::bpchar,
    hash_registro character varying(32) DEFAULT NULL::character varying,
    data_sincronizacao date,
    hora_sincronizacao character varying(8) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pdv_venda_cab_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pdv_venda_cab OWNER TO postgres;

--
-- TOC entry 654 (class 1259 OID 26282)
-- Name: seq_vend_pdv_venda_det; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pdv_venda_det
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pdv_venda_det OWNER TO postgres;

--
-- TOC entry 680 (class 1259 OID 26558)
-- Name: com_vend_pdv_venda_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pdv_venda_det (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pdv_venda_det'::regclass) CONSTRAINT "com_vend_pdv_venda_det_ID_not_null" NOT NULL,
    nome_caixa character varying(30) DEFAULT NULL::character varying,
    id_gerado_caixa numeric(11,0) DEFAULT NULL::numeric,
    id_empresa numeric(11,0) DEFAULT NULL::numeric,
    id_produto numeric(11,0) DEFAULT NULL::numeric,
    id_pdv_venda_cab numeric(11,0) DEFAULT NULL::numeric,
    cfop numeric(11,0) DEFAULT NULL::numeric,
    gtin character varying(14) DEFAULT NULL::character varying,
    ccf numeric(11,0) DEFAULT NULL::numeric,
    coo numeric(11,0) DEFAULT NULL::numeric,
    serie_ecf character varying(20) DEFAULT NULL::character varying,
    item numeric(11,0) DEFAULT NULL::numeric,
    quantidade numeric(18,6) DEFAULT NULL::numeric,
    valor_unitario numeric(18,6) DEFAULT NULL::numeric,
    valor_total numeric(18,6) DEFAULT NULL::numeric,
    total_item numeric(18,6) DEFAULT NULL::numeric,
    base_icms numeric(18,6) DEFAULT NULL::numeric,
    taxa_icms numeric(18,6) DEFAULT NULL::numeric,
    icms numeric(18,6) DEFAULT NULL::numeric,
    taxa_desconto numeric(18,6) DEFAULT NULL::numeric,
    desconto numeric(18,6) DEFAULT NULL::numeric,
    taxa_issqn numeric(18,6) DEFAULT NULL::numeric,
    issqn numeric(18,6) DEFAULT NULL::numeric,
    taxa_pis numeric(18,6) DEFAULT NULL::numeric,
    pis numeric(18,6) DEFAULT NULL::numeric,
    taxa_cofins numeric(18,6) DEFAULT NULL::numeric,
    cofins numeric(18,6) DEFAULT NULL::numeric,
    taxa_acrescimo numeric(18,6) DEFAULT NULL::numeric,
    acrescimo numeric(18,6) DEFAULT NULL::numeric,
    acrescimo_rateio numeric(18,6) DEFAULT NULL::numeric,
    desconto_rateio numeric(18,6) DEFAULT NULL::numeric,
    totalizador_parcial character varying(10) DEFAULT NULL::character varying,
    cst character(3) DEFAULT NULL::bpchar,
    cancelado character(1) DEFAULT NULL::bpchar,
    movimenta_estoque character(1) DEFAULT NULL::bpchar,
    ecf_icms_st character varying(4) DEFAULT NULL::character varying,
    hash_registro character varying(32) DEFAULT NULL::character varying,
    data_sincronizacao date,
    hora_sincronizacao character varying(8) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pdv_venda_det_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pdv_venda_det OWNER TO postgres;

--
-- TOC entry 771 (class 1259 OID 28525)
-- Name: com_vend_pedido; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pedido (
    id bigint NOT NULL,
    id_cliente bigint NOT NULL,
    id_tabela_preco integer,
    data_pedido timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) NOT NULL,
    valor_total_bruto numeric(15,2),
    valor_total_desconto numeric(15,2),
    valor_total_liquido numeric(15,2),
    data_faturamento timestamp without time zone,
    numero_nota_fiscal character varying(20),
    serie_nota_fiscal character varying(5)
);


ALTER TABLE sagnus.com_vend_pedido OWNER TO postgres;

--
-- TOC entry 770 (class 1259 OID 28524)
-- Name: com_vend_pedido_id_seq; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.com_vend_pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.com_vend_pedido_id_seq OWNER TO postgres;

--
-- TOC entry 10067 (class 0 OID 0)
-- Dependencies: 770
-- Name: com_vend_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: sagnus; Owner: postgres
--

ALTER SEQUENCE sagnus.com_vend_pedido_id_seq OWNED BY sagnus.com_vend_pedido.id;


--
-- TOC entry 655 (class 1259 OID 26283)
-- Name: seq_vend_pre_venda_cab; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pre_venda_cab
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pre_venda_cab OWNER TO postgres;

--
-- TOC entry 681 (class 1259 OID 26604)
-- Name: com_vend_pre_venda_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pre_venda_cab (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pre_venda_cab'::regclass) CONSTRAINT "com_vend_pre_venda_cab_ID_not_null" NOT NULL,
    id_pessoa numeric(11,0) CONSTRAINT "com_vend_pre_venda_cab_ID_PESSOA_not_null" NOT NULL,
    data_emissao date,
    hora_emissao character varying(8) DEFAULT NULL::character varying,
    situacao character(1) DEFAULT NULL::bpchar,
    ccf numeric(11,0) DEFAULT NULL::numeric,
    valor numeric(18,6) DEFAULT NULL::numeric,
    nome_destinatario character varying(100) DEFAULT NULL::character varying,
    cpf_cnpj_destinatario character varying(14) DEFAULT NULL::character varying,
    subtotal numeric(18,6) DEFAULT NULL::numeric,
    desconto numeric(18,6) DEFAULT NULL::numeric,
    acrescimo numeric(18,6) DEFAULT NULL::numeric,
    taxa_acrescimo numeric(18,6) DEFAULT NULL::numeric,
    taxa_desconto numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pre_venda_cab_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pre_venda_cab OWNER TO postgres;

--
-- TOC entry 656 (class 1259 OID 26284)
-- Name: seq_vend_pre_venda_det; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_pre_venda_det
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_pre_venda_det OWNER TO postgres;

--
-- TOC entry 682 (class 1259 OID 26625)
-- Name: com_vend_pre_venda_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_pre_venda_det (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_pre_venda_det'::regclass) CONSTRAINT "com_vend_pre_venda_det_ID_not_null" NOT NULL,
    id_pre_venda_cab numeric(11,0) CONSTRAINT "com_vend_pre_venda_det_ID_PRE_VENDA_cab_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "com_vend_pre_venda_det_ID_PRODUTO_not_null" NOT NULL,
    item numeric(11,0) DEFAULT NULL::numeric,
    quantidade numeric(18,6) DEFAULT NULL::numeric,
    valor_unitario numeric(18,6) DEFAULT NULL::numeric,
    valor_total numeric(18,6) DEFAULT NULL::numeric,
    cancelado character(1) DEFAULT NULL::bpchar,
    gtin_produto character varying(14) DEFAULT NULL::character varying,
    nome_produto character varying(100) DEFAULT NULL::character varying,
    unidade_produto character varying(10) DEFAULT NULL::character varying,
    ecf_icms_st character varying(4) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_pre_venda_det_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_pre_venda_det OWNER TO postgres;

--
-- TOC entry 657 (class 1259 OID 26285)
-- Name: seq_vend_produto_promocao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_produto_promocao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_produto_promocao OWNER TO postgres;

--
-- TOC entry 683 (class 1259 OID 26645)
-- Name: com_vend_produto_promocao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_produto_promocao (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_vend_produto_promocao'::regclass) CONSTRAINT "com_vend_produto_promocao_ID_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "com_vend_produto_promocao_ID_PRODUTO_not_null" NOT NULL,
    data_inicio date,
    data_fim date,
    quantidade_em_promocao numeric(18,6) DEFAULT NULL::numeric,
    quantidade_maxima_cliente numeric(18,6) DEFAULT NULL::numeric,
    valor numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_produto_promocao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_produto_promocao OWNER TO postgres;

--
-- TOC entry 658 (class 1259 OID 26286)
-- Name: seq_vend_tabela_preco; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_tabela_preco
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_tabela_preco OWNER TO postgres;

--
-- TOC entry 684 (class 1259 OID 26658)
-- Name: com_vend_tabela_preco; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_tabela_preco (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_tabela_preco'::regclass) CONSTRAINT "com_vend_tabela_preco_ID_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    principal character(1) DEFAULT NULL::bpchar,
    coeficiente numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_tabela_preco_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_tabela_preco OWNER TO postgres;

--
-- TOC entry 659 (class 1259 OID 26287)
-- Name: seq_vend_tabela_preco_produto; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_vend_tabela_preco_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_vend_tabela_preco_produto OWNER TO postgres;

--
-- TOC entry 685 (class 1259 OID 26670)
-- Name: com_vend_tabela_preco_produto; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.com_vend_tabela_preco_produto (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_vend_tabela_preco_produto'::regclass) CONSTRAINT "com_vend_tabela_preco_produto_ID_not_null" NOT NULL,
    id_tabela_preco numeric(10,0) CONSTRAINT "com_vend_tabela_preco_produto_ID_TABELA_PRECO_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "com_vend_tabela_preco_produto_ID_PRODUTO_not_null" NOT NULL,
    preco numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_vend_tabela_preco_produto_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.com_vend_tabela_preco_produto OWNER TO postgres;

--
-- TOC entry 457 (class 1259 OID 22796)
-- Name: seq_corp_cargo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_cargo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_cargo OWNER TO postgres;

--
-- TOC entry 501 (class 1259 OID 22841)
-- Name: corp_cargo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_cargo (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_cargo'::regclass) CONSTRAINT "corp_cargo_ID_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    descricao character varying(250) DEFAULT NULL::character varying,
    salario numeric(18,6) DEFAULT NULL::numeric,
    cbo_1994 character varying(10) DEFAULT NULL::character varying,
    cbo_2002 character varying(10) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_cargo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_cargo OWNER TO postgres;

--
-- TOC entry 458 (class 1259 OID 22797)
-- Name: seq_corp_cep; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_cep
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_cep OWNER TO postgres;

--
-- TOC entry 502 (class 1259 OID 22855)
-- Name: corp_cep; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_cep (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_cep'::regclass) CONSTRAINT "corp_cep_ID_not_null" NOT NULL,
    numero character varying(8) DEFAULT NULL::character varying,
    logradouro character varying(100) DEFAULT NULL::character varying,
    complemento character varying(100) DEFAULT NULL::character varying,
    bairro character varying(100) DEFAULT NULL::character varying,
    municipio character varying(100) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    codigo_ibge_municipio numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_cep_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_cep OWNER TO postgres;

--
-- TOC entry 459 (class 1259 OID 22798)
-- Name: seq_corp_cliente; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_cliente
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_cliente OWNER TO postgres;

--
-- TOC entry 503 (class 1259 OID 22871)
-- Name: corp_cliente; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_cliente (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_cliente'::regclass) CONSTRAINT "corp_cliente_ID_not_null" NOT NULL,
    id_pessoa numeric(11,0) CONSTRAINT "corp_cliente_ID_PESSOA_not_null" NOT NULL,
    id_tabela_preco numeric(10,0) DEFAULT NULL::numeric,
    desde date,
    data_cadastro date,
    taxa_desconto numeric(18,6) DEFAULT NULL::numeric,
    limite_credito numeric(18,6) DEFAULT NULL::numeric,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_cliente_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_cliente OWNER TO postgres;

--
-- TOC entry 460 (class 1259 OID 22799)
-- Name: seq_corp_cnae; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_cnae
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_cnae OWNER TO postgres;

--
-- TOC entry 504 (class 1259 OID 22885)
-- Name: corp_cnae; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_cnae (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_cnae'::regclass) CONSTRAINT "corp_cnae_ID_not_null" NOT NULL,
    codigo character varying(7) DEFAULT NULL::character varying,
    denominacao character varying(1000) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_cnae_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_cnae OWNER TO postgres;

--
-- TOC entry 461 (class 1259 OID 22800)
-- Name: seq_corp_colaborador; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_colaborador
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_colaborador OWNER TO postgres;

--
-- TOC entry 505 (class 1259 OID 22898)
-- Name: corp_colaborador; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_colaborador (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_colaborador'::regclass) CONSTRAINT "corp_colaborador_ID_not_null" NOT NULL,
    id_pessoa numeric(11,0) CONSTRAINT "corp_colaborador_ID_PESSOA_not_null" NOT NULL,
    id_cargo numeric(11,0) DEFAULT NULL::numeric,
    id_setor numeric(11,0) DEFAULT NULL::numeric,
    id_colaborador_situacao numeric(11,0) DEFAULT NULL::numeric,
    id_tipo_admissao numeric(11,0) DEFAULT NULL::numeric,
    id_colaborador_tipo numeric(11,0) DEFAULT NULL::numeric,
    id_sindicato numeric(11,0) DEFAULT NULL::numeric,
    matricula character varying(10) DEFAULT NULL::character varying,
    data_cadastro date,
    data_admissao date,
    data_demissao date,
    ctps_numero character varying(10) DEFAULT NULL::character varying,
    ctps_serie character varying(10) DEFAULT NULL::character varying,
    ctps_data_expedicao date,
    ctps_uf character(2) DEFAULT NULL::bpchar,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_colaborador_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_colaborador OWNER TO postgres;

--
-- TOC entry 462 (class 1259 OID 22801)
-- Name: seq_corp_colaborador_relacionamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_colaborador_relacionamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_colaborador_relacionamento OWNER TO postgres;

--
-- TOC entry 506 (class 1259 OID 22919)
-- Name: corp_colaborador_relacionamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_colaborador_relacionamento (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_colaborador_relacionamento'::regclass) CONSTRAINT "corp_colaborador_relacionamento_ID_not_null" NOT NULL,
    id_tipo_relacionamento numeric(11,0) CONSTRAINT "corp_colaborador_relacionamento_ID_TIPO_RELACIONAMENTO_not_null" NOT NULL,
    id_colaborador numeric(11,0) CONSTRAINT "corp_colaborador_relacionamento_ID_COLABORADOR_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    data_nascimento date,
    cpf character varying(11) DEFAULT NULL::character varying,
    registro_matricula character varying(50) DEFAULT NULL::character varying,
    registro_cartorio character varying(50) DEFAULT NULL::character varying,
    registro_cartorio_numero character varying(50) DEFAULT NULL::character varying,
    registro_numero_livro character varying(10) DEFAULT NULL::character varying,
    registro_numero_folha character varying(10) DEFAULT NULL::character varying,
    data_entrega_documento date,
    salario_familia character(1) DEFAULT NULL::bpchar,
    salario_familia_idade_limite numeric(11,0) DEFAULT NULL::numeric,
    salario_familia_data_fim date,
    imposto_renda_idade_limite numeric(11,0) DEFAULT NULL::numeric,
    imposto_renda_data_fim numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_colaborador_relacionamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_colaborador_relacionamento OWNER TO postgres;

--
-- TOC entry 463 (class 1259 OID 22802)
-- Name: seq_corp_colaborador_situacao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_colaborador_situacao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_colaborador_situacao OWNER TO postgres;

--
-- TOC entry 507 (class 1259 OID 22941)
-- Name: corp_colaborador_situacao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_colaborador_situacao (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_colaborador_situacao'::regclass) CONSTRAINT "corp_colaborador_situacao_ID_not_null" NOT NULL,
    codigo character(3) DEFAULT NULL::bpchar,
    nome character varying(100) DEFAULT NULL::character varying,
    descricao text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_colaborador_situacao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_colaborador_situacao OWNER TO postgres;

--
-- TOC entry 464 (class 1259 OID 22803)
-- Name: seq_corp_colaborador_tipo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_colaborador_tipo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_colaborador_tipo OWNER TO postgres;

--
-- TOC entry 508 (class 1259 OID 22954)
-- Name: corp_colaborador_tipo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_colaborador_tipo (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_colaborador_tipo'::regclass) CONSTRAINT "corp_colaborador_tipo_ID_not_null" NOT NULL,
    nome character varying(20) DEFAULT NULL::character varying,
    descricao text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_colaborador_tipo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_colaborador_tipo OWNER TO postgres;

--
-- TOC entry 465 (class 1259 OID 22804)
-- Name: seq_corp_comissao_perfil; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_comissao_perfil
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_comissao_perfil OWNER TO postgres;

--
-- TOC entry 509 (class 1259 OID 22966)
-- Name: corp_comissao_perfil; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_comissao_perfil (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_corp_comissao_perfil'::regclass) CONSTRAINT "corp_comissao_perfil_ID_not_null" NOT NULL,
    codigo character(3) DEFAULT NULL::bpchar,
    nome character varying(100) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_comissao_perfil_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_comissao_perfil OWNER TO postgres;

--
-- TOC entry 466 (class 1259 OID 22805)
-- Name: seq_corp_empresa; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_empresa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_empresa OWNER TO postgres;

--
-- TOC entry 510 (class 1259 OID 22977)
-- Name: corp_empresa; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_empresa (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_empresa'::regclass) CONSTRAINT "corp_empresa_ID_not_null" NOT NULL,
    razao_social character varying(150) DEFAULT NULL::character varying,
    nome_fantasia character varying(150) DEFAULT NULL::character varying,
    cnpj character varying(14) DEFAULT NULL::character varying,
    inscricao_estadual character varying(45) DEFAULT NULL::character varying,
    inscricao_municipal character varying(45) DEFAULT NULL::character varying,
    tipo_regime character(1) DEFAULT NULL::bpchar,
    crt character(1) DEFAULT NULL::bpchar,
    email character varying(250) DEFAULT NULL::character varying,
    site character varying(250) DEFAULT NULL::character varying,
    contato character varying(100) DEFAULT NULL::character varying,
    data_constituicao date,
    tipo character(1) DEFAULT NULL::bpchar,
    inscricao_junta_comercial character varying(30) DEFAULT NULL::character varying,
    data_insc_junta_comercial date,
    codigo_ibge_cidade numeric(11,0) DEFAULT NULL::numeric,
    codigo_ibge_uf numeric(11,0) DEFAULT NULL::numeric,
    cei character varying(12) DEFAULT NULL::character varying,
    codigo_cnae_principal character varying(7) DEFAULT NULL::character varying,
    imagem_logotipo text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_empresa_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_empresa OWNER TO postgres;

--
-- TOC entry 467 (class 1259 OID 22806)
-- Name: seq_corp_empresa_cnae; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_empresa_cnae
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_empresa_cnae OWNER TO postgres;

--
-- TOC entry 511 (class 1259 OID 23004)
-- Name: corp_empresa_cnae; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_empresa_cnae (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_empresa_cnae'::regclass) CONSTRAINT "corp_empresa_cnae_ID_not_null" NOT NULL,
    id_empresa numeric(11,0) CONSTRAINT "corp_empresa_cnae_ID_EMPRESA_not_null" NOT NULL,
    id_cnae numeric(11,0) CONSTRAINT "corp_empresa_cnae_ID_CNAE_not_null" NOT NULL,
    principal character(1) DEFAULT NULL::bpchar,
    ramo_atividade character varying(50) DEFAULT NULL::character varying,
    objeto_social text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_empresa_cnae_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_empresa_cnae OWNER TO postgres;

--
-- TOC entry 468 (class 1259 OID 22807)
-- Name: seq_corp_empresa_contato; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_empresa_contato
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_empresa_contato OWNER TO postgres;

--
-- TOC entry 512 (class 1259 OID 23019)
-- Name: corp_empresa_contato; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_empresa_contato (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_empresa_contato'::regclass) CONSTRAINT "corp_empresa_contato_ID_not_null" NOT NULL,
    id_empresa numeric(11,0) CONSTRAINT "corp_empresa_contato_ID_EMPRESA_not_null" NOT NULL,
    nome character varying(150) DEFAULT NULL::character varying,
    email character varying(250) DEFAULT NULL::character varying,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_empresa_contato_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_empresa_contato OWNER TO postgres;

--
-- TOC entry 469 (class 1259 OID 22808)
-- Name: seq_corp_empresa_endereco; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_empresa_endereco
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_empresa_endereco OWNER TO postgres;

--
-- TOC entry 513 (class 1259 OID 23034)
-- Name: corp_empresa_endereco; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_empresa_endereco (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_empresa_endereco'::regclass) CONSTRAINT "corp_empresa_endereco_ID_not_null" NOT NULL,
    id_empresa numeric(11,0) CONSTRAINT "corp_empresa_endereco_ID_EMPRESA_not_null" NOT NULL,
    logradouro character varying(100) DEFAULT NULL::character varying,
    numero character varying(10) DEFAULT NULL::character varying,
    bairro character varying(100) DEFAULT NULL::character varying,
    cidade character varying(100) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    municipio_ibge numeric(11,0) DEFAULT NULL::numeric,
    complemento character varying(100) DEFAULT NULL::character varying,
    principal character(1) DEFAULT NULL::bpchar,
    entrega character(1) DEFAULT NULL::bpchar,
    cobranca character(1) DEFAULT NULL::bpchar,
    correspondencia character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_empresa_endereco_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_empresa_endereco OWNER TO postgres;

--
-- TOC entry 470 (class 1259 OID 22809)
-- Name: seq_corp_empresa_telefone; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_empresa_telefone
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_empresa_telefone OWNER TO postgres;

--
-- TOC entry 514 (class 1259 OID 23058)
-- Name: corp_empresa_telefone; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_empresa_telefone (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_empresa_telefone'::regclass) CONSTRAINT "corp_empresa_telefone_ID_not_null" NOT NULL,
    id_empresa numeric(11,0) CONSTRAINT "corp_empresa_telefone_ID_EMPRESA_not_null" NOT NULL,
    tipo character(1) DEFAULT NULL::bpchar,
    numero character varying(15) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_empresa_telefone_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_empresa_telefone OWNER TO postgres;

--
-- TOC entry 471 (class 1259 OID 22810)
-- Name: seq_corp_empresa_transporte; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_empresa_transporte
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_empresa_transporte OWNER TO postgres;

--
-- TOC entry 515 (class 1259 OID 23070)
-- Name: corp_empresa_transporte; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_empresa_transporte (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_empresa_transporte'::regclass) CONSTRAINT "corp_empresa_transporte_ID_not_null" NOT NULL,
    uf character(2) DEFAULT NULL::bpchar,
    nome character varying(100) DEFAULT NULL::character varying,
    classificacao_contabil_conta character varying(30) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_empresa_transporte_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_empresa_transporte OWNER TO postgres;

--
-- TOC entry 472 (class 1259 OID 22811)
-- Name: seq_corp_empresa_transporte_itinerario; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_empresa_transporte_itinerario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_empresa_transporte_itinerario OWNER TO postgres;

--
-- TOC entry 516 (class 1259 OID 23082)
-- Name: corp_empresa_transporte_itinerario; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_empresa_transporte_itinerario (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_empresa_transporte_itinerario'::regclass) CONSTRAINT "corp_empresa_transporte_itinerario_ID_not_null" NOT NULL,
    id_empresa_transporte numeric(11,0) CONSTRAINT "corp_empresa_transporte_itinerar_ID_EMPRESA_TRANSPORTE_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    tarifa numeric(18,6) DEFAULT NULL::numeric,
    trajeto text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_empresa_transporte_itinerario_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_empresa_transporte_itinerario OWNER TO postgres;

--
-- TOC entry 473 (class 1259 OID 22812)
-- Name: seq_corp_estado_civil; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_estado_civil
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_estado_civil OWNER TO postgres;

--
-- TOC entry 517 (class 1259 OID 23096)
-- Name: corp_estado_civil; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_estado_civil (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_estado_civil'::regclass) CONSTRAINT "corp_estado_civil_ID_not_null" NOT NULL,
    nome character varying(50) DEFAULT NULL::character varying,
    descricao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_estado_civil_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_estado_civil OWNER TO postgres;

--
-- TOC entry 474 (class 1259 OID 22813)
-- Name: seq_corp_fornecedor; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_fornecedor
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_fornecedor OWNER TO postgres;

--
-- TOC entry 518 (class 1259 OID 23107)
-- Name: corp_fornecedor; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_fornecedor (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_fornecedor'::regclass) CONSTRAINT "corp_fornecedor_ID_not_null" NOT NULL,
    id_pessoa numeric(11,0) CONSTRAINT "corp_fornecedor_ID_PESSOA_not_null" NOT NULL,
    desde date,
    data_cadastro date,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_fornecedor_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_fornecedor OWNER TO postgres;

--
-- TOC entry 638 (class 1259 OID 25722)
-- Name: seq_corp_municipio; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_municipio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_municipio OWNER TO postgres;

--
-- TOC entry 641 (class 1259 OID 25753)
-- Name: corp_municipio; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_municipio (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_municipio'::regclass) CONSTRAINT "corp_municipio_ID_not_null" NOT NULL,
    id_uf numeric(11,0) CONSTRAINT "corp_municipio_ID_UF_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    codigo_ibge numeric(11,0) DEFAULT NULL::numeric,
    codigo_receita_federal numeric(11,0) DEFAULT NULL::numeric,
    codigo_estadual numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_municipio_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_municipio OWNER TO postgres;

--
-- TOC entry 475 (class 1259 OID 22814)
-- Name: seq_corp_ncm; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_ncm
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_ncm OWNER TO postgres;

--
-- TOC entry 519 (class 1259 OID 23118)
-- Name: corp_ncm; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_ncm (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_ncm'::regclass) CONSTRAINT "corp_ncm_ID_not_null" NOT NULL,
    codigo character varying(8) DEFAULT NULL::character varying,
    descricao character varying(1000) DEFAULT NULL::character varying,
    observacao character varying(1000) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_ncm_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_ncm OWNER TO postgres;

--
-- TOC entry 476 (class 1259 OID 22816)
-- Name: seq_corp_pessoa; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_pessoa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_pessoa OWNER TO postgres;

--
-- TOC entry 520 (class 1259 OID 23147)
-- Name: corp_pessoa; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_pessoa (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_pessoa'::regclass) CONSTRAINT "corp_pessoa_ID_not_null" NOT NULL,
    nome character varying(150) DEFAULT NULL::character varying,
    tipo character(1) DEFAULT NULL::bpchar,
    site character varying(250) DEFAULT NULL::character varying,
    email character varying(250) DEFAULT NULL::character varying,
    eh_cliente character(1) DEFAULT NULL::bpchar,
    eh_fornecedor character(1) DEFAULT NULL::bpchar,
    eh_transportadora character(1) DEFAULT NULL::bpchar,
    eh_colaborador character(1) DEFAULT NULL::bpchar,
    eh_contador character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_pessoa_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_pessoa OWNER TO postgres;

--
-- TOC entry 477 (class 1259 OID 22817)
-- Name: seq_corp_pessoa_alteracao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_pessoa_alteracao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_pessoa_alteracao OWNER TO postgres;

--
-- TOC entry 521 (class 1259 OID 23167)
-- Name: corp_pessoa_alteracao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_pessoa_alteracao (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_pessoa_alteracao'::regclass) CONSTRAINT "corp_pessoa_alteracao_ID_not_null" NOT NULL,
    id_pessoa numeric(11,0) CONSTRAINT "corp_pessoa_alteracao_ID_PESSOA_not_null" NOT NULL,
    data_alteracao date,
    objeto_antigo text,
    objeto_novo text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_pessoa_alteracao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_pessoa_alteracao OWNER TO postgres;

--
-- TOC entry 478 (class 1259 OID 22818)
-- Name: seq_corp_pessoa_contato; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_pessoa_contato
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_pessoa_contato OWNER TO postgres;

--
-- TOC entry 522 (class 1259 OID 23179)
-- Name: corp_pessoa_contato; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_pessoa_contato (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_pessoa_contato'::regclass) CONSTRAINT "corp_pessoa_contato_ID_not_null" NOT NULL,
    id_pessoa numeric(11,0) CONSTRAINT "corp_pessoa_contato_ID_PESSOA_not_null" NOT NULL,
    nome character varying(150) DEFAULT NULL::character varying,
    email character varying(250) DEFAULT NULL::character varying,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_pessoa_contato_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_pessoa_contato OWNER TO postgres;

--
-- TOC entry 479 (class 1259 OID 22819)
-- Name: seq_corp_pessoa_endereco; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_pessoa_endereco
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_pessoa_endereco OWNER TO postgres;

--
-- TOC entry 523 (class 1259 OID 23194)
-- Name: corp_pessoa_endereco; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_pessoa_endereco (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_pessoa_endereco'::regclass) CONSTRAINT "corp_pessoa_endereco_ID_not_null" NOT NULL,
    id_pessoa numeric(11,0) CONSTRAINT "corp_pessoa_endereco_ID_PESSOA_not_null" NOT NULL,
    logradouro character varying(100) DEFAULT NULL::character varying,
    numero character varying(10) DEFAULT NULL::character varying,
    bairro character varying(100) DEFAULT NULL::character varying,
    municipio_ibge numeric(11,0) DEFAULT NULL::numeric,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    cidade character varying(100) DEFAULT NULL::character varying,
    complemento character varying(100) DEFAULT NULL::character varying,
    principal character(1) DEFAULT NULL::bpchar,
    entrega character(1) DEFAULT NULL::bpchar,
    cobranca character(1) DEFAULT NULL::bpchar,
    correspondencia character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_pessoa_endereco_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_pessoa_endereco OWNER TO postgres;

--
-- TOC entry 480 (class 1259 OID 22820)
-- Name: seq_corp_pessoa_fisica; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_pessoa_fisica
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_pessoa_fisica OWNER TO postgres;

--
-- TOC entry 524 (class 1259 OID 23218)
-- Name: corp_pessoa_fisica; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_pessoa_fisica (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_pessoa_fisica'::regclass) CONSTRAINT "corp_pessoa_fisica_ID_not_null" NOT NULL,
    id_pessoa numeric(11,0) CONSTRAINT "corp_pessoa_fisica_ID_PESSOA_not_null" NOT NULL,
    id_nivel_formacao numeric(11,0) CONSTRAINT "corp_pessoa_fisica_ID_NIVEL_FORMACAO_not_null" NOT NULL,
    id_estado_civil numeric(11,0) CONSTRAINT "corp_pessoa_fisica_ID_ESTADO_CIVIL_not_null" NOT NULL,
    cpf character varying(11) DEFAULT NULL::character varying,
    rg character varying(20) DEFAULT NULL::character varying,
    orgao_rg character varying(20) DEFAULT NULL::character varying,
    data_emissao_rg date,
    data_nascimento date,
    sexo character(1) DEFAULT NULL::bpchar,
    raca character(1) DEFAULT NULL::bpchar,
    nacionalidade character varying(100) DEFAULT NULL::character varying,
    naturalidade character varying(100) DEFAULT NULL::character varying,
    nome_pai character varying(200) DEFAULT NULL::character varying,
    nome_mae character varying(200) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_pessoa_fisica_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_pessoa_fisica OWNER TO postgres;

--
-- TOC entry 481 (class 1259 OID 22821)
-- Name: seq_corp_pessoa_juridica; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_pessoa_juridica
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_pessoa_juridica OWNER TO postgres;

--
-- TOC entry 525 (class 1259 OID 23241)
-- Name: corp_pessoa_juridica; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_pessoa_juridica (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_pessoa_juridica'::regclass) CONSTRAINT "corp_pessoa_juridica_ID_not_null" NOT NULL,
    id_pessoa numeric(11,0) CONSTRAINT "corp_pessoa_juridica_ID_PESSOA_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    nome_fantasia character varying(100) DEFAULT NULL::character varying,
    inscricao_estadual character varying(45) DEFAULT NULL::character varying,
    inscricao_municipal character varying(45) DEFAULT NULL::character varying,
    data_constituicao date,
    tipo_regime character(1) DEFAULT NULL::bpchar,
    crt character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_pessoa_juridica_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_pessoa_juridica OWNER TO postgres;

--
-- TOC entry 762 (class 1259 OID 28449)
-- Name: corp_pessoa_papel; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_pessoa_papel (
    id_pessoa bigint NOT NULL,
    tipo_papel character varying(30) NOT NULL
);


ALTER TABLE sagnus.corp_pessoa_papel OWNER TO postgres;

--
-- TOC entry 482 (class 1259 OID 22822)
-- Name: seq_corp_pessoa_telefone; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_pessoa_telefone
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_pessoa_telefone OWNER TO postgres;

--
-- TOC entry 526 (class 1259 OID 23257)
-- Name: corp_pessoa_telefone; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_pessoa_telefone (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_pessoa_telefone'::regclass) CONSTRAINT "corp_pessoa_telefone_ID_not_null" NOT NULL,
    id_pessoa numeric(11,0) CONSTRAINT "corp_pessoa_telefone_ID_PESSOA_not_null" NOT NULL,
    tipo character(1) DEFAULT NULL::bpchar,
    numero character varying(15) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_pessoa_telefone_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_pessoa_telefone OWNER TO postgres;

--
-- TOC entry 483 (class 1259 OID 22823)
-- Name: seq_corp_produto; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_produto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_produto OWNER TO postgres;

--
-- TOC entry 527 (class 1259 OID 23269)
-- Name: corp_produto; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_produto (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_produto'::regclass) CONSTRAINT "corp_produto_ID_not_null" NOT NULL,
    id_produto_subgrupo numeric(11,0) CONSTRAINT "corp_produto_ID_PRODUTO_SUBGRUPO_not_null" NOT NULL,
    id_produto_marca numeric(11,0) CONSTRAINT "corp_produto_ID_PRODUTO_MARCA_not_null" NOT NULL,
    id_produto_unidade numeric(11,0) CONSTRAINT "corp_produto_ID_PRODUTO_UNIDADE_not_null" NOT NULL,
    id_tribut_icms_custom_cab numeric(10,0) DEFAULT NULL::numeric,
    id_tribut_grupo_tributario numeric(11,0) DEFAULT NULL::numeric,
    nome character varying(100) DEFAULT NULL::character varying,
    descricao character varying(250) DEFAULT NULL::character varying,
    gtin character varying(14) DEFAULT NULL::character varying,
    codigo_interno character varying(50) DEFAULT NULL::character varying,
    valor_compra numeric(18,6) DEFAULT NULL::numeric,
    valor_venda numeric(18,6) DEFAULT NULL::numeric,
    codigo_ncm character varying(8) DEFAULT NULL::character varying,
    estoque_minimo numeric(18,6) DEFAULT NULL::numeric,
    estoque_maximo numeric(18,6) DEFAULT NULL::numeric,
    quantidade_estoque numeric(18,6) DEFAULT NULL::numeric,
    data_cadastro date,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_produto_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_produto OWNER TO postgres;

--
-- TOC entry 484 (class 1259 OID 22824)
-- Name: seq_corp_produto_alteracao_item; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_produto_alteracao_item
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_produto_alteracao_item OWNER TO postgres;

--
-- TOC entry 528 (class 1259 OID 23295)
-- Name: corp_produto_alteracao_item; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_produto_alteracao_item (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_produto_alteracao_item'::regclass) CONSTRAINT "corp_produto_alteracao_item_ID_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "corp_produto_alteracao_item_ID_PRODUTO_not_null" NOT NULL,
    codigo character varying(14) DEFAULT NULL::character varying,
    nome character varying(100) DEFAULT NULL::character varying,
    data_inicial date,
    data_final date,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_produto_alteracao_item_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_produto_alteracao_item OWNER TO postgres;

--
-- TOC entry 485 (class 1259 OID 22825)
-- Name: seq_corp_produto_codigo_adicional; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_produto_codigo_adicional
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_produto_codigo_adicional OWNER TO postgres;

--
-- TOC entry 529 (class 1259 OID 23307)
-- Name: corp_produto_codigo_adicional; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_produto_codigo_adicional (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_produto_codigo_adicional'::regclass) CONSTRAINT "corp_produto_codigo_adicional_ID_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "corp_produto_codigo_adicional_ID_PRODUTO_not_null" NOT NULL,
    codigo character varying(14) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_produto_codigo_adicional_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_produto_codigo_adicional OWNER TO postgres;

--
-- TOC entry 486 (class 1259 OID 22826)
-- Name: seq_corp_produto_ficha_tecnica; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_produto_ficha_tecnica
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_produto_ficha_tecnica OWNER TO postgres;

--
-- TOC entry 530 (class 1259 OID 23318)
-- Name: corp_produto_ficha_tecnica; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_produto_ficha_tecnica (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_produto_ficha_tecnica'::regclass) CONSTRAINT "corp_produto_ficha_tecnica_ID_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "corp_produto_ficha_tecnica_ID_PRODUTO_not_null" NOT NULL,
    descricao character varying(100) DEFAULT NULL::character varying,
    id_produto_filho numeric(11,0) DEFAULT NULL::numeric,
    quantidade numeric(18,6) DEFAULT NULL::numeric,
    sequencia_producao numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_produto_ficha_tecnica_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_produto_ficha_tecnica OWNER TO postgres;

--
-- TOC entry 487 (class 1259 OID 22827)
-- Name: seq_corp_produto_grupo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_produto_grupo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_produto_grupo OWNER TO postgres;

--
-- TOC entry 531 (class 1259 OID 23332)
-- Name: corp_produto_grupo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_produto_grupo (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_produto_grupo'::regclass) CONSTRAINT "corp_produto_grupo_ID_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    descricao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_produto_grupo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_produto_grupo OWNER TO postgres;

--
-- TOC entry 488 (class 1259 OID 22828)
-- Name: seq_corp_produto_marca; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_produto_marca
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_produto_marca OWNER TO postgres;

--
-- TOC entry 532 (class 1259 OID 23343)
-- Name: corp_produto_marca; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_produto_marca (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_produto_marca'::regclass) CONSTRAINT "corp_produto_marca_ID_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    descricao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_produto_marca_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_produto_marca OWNER TO postgres;

--
-- TOC entry 489 (class 1259 OID 22829)
-- Name: seq_corp_produto_promocao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_produto_promocao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_produto_promocao OWNER TO postgres;

--
-- TOC entry 533 (class 1259 OID 23354)
-- Name: corp_produto_promocao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_produto_promocao (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_produto_promocao'::regclass) CONSTRAINT "corp_produto_promocao_ID_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "corp_produto_promocao_ID_PRODUTO_not_null" NOT NULL,
    data_inicio date,
    data_fim date,
    quantidade_em_promocao numeric(18,6) DEFAULT NULL::numeric,
    quantidade_maxima_cliente numeric(18,6) DEFAULT NULL::numeric,
    valor numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_produto_promocao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_produto_promocao OWNER TO postgres;

--
-- TOC entry 490 (class 1259 OID 22830)
-- Name: seq_corp_produto_subgrupo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_produto_subgrupo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_produto_subgrupo OWNER TO postgres;

--
-- TOC entry 534 (class 1259 OID 23367)
-- Name: corp_produto_subgrupo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_produto_subgrupo (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_produto_subgrupo'::regclass) CONSTRAINT "corp_produto_subgrupo_ID_not_null" NOT NULL,
    id_produto_grupo numeric(11,0) CONSTRAINT "corp_produto_subgrupo_ID_PRODUTO_GRUPO_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    descricao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_produto_subgrupo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_produto_subgrupo OWNER TO postgres;

--
-- TOC entry 491 (class 1259 OID 22831)
-- Name: seq_corp_produto_unidade; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_produto_unidade
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_produto_unidade OWNER TO postgres;

--
-- TOC entry 535 (class 1259 OID 23379)
-- Name: corp_produto_unidade; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_produto_unidade (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_produto_unidade'::regclass) CONSTRAINT "corp_produto_unidade_ID_not_null" NOT NULL,
    sigla character varying(10) DEFAULT NULL::character varying,
    descricao character varying(250) DEFAULT NULL::character varying,
    pode_fracionar character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_produto_unidade_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_produto_unidade OWNER TO postgres;

--
-- TOC entry 492 (class 1259 OID 22832)
-- Name: seq_corp_setor; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_setor
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_setor OWNER TO postgres;

--
-- TOC entry 536 (class 1259 OID 23391)
-- Name: corp_setor; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_setor (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_setor'::regclass) CONSTRAINT "corp_setor_ID_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    descricao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_setor_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_setor OWNER TO postgres;

--
-- TOC entry 493 (class 1259 OID 22833)
-- Name: seq_corp_sindicato; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_sindicato
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_sindicato OWNER TO postgres;

--
-- TOC entry 537 (class 1259 OID 23402)
-- Name: corp_sindicato; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_sindicato (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_sindicato'::regclass) CONSTRAINT "corp_sindicato_ID_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    codigo_banco numeric(11,0) DEFAULT NULL::numeric,
    codigo_agencia numeric(11,0) DEFAULT NULL::numeric,
    conta_banco character varying(20) DEFAULT NULL::character varying,
    codigo_cedente character varying(30) DEFAULT NULL::character varying,
    logradouro character varying(100) DEFAULT NULL::character varying,
    numero character varying(10) DEFAULT NULL::character varying,
    bairro character varying(100) DEFAULT NULL::character varying,
    municipio_ibge numeric(11,0) DEFAULT NULL::numeric,
    uf character(2) DEFAULT NULL::bpchar,
    fone1 character varying(14) DEFAULT NULL::character varying,
    fone2 character varying(14) DEFAULT NULL::character varying,
    email character varying(100) DEFAULT NULL::character varying,
    tipo_sindicato character(1) DEFAULT NULL::bpchar,
    data_base date,
    piso_salarial numeric(18,6) DEFAULT NULL::numeric,
    cnpj character varying(14) DEFAULT NULL::character varying,
    classificacao_contabil_conta character varying(30) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_sindicato_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_sindicato OWNER TO postgres;

--
-- TOC entry 494 (class 1259 OID 22834)
-- Name: seq_corp_tabela_preco; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_tabela_preco
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_tabela_preco OWNER TO postgres;

--
-- TOC entry 538 (class 1259 OID 23430)
-- Name: corp_tabela_preco; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_tabela_preco (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_corp_tabela_preco'::regclass) CONSTRAINT "corp_tabela_preco_ID_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    principal character(1) DEFAULT NULL::bpchar,
    coeficiente numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_tabela_preco_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_tabela_preco OWNER TO postgres;

--
-- TOC entry 495 (class 1259 OID 22835)
-- Name: seq_corp_tipo_admissao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_tipo_admissao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_tipo_admissao OWNER TO postgres;

--
-- TOC entry 539 (class 1259 OID 23442)
-- Name: corp_tipo_admissao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_tipo_admissao (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_tipo_admissao'::regclass) CONSTRAINT "corp_tipo_admissao_ID_not_null" NOT NULL,
    codigo character(3) DEFAULT NULL::bpchar,
    nome character varying(100) DEFAULT NULL::character varying,
    descricao text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_tipo_admissao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_tipo_admissao OWNER TO postgres;

--
-- TOC entry 496 (class 1259 OID 22836)
-- Name: seq_corp_tipo_relacionamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_tipo_relacionamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_tipo_relacionamento OWNER TO postgres;

--
-- TOC entry 540 (class 1259 OID 23455)
-- Name: corp_tipo_relacionamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_tipo_relacionamento (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_tipo_relacionamento'::regclass) CONSTRAINT "corp_tipo_relacionamento_ID_not_null" NOT NULL,
    codigo character(3) DEFAULT NULL::bpchar,
    nome character varying(100) DEFAULT NULL::character varying,
    descricao text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_tipo_relacionamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_tipo_relacionamento OWNER TO postgres;

--
-- TOC entry 497 (class 1259 OID 22837)
-- Name: seq_corp_transportadora; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_transportadora
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_transportadora OWNER TO postgres;

--
-- TOC entry 541 (class 1259 OID 23468)
-- Name: corp_transportadora; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_transportadora (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_transportadora'::regclass) CONSTRAINT "corp_transportadora_ID_not_null" NOT NULL,
    id_pessoa numeric(11,0) CONSTRAINT "corp_transportadora_ID_PESSOA_not_null" NOT NULL,
    data_cadastro date,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_transportadora_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_transportadora OWNER TO postgres;

--
-- TOC entry 594 (class 1259 OID 25332)
-- Name: seq_corp_uf; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_uf
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_uf OWNER TO postgres;

--
-- TOC entry 640 (class 1259 OID 25741)
-- Name: corp_uf; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_uf (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_uf'::regclass) CONSTRAINT "corp_uf_ID_not_null" NOT NULL,
    sigla character(2) DEFAULT NULL::bpchar,
    nome character varying(100) DEFAULT NULL::character varying,
    codigo_ibge numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_uf_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_uf OWNER TO postgres;

--
-- TOC entry 500 (class 1259 OID 22840)
-- Name: seq_corp_vendedor; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_vendedor
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_vendedor OWNER TO postgres;

--
-- TOC entry 544 (class 1259 OID 23503)
-- Name: corp_vendedor; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.corp_vendedor (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_vendedor'::regclass) CONSTRAINT "corp_vendedor_ID_not_null" NOT NULL,
    id_colaborador numeric(11,0) CONSTRAINT "corp_vendedor_ID_COLABORADOR_not_null" NOT NULL,
    id_comissao_perfil numeric(10,0) DEFAULT NULL::numeric,
    comissao numeric(18,6) DEFAULT NULL::numeric,
    meta_venda numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_vendedor_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.corp_vendedor OWNER TO postgres;

--
-- TOC entry 722 (class 1259 OID 27269)
-- Name: seq_ctbl_conta; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_conta
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_conta OWNER TO postgres;

--
-- TOC entry 742 (class 1259 OID 27289)
-- Name: ctbl_conta; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_conta (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_conta'::regclass) CONSTRAINT "ctbl_conta_ID_not_null" NOT NULL,
    id_plano_conta numeric(11,0) CONSTRAINT "ctbl_conta_ID_PLANO_CONTA_not_null" NOT NULL,
    id_ctbl_conta numeric(11,0) DEFAULT NULL::numeric,
    id_plano_conta_ref_sped numeric(11,0) CONSTRAINT "ctbl_conta_ID_PLANO_CONTA_REF_SPED_not_null" NOT NULL,
    classificacao character varying(30) DEFAULT NULL::character varying,
    tipo character(1) DEFAULT NULL::bpchar,
    descricao character varying(100) DEFAULT NULL::character varying,
    data_inclusao date,
    situacao character(1) DEFAULT NULL::bpchar,
    natureza character(1) DEFAULT NULL::bpchar,
    patrimonio_resultado character(1) DEFAULT NULL::bpchar,
    livro_caixa character(1) DEFAULT NULL::bpchar,
    dfc character(1) DEFAULT NULL::bpchar,
    ordem character varying(20) DEFAULT NULL::character varying,
    codigo_reduzido character varying(10) DEFAULT NULL::character varying,
    codigo_efd character(2) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_conta_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_conta OWNER TO postgres;

--
-- TOC entry 723 (class 1259 OID 27270)
-- Name: seq_ctbl_conta_rateio; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_conta_rateio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_conta_rateio OWNER TO postgres;

--
-- TOC entry 743 (class 1259 OID 27312)
-- Name: ctbl_conta_rateio; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_conta_rateio (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_conta_rateio'::regclass) CONSTRAINT "ctbl_conta_rateio_ID_not_null" NOT NULL,
    id_centro_resultado numeric(11,0) CONSTRAINT "ctbl_conta_rateio_ID_CENTRO_RESULTADO_not_null" NOT NULL,
    id_ctbl_conta numeric(11,0) CONSTRAINT "ctbl_conta_rateio_ID_CONTABIL_CONTA_not_null" NOT NULL,
    porcento_rateio numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_conta_rateio_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_conta_rateio OWNER TO postgres;

--
-- TOC entry 724 (class 1259 OID 27271)
-- Name: seq_ctbl_dre_cab; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_dre_cab
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_dre_cab OWNER TO postgres;

--
-- TOC entry 744 (class 1259 OID 27324)
-- Name: ctbl_dre_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_dre_cab (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_dre_cab'::regclass) CONSTRAINT "ctbl_dre_cab_ID_not_null" NOT NULL,
    descricao character varying(100) DEFAULT NULL::character varying,
    padrao character(1) DEFAULT NULL::bpchar,
    periodo_inicial character varying(7) DEFAULT NULL::character varying,
    periodo_final character varying(7) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_dre_cab_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_dre_cab OWNER TO postgres;

--
-- TOC entry 725 (class 1259 OID 27272)
-- Name: seq_ctbl_dre_det; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_dre_det
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_dre_det OWNER TO postgres;

--
-- TOC entry 745 (class 1259 OID 27337)
-- Name: ctbl_dre_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_dre_det (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_dre_det'::regclass) CONSTRAINT "ctbl_dre_det_ID_not_null" NOT NULL,
    id_ctbl_dre_cab numeric(11,0) CONSTRAINT "ctbl_dre_det_ID_CONTABIL_DRE_cab_not_null" NOT NULL,
    classificacao character varying(30) DEFAULT NULL::character varying,
    descricao character varying(100) DEFAULT NULL::character varying,
    forma_calculo character(1) DEFAULT NULL::bpchar,
    sinal character(1) DEFAULT NULL::bpchar,
    natureza character(1) DEFAULT NULL::bpchar,
    valor numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_dre_det_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_dre_det OWNER TO postgres;

--
-- TOC entry 726 (class 1259 OID 27273)
-- Name: seq_ctbl_encerramento_exe_cab; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_encerramento_exe_cab
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_encerramento_exe_cab OWNER TO postgres;

--
-- TOC entry 746 (class 1259 OID 27353)
-- Name: ctbl_encerramento_exe_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_encerramento_exe_cab (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_encerramento_exe_cab'::regclass) CONSTRAINT "ctbl_encerramento_exe_cab_ID_not_null" NOT NULL,
    data_inicio date,
    data_fim date,
    data_inclusao date,
    motivo character varying(100) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_encerramento_exe_cab_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_encerramento_exe_cab OWNER TO postgres;

--
-- TOC entry 727 (class 1259 OID 27274)
-- Name: seq_ctbl_encerramento_exe_det; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_encerramento_exe_det
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_encerramento_exe_det OWNER TO postgres;

--
-- TOC entry 747 (class 1259 OID 27363)
-- Name: ctbl_encerramento_exe_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_encerramento_exe_det (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_encerramento_exe_det'::regclass) CONSTRAINT "ctbl_encerramento_exe_det_ID_not_null" NOT NULL,
    id_ctbl_conta numeric(11,0) CONSTRAINT "ctbl_encerramento_exe_det_ID_CONTABIL_CONTA_not_null" NOT NULL,
    id_ctbl_encerramento_exe numeric(11,0) CONSTRAINT "ctbl_encerramento_exe_det_ID_CONTABIL_ENCERRAMENTO_EXE_not_null" NOT NULL,
    saldo_anterior numeric(18,6) DEFAULT NULL::numeric,
    valor_debito numeric(18,6) DEFAULT NULL::numeric,
    valor_credito numeric(18,6) DEFAULT NULL::numeric,
    saldo numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_encerramento_exe_det_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_encerramento_exe_det OWNER TO postgres;

--
-- TOC entry 728 (class 1259 OID 27275)
-- Name: seq_ctbl_fechamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_fechamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_fechamento OWNER TO postgres;

--
-- TOC entry 748 (class 1259 OID 27378)
-- Name: ctbl_fechamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_fechamento (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_fechamento'::regclass) CONSTRAINT "ctbl_fechamento_ID_not_null" NOT NULL,
    data_inicio date,
    data_fim date,
    criterio_lancamento character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_fechamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_fechamento OWNER TO postgres;

--
-- TOC entry 729 (class 1259 OID 27276)
-- Name: seq_ctbl_historico; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_historico
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_historico OWNER TO postgres;

--
-- TOC entry 749 (class 1259 OID 27388)
-- Name: ctbl_historico; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_historico (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_historico'::regclass) CONSTRAINT "ctbl_historico_ID_not_null" NOT NULL,
    descricao character varying(100) DEFAULT NULL::character varying,
    historico character varying(250) DEFAULT NULL::character varying,
    pede_complemento character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_historico_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_historico OWNER TO postgres;

--
-- TOC entry 730 (class 1259 OID 27277)
-- Name: seq_ctbl_indice; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_indice
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_indice OWNER TO postgres;

--
-- TOC entry 750 (class 1259 OID 27400)
-- Name: ctbl_indice; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_indice (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_indice'::regclass) CONSTRAINT "ctbl_indice_ID_not_null" NOT NULL,
    indice character varying(50) DEFAULT NULL::character varying,
    periodicidade character(1) CONSTRAINT "ctbl_indice_PERIODICIDADE_not_null" NOT NULL,
    diario_a_partir_de date,
    mensal_mes_ano character varying(7) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_indice_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_indice OWNER TO postgres;

--
-- TOC entry 731 (class 1259 OID 27278)
-- Name: seq_ctbl_indice_valor; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_indice_valor
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_indice_valor OWNER TO postgres;

--
-- TOC entry 751 (class 1259 OID 27412)
-- Name: ctbl_indice_valor; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_indice_valor (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_indice_valor'::regclass) CONSTRAINT "ctbl_indice_valor_ID_not_null" NOT NULL,
    id_ctbl_indice numeric(11,0) CONSTRAINT "ctbl_indice_valor_ID_CONTABIL_INDICE_not_null" NOT NULL,
    data_indice date,
    valor numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_indice_valor_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_indice_valor OWNER TO postgres;

--
-- TOC entry 732 (class 1259 OID 27279)
-- Name: seq_ctbl_lancamento_cab; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_lancamento_cab
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_lancamento_cab OWNER TO postgres;

--
-- TOC entry 752 (class 1259 OID 27423)
-- Name: ctbl_lancamento_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_lancamento_cab (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_lancamento_cab'::regclass) CONSTRAINT "ctbl_lancamento_cab_ID_not_null" NOT NULL,
    id_ctbl_lote numeric(11,0) DEFAULT NULL::numeric,
    data_lancamento date,
    data_inclusao date,
    tipo character(4) DEFAULT NULL::bpchar,
    liberado character(1) DEFAULT NULL::bpchar,
    valor numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_lancamento_cab_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_lancamento_cab OWNER TO postgres;

--
-- TOC entry 733 (class 1259 OID 27280)
-- Name: seq_ctbl_lancamento_det; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_lancamento_det
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_lancamento_det OWNER TO postgres;

--
-- TOC entry 753 (class 1259 OID 27436)
-- Name: ctbl_lancamento_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_lancamento_det (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_lancamento_det'::regclass) CONSTRAINT "ctbl_lancamento_det_ID_not_null" NOT NULL,
    id_ctbl_conta numeric(11,0) CONSTRAINT "ctbl_lancamento_det_ID_CONTABIL_CONTA_not_null" NOT NULL,
    id_ctbl_historico numeric(11,0) DEFAULT NULL::numeric,
    id_ctbl_lancamento_cab numeric(11,0) CONSTRAINT "ctbl_lancamento_det_ID_CONTABIL_LANCAMENTO_CAB_not_null" NOT NULL,
    historico character varying(250) DEFAULT NULL::character varying,
    valor numeric(18,6) DEFAULT NULL::numeric,
    tipo character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_lancamento_det_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_lancamento_det OWNER TO postgres;

--
-- TOC entry 734 (class 1259 OID 27281)
-- Name: seq_ctbl_lancamento_orcado; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_lancamento_orcado
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_lancamento_orcado OWNER TO postgres;

--
-- TOC entry 754 (class 1259 OID 27451)
-- Name: ctbl_lancamento_orcado; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_lancamento_orcado (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_lancamento_orcado'::regclass) CONSTRAINT "ctbl_lancamento_orcado_ID_not_null" NOT NULL,
    id_ctbl_conta numeric(11,0) CONSTRAINT "ctbl_lancamento_orcado_ID_CONTABIL_CONTA_not_null" NOT NULL,
    ano character(4) DEFAULT NULL::bpchar,
    janeiro numeric(18,6) DEFAULT NULL::numeric,
    fevereiro numeric(18,6) DEFAULT NULL::numeric,
    marco numeric(18,6) DEFAULT NULL::numeric,
    abril numeric(18,6) DEFAULT NULL::numeric,
    maio numeric(18,6) DEFAULT NULL::numeric,
    junho numeric(18,6) DEFAULT NULL::numeric,
    julho numeric(18,6) DEFAULT NULL::numeric,
    agosto numeric(18,6) DEFAULT NULL::numeric,
    setembro numeric(18,6) DEFAULT NULL::numeric,
    outubro numeric(18,6) DEFAULT NULL::numeric,
    novembro numeric(18,6) DEFAULT NULL::numeric,
    dezembro numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_lancamento_orcado_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_lancamento_orcado OWNER TO postgres;

--
-- TOC entry 735 (class 1259 OID 27282)
-- Name: seq_ctbl_lancamento_padrao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_lancamento_padrao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_lancamento_padrao OWNER TO postgres;

--
-- TOC entry 755 (class 1259 OID 27474)
-- Name: ctbl_lancamento_padrao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_lancamento_padrao (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_lancamento_padrao'::regclass) CONSTRAINT "ctbl_lancamento_padrao_ID_not_null" NOT NULL,
    descricao character varying(100) DEFAULT NULL::character varying,
    historico character varying(250) DEFAULT NULL::character varying,
    id_conta_debito numeric(11,0) DEFAULT NULL::numeric,
    id_conta_credito numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_lancamento_padrao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_lancamento_padrao OWNER TO postgres;

--
-- TOC entry 736 (class 1259 OID 27283)
-- Name: seq_ctbl_livro; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_livro
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_livro OWNER TO postgres;

--
-- TOC entry 756 (class 1259 OID 27487)
-- Name: ctbl_livro; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_livro (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_livro'::regclass) CONSTRAINT "ctbl_livro_ID_not_null" NOT NULL,
    descricao character varying(50) DEFAULT NULL::character varying,
    competencia character varying(7) DEFAULT NULL::character varying,
    forma_escrituracao character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_livro_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_livro OWNER TO postgres;

--
-- TOC entry 737 (class 1259 OID 27284)
-- Name: seq_ctbl_lote; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_lote
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_lote OWNER TO postgres;

--
-- TOC entry 757 (class 1259 OID 27499)
-- Name: ctbl_lote; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_lote (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_lote'::regclass) CONSTRAINT "ctbl_lote_ID_not_null" NOT NULL,
    descricao character varying(100) DEFAULT NULL::character varying,
    liberado character(1) DEFAULT NULL::bpchar,
    data_inclusao date,
    data_liberacao date,
    programado character(1) DEFAULT NULL::bpchar,
    valor numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_lote_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_lote OWNER TO postgres;

--
-- TOC entry 738 (class 1259 OID 27285)
-- Name: seq_ctbl_parametro; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_parametro
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_parametro OWNER TO postgres;

--
-- TOC entry 758 (class 1259 OID 27512)
-- Name: ctbl_parametro; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_parametro (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_parametro'::regclass) CONSTRAINT "ctbl_parametro_ID_not_null" NOT NULL,
    mascara character varying(30) DEFAULT NULL::character varying,
    niveis numeric(11,0) DEFAULT NULL::numeric,
    informar_conta_por character(1) DEFAULT NULL::bpchar,
    compartilha_plano_conta character(1) DEFAULT NULL::bpchar,
    compartilha_historicos character(1) DEFAULT NULL::bpchar,
    altera_lancamento_outro character(1) DEFAULT NULL::bpchar,
    historico_obrigatorio character(1) DEFAULT NULL::bpchar,
    permite_lancamento_zerado character(1) DEFAULT NULL::bpchar,
    gera_informativo_sped character(1) DEFAULT NULL::bpchar,
    sped_forma_escrit_diario character(3) DEFAULT NULL::bpchar,
    sped_nome_livro_diario character varying(100) DEFAULT NULL::character varying,
    assinatura_direita text,
    assinatura_esquerda text,
    conta_ativo character varying(30) DEFAULT NULL::character varying,
    conta_passivo character varying(30) DEFAULT NULL::character varying,
    conta_patrimonio_liquido character varying(30) DEFAULT NULL::character varying,
    conta_depreciacao_acumulada character varying(30) DEFAULT NULL::character varying,
    conta_capital_social character varying(30) DEFAULT NULL::character varying,
    conta_resultado_exercicio character varying(30) DEFAULT NULL::character varying,
    conta_prejuizo_acumulado character varying(30) DEFAULT NULL::character varying,
    conta_lucro_acumulado character varying(30) DEFAULT NULL::character varying,
    conta_titulo_pagar character varying(30) DEFAULT NULL::character varying,
    conta_titulo_receber character varying(30) DEFAULT NULL::character varying,
    conta_juros_passivo character varying(30) DEFAULT NULL::character varying,
    conta_juros_ativo character varying(30) DEFAULT NULL::character varying,
    conta_desconto_obtido character varying(30) DEFAULT NULL::character varying,
    conta_desconto_concedido character varying(30) DEFAULT NULL::character varying,
    conta_cmv character varying(30) DEFAULT NULL::character varying,
    conta_venda character varying(30) DEFAULT NULL::character varying,
    conta_venda_servico character varying(30) DEFAULT NULL::character varying,
    conta_estoque character varying(30) DEFAULT NULL::character varying,
    conta_apura_resultado character varying(30) DEFAULT NULL::character varying,
    conta_juros_apropriar character varying(30) DEFAULT NULL::character varying,
    id_hist_padrao_resultado numeric(11,0) DEFAULT NULL::numeric,
    id_hist_padrao_lucro numeric(11,0) DEFAULT NULL::numeric,
    id_hist_padrao_prejuizo numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_parametro_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_parametro OWNER TO postgres;

--
-- TOC entry 603 (class 1259 OID 25344)
-- Name: seq_ctbl_patrim_estado_conservacao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_patrim_estado_conservacao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_patrim_estado_conservacao OWNER TO postgres;

--
-- TOC entry 617 (class 1259 OID 25518)
-- Name: ctbl_patrim_estado_conservacao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_patrim_estado_conservacao (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_patrim_estado_conservacao'::regclass) CONSTRAINT "ctbl_patrim_estado_conservacao_ID_not_null" NOT NULL,
    codigo character(2) DEFAULT NULL::bpchar,
    nome character varying(50) DEFAULT NULL::character varying,
    descricao text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_patrim_estado_conservacao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_patrim_estado_conservacao OWNER TO postgres;

--
-- TOC entry 604 (class 1259 OID 25345)
-- Name: seq_ctbl_patrim_indice_atualizacao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_patrim_indice_atualizacao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_patrim_indice_atualizacao OWNER TO postgres;

--
-- TOC entry 618 (class 1259 OID 25531)
-- Name: ctbl_patrim_indice_atualizacao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_patrim_indice_atualizacao (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_patrim_indice_atualizacao'::regclass) CONSTRAINT "ctbl_patrim_indice_atualizacao_ID_not_null" NOT NULL,
    data_indice date,
    nome character varying(10) DEFAULT NULL::character varying,
    valor numeric(18,6) DEFAULT NULL::numeric,
    valor_alternativo numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_patrim_indice_atualizacao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_patrim_indice_atualizacao OWNER TO postgres;

--
-- TOC entry 740 (class 1259 OID 27287)
-- Name: seq_ctbl_plano_conta; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_plano_conta
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_plano_conta OWNER TO postgres;

--
-- TOC entry 760 (class 1259 OID 27575)
-- Name: ctbl_plano_conta; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_plano_conta (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_plano_conta'::regclass) CONSTRAINT "ctbl_plano_conta_ID_not_null" NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying,
    data_inclusao date,
    mascara character varying(50) DEFAULT NULL::character varying,
    niveis numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_plano_conta_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30),
    codigo_plano character varying(30)
);


ALTER TABLE sagnus.ctbl_plano_conta OWNER TO postgres;

--
-- TOC entry 741 (class 1259 OID 27288)
-- Name: seq_ctbl_plano_conta_ref_sped; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_plano_conta_ref_sped
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_plano_conta_ref_sped OWNER TO postgres;

--
-- TOC entry 761 (class 1259 OID 27587)
-- Name: ctbl_plano_conta_ref_sped; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_plano_conta_ref_sped (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_plano_conta_ref_sped'::regclass) CONSTRAINT "ctbl_plano_conta_ref_sped_ID_not_null" NOT NULL,
    cod_cta_ref character varying(30) DEFAULT NULL::character varying,
    descricao text,
    orientacoes text,
    inicio_validade date,
    fim_validade date,
    tipo character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_plano_conta_ref_sped_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_plano_conta_ref_sped OWNER TO postgres;

--
-- TOC entry 739 (class 1259 OID 27286)
-- Name: seq_ctbl_termo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_ctbl_termo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_ctbl_termo OWNER TO postgres;

--
-- TOC entry 759 (class 1259 OID 27557)
-- Name: ctbl_termo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctbl_termo (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_ctbl_termo'::regclass) CONSTRAINT "ctbl_termo_ID_not_null" NOT NULL,
    id_ctbl_livro numeric(11,0) CONSTRAINT "ctbl_termo_ID_CONTABIL_LIVRO_not_null" NOT NULL,
    abertura_encerramento character(1) DEFAULT NULL::bpchar,
    numero numeric(11,0) DEFAULT NULL::numeric,
    pagina_inicial numeric(11,0) DEFAULT NULL::numeric,
    pagina_final numeric(11,0) DEFAULT NULL::numeric,
    registrado character varying(100) DEFAULT NULL::character varying,
    numero_registro character varying(50) DEFAULT NULL::character varying,
    data_despacho date,
    data_abertura date,
    data_encerramento date,
    escrituracao_inicio date,
    escrituracao_fim date,
    texto text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "ctbl_termo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctbl_termo OWNER TO postgres;

--
-- TOC entry 605 (class 1259 OID 25346)
-- Name: seq_com_ctrs_tipo_servico; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_com_ctrs_tipo_servico
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_com_ctrs_tipo_servico OWNER TO postgres;

--
-- TOC entry 619 (class 1259 OID 25543)
-- Name: ctrs_tipo_servico; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.ctrs_tipo_servico (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_com_ctrs_tipo_servico'::regclass) CONSTRAINT "com_ctrs_tipo_servico_ID_not_null" NOT NULL,
    nome character varying(50) DEFAULT NULL::character varying,
    descricao text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "com_ctrs_tipo_servico_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.ctrs_tipo_servico OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16966)
-- Name: seq_fina_cad_doc_origem; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cad_doc_origem
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cad_doc_origem OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16967)
-- Name: fina_cad_doc_origem; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cad_doc_origem (
    id bigint DEFAULT nextval('sagnus.seq_fina_cad_doc_origem'::regclass) NOT NULL,
    codigo character(3),
    sigla character(10),
    descricao text,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cad_doc_origem OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16954)
-- Name: seq_fina_cad_nat_financeira; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cad_nat_financeira
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cad_nat_financeira OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16955)
-- Name: fina_cad_nat_financeira; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cad_nat_financeira (
    id bigint DEFAULT nextval('sagnus.seq_fina_cad_nat_financeira'::regclass) NOT NULL,
    codigo character(4),
    descricao character varying(100),
    tipo character(1),
    aplicacao character varying(250),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cad_nat_financeira OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16980)
-- Name: seq_fina_cad_status_parcela; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cad_status_parcela
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cad_status_parcela OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16981)
-- Name: fina_cad_status_parcela; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cad_status_parcela (
    id bigint DEFAULT nextval('sagnus.seq_fina_cad_status_parcela'::regclass) NOT NULL,
    situacao character(2) NOT NULL,
    descricao character varying(30),
    procedimento text,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cad_status_parcela OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16995)
-- Name: seq_fina_cad_tipo_pagto; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cad_tipo_pagto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cad_tipo_pagto OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 16996)
-- Name: fina_cad_tipo_pagto; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cad_tipo_pagto (
    id bigint DEFAULT nextval('sagnus.seq_fina_cad_tipo_pagto'::regclass) NOT NULL,
    codigo character(2),
    descricao character varying(30),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cad_tipo_pagto OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 17007)
-- Name: seq_fina_cad_tipo_receb; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cad_tipo_receb
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cad_tipo_receb OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 17008)
-- Name: fina_cad_tipo_receb; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cad_tipo_receb (
    id bigint DEFAULT nextval('sagnus.seq_fina_cad_tipo_receb'::regclass) NOT NULL,
    codigo character(2),
    descricao character varying(100),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cad_tipo_receb OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 17069)
-- Name: seq_fina_cap_lancamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cap_lancamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cap_lancamento OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 17070)
-- Name: fina_cap_lancamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cap_lancamento (
    id bigint DEFAULT nextval('sagnus.seq_fina_cap_lancamento'::regclass) NOT NULL,
    id_doc_origem bigint NOT NULL,
    id_nat_financeira bigint NOT NULL,
    id_fornecedor bigint NOT NULL,
    id_conta_caixa bigint NOT NULL,
    quantidade_parcela integer,
    valor_total numeric(18,6),
    data_lancamento date,
    numero_documento character varying(50),
    primeiro_vencimento date,
    intervalo_parcelas_dias integer,
    dia_fixo character(2),
    historico text,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cap_lancamento OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 17108)
-- Name: seq_fina_cap_parcela; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cap_parcela
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cap_parcela OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 17109)
-- Name: fina_cap_parcela; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cap_parcela (
    id bigint DEFAULT nextval('sagnus.seq_fina_cap_parcela'::regclass) NOT NULL,
    id_lancamento bigint NOT NULL,
    id_status_parcela bigint NOT NULL,
    id_tipo_pagto bigint,
    numero_parcela integer,
    data_emissao date,
    data_vencimento date,
    data_pagamento date,
    valor_parcela numeric(18,6),
    valor_pago numeric(18,6),
    valor_desconto numeric(18,6),
    valor_juros numeric(18,6),
    valor_multa numeric(18,6),
    historico text,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cap_parcela OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 17140)
-- Name: seq_fina_car_lancamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_car_lancamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_car_lancamento OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 17141)
-- Name: fina_car_lancamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_car_lancamento (
    id bigint DEFAULT nextval('sagnus.seq_fina_car_lancamento'::regclass) NOT NULL,
    id_doc_origem bigint NOT NULL,
    id_nat_financeira bigint NOT NULL,
    id_cliente bigint NOT NULL,
    id_conta_caixa bigint NOT NULL,
    quantidade_parcela integer,
    valor_total numeric(18,6),
    data_lancamento date,
    numero_documento character varying(50),
    primeiro_vencimento date,
    intervalo_parcelas_dias integer,
    dia_fixo character(2),
    historico text,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_car_lancamento OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 17179)
-- Name: seq_fina_car_parcela; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_car_parcela
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_car_parcela OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 17180)
-- Name: fina_car_parcela; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_car_parcela (
    id bigint DEFAULT nextval('sagnus.seq_fina_car_parcela'::regclass) NOT NULL,
    id_lancamento bigint NOT NULL,
    id_status_parcela bigint NOT NULL,
    id_tipo_receb bigint,
    numero_parcela integer,
    data_emissao date,
    data_vencimento date,
    data_recebimento date,
    valor_parcela numeric(18,6),
    valor_recebido numeric(18,6),
    valor_desconto numeric(18,6),
    valor_juros numeric(18,6),
    valor_multa numeric(18,6),
    historico text,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_car_parcela OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 17303)
-- Name: seq_fina_cbk_conc; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cbk_conc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cbk_conc OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 17304)
-- Name: fina_cbk_conc; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cbk_conc (
    id bigint DEFAULT nextval('sagnus.seq_fina_cbk_conc'::regclass) NOT NULL,
    id_conta_caixa bigint NOT NULL,
    periodo_inicio date NOT NULL,
    periodo_fim date NOT NULL,
    saldo_inicial_banco numeric(18,6),
    saldo_final_banco numeric(18,6),
    saldo_inicial_sis numeric(18,6),
    saldo_final_sis numeric(18,6),
    status character(1),
    observacao text,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cbk_conc OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 17325)
-- Name: seq_fina_cbk_conc_item; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cbk_conc_item
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cbk_conc_item OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 17326)
-- Name: fina_cbk_conc_item; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cbk_conc_item (
    id bigint DEFAULT nextval('sagnus.seq_fina_cbk_conc_item'::regclass) NOT NULL,
    id_conciliacao bigint NOT NULL,
    id_extrato bigint,
    id_cap_parcela bigint,
    id_car_parcela bigint,
    id_edi_linha bigint,
    tipo_origem character(1),
    status_match character(1),
    diferenca_valor numeric(18,6),
    observacao text,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cbk_conc_item OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 17019)
-- Name: seq_fina_cxb_banco; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cxb_banco
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cxb_banco OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 17020)
-- Name: fina_cxb_banco; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cxb_banco (
    id bigint DEFAULT nextval('sagnus.seq_fina_cxb_banco'::regclass) NOT NULL,
    codigo character varying(10),
    nome character varying(100),
    url character varying(250),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cxb_banco OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 17031)
-- Name: seq_fina_cxb_banco_ag; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cxb_banco_ag
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cxb_banco_ag OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 17032)
-- Name: fina_cxb_banco_agencia; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cxb_banco_agencia (
    id bigint DEFAULT nextval('sagnus.seq_fina_cxb_banco_ag'::regclass) NOT NULL,
    id_banco bigint NOT NULL,
    numero character varying(20),
    digito character(1),
    nome character varying(100),
    telefone character varying(15),
    contato character varying(100),
    observacao character varying(250),
    gerente character varying(100),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cxb_banco_agencia OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 17051)
-- Name: seq_fina_cxb_conta_caixa; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cxb_conta_caixa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cxb_conta_caixa OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 17052)
-- Name: fina_cxb_conta_caixa; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cxb_conta_caixa (
    id bigint DEFAULT nextval('sagnus.seq_fina_cxb_conta_caixa'::regclass) NOT NULL,
    id_banco_agencia bigint,
    numero character varying(20),
    digito character(1),
    nome character varying(100),
    tipo character(1),
    descricao character varying(250),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cxb_conta_caixa OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 17265)
-- Name: seq_fina_cxb_extrato; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_cxb_extrato
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_cxb_extrato OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 17266)
-- Name: fina_cxb_extrato; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_cxb_extrato (
    id bigint DEFAULT nextval('sagnus.seq_fina_cxb_extrato'::regclass) NOT NULL,
    id_conta_caixa bigint NOT NULL,
    data_movimento date NOT NULL,
    historico character varying(250),
    documento character varying(50),
    tipo_lancamento character(1) NOT NULL,
    valor numeric(18,6) NOT NULL,
    saldo_apos numeric(18,6),
    id_cap_parcela bigint,
    id_car_parcela bigint,
    id_edi_linha bigint,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_cxb_extrato OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 17211)
-- Name: seq_fina_edi_arquivo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_edi_arquivo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_edi_arquivo OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 17212)
-- Name: fina_edi_arquivo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_edi_arquivo (
    id bigint DEFAULT nextval('sagnus.seq_fina_edi_arquivo'::regclass) NOT NULL,
    id_conta_caixa bigint NOT NULL,
    tipo_arquivo character(1) NOT NULL,
    banco_codigo character varying(10),
    banco_nome character varying(100),
    data_geracao date,
    hora_geracao character varying(8),
    nome_arquivo character varying(255),
    caminho_arquivo character varying(500),
    layout character varying(50),
    sequencial_arquivo integer,
    total_registros integer,
    total_titulos integer,
    valor_total numeric(18,6),
    status_processamento character(1),
    mensagem_erro text,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_edi_arquivo OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 17233)
-- Name: seq_fina_edi_linha; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_edi_linha
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_edi_linha OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 17234)
-- Name: fina_edi_linha; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_edi_linha (
    id bigint DEFAULT nextval('sagnus.seq_fina_edi_linha'::regclass) NOT NULL,
    id_arquivo bigint NOT NULL,
    linha_numero integer,
    linha_conteudo text,
    id_cap_parcela bigint,
    id_car_parcela bigint,
    nosso_numero character varying(30),
    numero_documento character varying(50),
    data_vencimento date,
    valor_titulo numeric(18,6),
    data_ocorrencia date,
    codigo_ocorrencia character varying(10),
    descricao_ocorrencia character varying(250),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_edi_linha OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 17514)
-- Name: seq_fina_fcx_previsto; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_fcx_previsto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_fcx_previsto OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 17515)
-- Name: fina_fcx_previsto; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_fcx_previsto (
    id bigint DEFAULT nextval('sagnus.seq_fina_fcx_previsto'::regclass) NOT NULL,
    id_conta_caixa bigint NOT NULL,
    data_prevista date NOT NULL,
    tipo_fluxo character(1) NOT NULL,
    origem character(1) NOT NULL,
    id_cap_parcela bigint,
    id_car_parcela bigint,
    id_tes_movimento bigint,
    valor_previsto numeric(18,6) NOT NULL,
    valor_realizado numeric(18,6),
    data_realizacao date,
    id_extrato bigint,
    status character(1),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_fcx_previsto OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 17558)
-- Name: seq_fina_fcx_saldo_diario; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_fcx_saldo_diario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_fcx_saldo_diario OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 17559)
-- Name: fina_fcx_saldo_diario; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_fcx_saldo_diario (
    id bigint DEFAULT nextval('sagnus.seq_fina_fcx_saldo_diario'::regclass) NOT NULL,
    id_conta_caixa bigint NOT NULL,
    data_referencia date NOT NULL,
    saldo_inicial numeric(18,6),
    total_entradas numeric(18,6),
    total_saidas numeric(18,6),
    saldo_final numeric(18,6),
    origem_calculo character(1),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_fcx_saldo_diario OWNER TO postgres;

--
-- TOC entry 773 (class 1259 OID 28547)
-- Name: fina_plano_contas; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_plano_contas (
    id integer NOT NULL,
    codigo_estrutural character varying(20) NOT NULL,
    descricao character varying(100) NOT NULL,
    tipo character varying(1) NOT NULL
);


ALTER TABLE sagnus.fina_plano_contas OWNER TO postgres;

--
-- TOC entry 772 (class 1259 OID 28546)
-- Name: fina_plano_contas_id_seq; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.fina_plano_contas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.fina_plano_contas_id_seq OWNER TO postgres;

--
-- TOC entry 10253 (class 0 OID 0)
-- Dependencies: 772
-- Name: fina_plano_contas_id_seq; Type: SEQUENCE OWNED BY; Schema: sagnus; Owner: postgres
--

ALTER SEQUENCE sagnus.fina_plano_contas_id_seq OWNED BY sagnus.fina_plano_contas.id;


--
-- TOC entry 285 (class 1259 OID 17440)
-- Name: seq_fina_tes_aplicacao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_tes_aplicacao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_tes_aplicacao OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 17441)
-- Name: fina_tes_aplicacao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_tes_aplicacao (
    id bigint DEFAULT nextval('sagnus.seq_fina_tes_aplicacao'::regclass) NOT NULL,
    id_conta_origem bigint NOT NULL,
    id_conta_aplicacao bigint NOT NULL,
    data_aplicacao date NOT NULL,
    valor_aplicado numeric(18,6) NOT NULL,
    taxa_juros_anual numeric(18,6),
    indice_correcao character varying(20),
    data_vencimento date,
    tipo_aplicacao character varying(30),
    numero_contrato character varying(50),
    id_mov_origem bigint,
    id_mov_destino bigint,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_tes_aplicacao OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 17369)
-- Name: seq_fina_tes_movimento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_tes_movimento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_tes_movimento OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 17370)
-- Name: fina_tes_movimento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_tes_movimento (
    id bigint DEFAULT nextval('sagnus.seq_fina_tes_movimento'::regclass) NOT NULL,
    id_conta_caixa bigint NOT NULL,
    data_movimento date NOT NULL,
    tipo_movimento character(1) NOT NULL,
    origem character(1) NOT NULL,
    historico character varying(250),
    documento character varying(50),
    valor numeric(18,6) NOT NULL,
    id_cap_parcela bigint,
    id_car_parcela bigint,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_tes_movimento OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 17477)
-- Name: seq_fina_tes_resgate; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_tes_resgate
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_tes_resgate OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 17478)
-- Name: fina_tes_resgate; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_tes_resgate (
    id bigint DEFAULT nextval('sagnus.seq_fina_tes_resgate'::regclass) NOT NULL,
    id_aplicacao bigint NOT NULL,
    id_conta_destino bigint NOT NULL,
    data_resgate date NOT NULL,
    valor_resgatado numeric(18,6) NOT NULL,
    valor_juros numeric(18,6),
    valor_imposto numeric(18,6),
    valor_iof numeric(18,6),
    id_mov_origem bigint,
    id_mov_destino bigint,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_tes_resgate OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 17403)
-- Name: seq_fina_tes_transferencia; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fina_tes_transferencia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fina_tes_transferencia OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 17404)
-- Name: fina_tes_transferencia; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_tes_transferencia (
    id bigint DEFAULT nextval('sagnus.seq_fina_tes_transferencia'::regclass) NOT NULL,
    id_conta_origem bigint NOT NULL,
    id_conta_destino bigint NOT NULL,
    data_movimento date NOT NULL,
    valor numeric(18,6) NOT NULL,
    historico character varying(250),
    documento character varying(50),
    status character(1),
    id_mov_origem bigint,
    id_mov_destino bigint,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fina_tes_transferencia OWNER TO postgres;

--
-- TOC entry 775 (class 1259 OID 28558)
-- Name: fina_titulo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fina_titulo (
    id bigint NOT NULL,
    id_pessoa bigint NOT NULL,
    id_plano_contas integer,
    tipo_titulo character varying(1) NOT NULL,
    numero_documento character varying(50),
    data_emissao date DEFAULT CURRENT_DATE,
    data_vencimento date NOT NULL,
    valor_original numeric(15,2) NOT NULL,
    valor_saldo numeric(15,2) NOT NULL,
    status character varying(20) DEFAULT 'ABERTO'::character varying,
    id_origem_venda bigint
);


ALTER TABLE sagnus.fina_titulo OWNER TO postgres;

--
-- TOC entry 774 (class 1259 OID 28557)
-- Name: fina_titulo_id_seq; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.fina_titulo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.fina_titulo_id_seq OWNER TO postgres;

--
-- TOC entry 10264 (class 0 OID 0)
-- Dependencies: 774
-- Name: fina_titulo_id_seq; Type: SEQUENCE OWNED BY; Schema: sagnus; Owner: postgres
--

ALTER SEQUENCE sagnus.fina_titulo_id_seq OWNED BY sagnus.fina_titulo.id;


--
-- TOC entry 232 (class 1259 OID 16620)
-- Name: seq_fisc_aidf_aimdf; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_aidf_aimdf
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_aidf_aimdf OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16621)
-- Name: fisc_aidf_aimdf; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_aidf_aimdf (
    id bigint DEFAULT nextval('sagnus.seq_fisc_aidf_aimdf'::regclass) NOT NULL,
    numero bigint,
    data_validade date,
    data_autorizacao date,
    numero_autorizacao character varying(20),
    formulario_disponivel character(1),
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    usu_criacao character varying(30) NOT NULL,
    atualizado_em timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_aidf_aimdf OWNER TO postgres;

--
-- TOC entry 592 (class 1259 OID 25329)
-- Name: seq_fisc_cfop; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cfop
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cfop OWNER TO postgres;

--
-- TOC entry 607 (class 1259 OID 25361)
-- Name: fisc_cfop; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cfop (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_cfop'::regclass) CONSTRAINT "fisc_cfop_ID_not_null" NOT NULL,
    codigo numeric(11,0) DEFAULT NULL::numeric,
    descricao character varying(1000) DEFAULT NULL::character varying,
    aplicacao character varying(1000) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cfop_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cfop OWNER TO postgres;

--
-- TOC entry 593 (class 1259 OID 25330)
-- Name: seq_fisc_csosn; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_csosn
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_csosn OWNER TO postgres;

--
-- TOC entry 608 (class 1259 OID 25375)
-- Name: fisc_csosn; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_csosn (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_csosn'::regclass) CONSTRAINT "fisc_csosn_ID_not_null" NOT NULL,
    codigo character(3) DEFAULT NULL::bpchar,
    descricao character varying(250) DEFAULT NULL::character varying,
    observacao character varying(1000) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_csosn_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_csosn OWNER TO postgres;

--
-- TOC entry 595 (class 1259 OID 25333)
-- Name: seq_fisc_cst_cofins; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cst_cofins
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cst_cofins OWNER TO postgres;

--
-- TOC entry 609 (class 1259 OID 25389)
-- Name: fisc_cst_cofins; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cst_cofins (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_cst_cofins'::regclass) CONSTRAINT "fisc_cst_cofins_ID_not_null" NOT NULL,
    codigo character(2) DEFAULT NULL::bpchar,
    descricao character varying(250) DEFAULT NULL::character varying,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cst_cofins_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cst_cofins OWNER TO postgres;

--
-- TOC entry 596 (class 1259 OID 25334)
-- Name: seq_fisc_cst_icms; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cst_icms
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cst_icms OWNER TO postgres;

--
-- TOC entry 610 (class 1259 OID 25403)
-- Name: fisc_cst_icms; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cst_icms (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_cst_icms'::regclass) CONSTRAINT "fisc_cst_icms_ID_not_null" NOT NULL,
    codigo character(2) DEFAULT NULL::bpchar,
    descricao character varying(250) DEFAULT NULL::character varying,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cst_icms_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cst_icms OWNER TO postgres;

--
-- TOC entry 597 (class 1259 OID 25335)
-- Name: seq_fisc_cst_ipi; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cst_ipi
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cst_ipi OWNER TO postgres;

--
-- TOC entry 611 (class 1259 OID 25417)
-- Name: fisc_cst_ipi; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cst_ipi (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_cst_ipi'::regclass) CONSTRAINT "fisc_cst_ipi_ID_not_null" NOT NULL,
    codigo character(2) DEFAULT NULL::bpchar,
    descricao character varying(250) DEFAULT NULL::character varying,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cst_ipi_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cst_ipi OWNER TO postgres;

--
-- TOC entry 598 (class 1259 OID 25336)
-- Name: seq_fisc_cst_pis; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cst_pis
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cst_pis OWNER TO postgres;

--
-- TOC entry 612 (class 1259 OID 25431)
-- Name: fisc_cst_pis; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cst_pis (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_cst_pis'::regclass) CONSTRAINT "fisc_cst_pis_ID_not_null" NOT NULL,
    codigo character(2) DEFAULT NULL::bpchar,
    descricao character varying(250) DEFAULT NULL::character varying,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cst_pis_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cst_pis OWNER TO postgres;

--
-- TOC entry 383 (class 1259 OID 21397)
-- Name: seq_fisc_cte_aereo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_aereo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_aereo OWNER TO postgres;

--
-- TOC entry 384 (class 1259 OID 21398)
-- Name: fisc_cte_aereo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_aereo (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_aereo'::regclass) CONSTRAINT "fisc_cte_aereo_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_aereo_ID_CTE_CABECALHO_not_null" NOT NULL,
    numero_minuta numeric(10,0) DEFAULT NULL::numeric,
    numero_conhecimento numeric(10,0) DEFAULT NULL::numeric,
    data_prevista_entrega date,
    id_emissor character varying(20) DEFAULT NULL::character varying,
    id_interna_tomador character varying(14) DEFAULT NULL::character varying,
    tarifa_classe character(1) DEFAULT NULL::bpchar,
    tarifa_codigo character varying(4) DEFAULT NULL::character varying,
    tarifa_valor numeric(18,6) DEFAULT NULL::numeric,
    carga_dimensao character varying(14) DEFAULT NULL::character varying,
    carga_informacao_manuseio character(1) DEFAULT NULL::bpchar,
    carga_especial character(3) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_aereo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_aereo OWNER TO postgres;

--
-- TOC entry 385 (class 1259 OID 21424)
-- Name: seq_fisc_cte_aquaviario; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_aquaviario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_aquaviario OWNER TO postgres;

--
-- TOC entry 386 (class 1259 OID 21425)
-- Name: fisc_cte_aquaviario; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_aquaviario (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_aquaviario'::regclass) CONSTRAINT "fisc_cte_aquaviario_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_aquaviario_ID_CTE_CABECALHO_not_null" NOT NULL,
    valor_prestacao numeric(18,6) DEFAULT NULL::numeric,
    afrmm numeric(18,6) DEFAULT NULL::numeric,
    numero_booking character varying(10) DEFAULT NULL::character varying,
    numero_controle character varying(10) DEFAULT NULL::character varying,
    id_navio character varying(60) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_aquaviario_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_aquaviario OWNER TO postgres;

--
-- TOC entry 387 (class 1259 OID 21446)
-- Name: seq_fisc_cte_aquaviario_balsa; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_aquaviario_balsa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_aquaviario_balsa OWNER TO postgres;

--
-- TOC entry 388 (class 1259 OID 21447)
-- Name: fisc_cte_aquaviario_balsa; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_aquaviario_balsa (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_aquaviario_balsa'::regclass) CONSTRAINT "fisc_cte_aquaviario_balsa_ID_not_null" NOT NULL,
    id_cte_aquaviario numeric(10,0) CONSTRAINT "fisc_cte_aquaviario_balsa_ID_CTE_AQUAVIARIO_not_null" NOT NULL,
    id_balsa character varying(60) DEFAULT NULL::character varying,
    numero_viagem numeric(10,0) DEFAULT NULL::numeric,
    direcao character(1) DEFAULT NULL::bpchar,
    porto_embarque character varying(60) DEFAULT NULL::character varying,
    porto_transbordo character varying(60) DEFAULT NULL::character varying,
    porto_destino character varying(60) DEFAULT NULL::character varying,
    tipo_navegacao character(1) DEFAULT NULL::bpchar,
    irin character varying(10) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_aquaviario_balsa_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_aquaviario_balsa OWNER TO postgres;

--
-- TOC entry 381 (class 1259 OID 21320)
-- Name: seq_fisc_cte_cabecalho; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_cabecalho
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_cabecalho OWNER TO postgres;

--
-- TOC entry 382 (class 1259 OID 21321)
-- Name: fisc_cte_cabecalho; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_cabecalho (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_cabecalho'::regclass) CONSTRAINT "fisc_cte_cabecalho_ID_not_null" NOT NULL,
    uf_emitente numeric(10,0) DEFAULT NULL::numeric,
    codigo_numerico character varying(8) DEFAULT NULL::character varying,
    cfop numeric(10,0) DEFAULT NULL::numeric,
    natureza_operacao character varying(60) DEFAULT NULL::character varying,
    forma_pagamento character(1) DEFAULT NULL::bpchar,
    modelo character(2) DEFAULT NULL::bpchar,
    serie character(3) DEFAULT NULL::bpchar,
    numero character varying(9) DEFAULT NULL::character varying,
    data_hora_emissao timestamp without time zone,
    formato_impressao_dacte character(1) DEFAULT NULL::bpchar,
    tipo_emissao character(1) DEFAULT NULL::bpchar,
    chave_acesso character varying(44) DEFAULT NULL::character varying,
    digito_chave_acesso character(1) DEFAULT NULL::bpchar,
    ambiente character(1) DEFAULT NULL::bpchar,
    tipo_cte character(1) DEFAULT NULL::bpchar,
    processo_emissao character(1) DEFAULT NULL::bpchar,
    versao_processo_emissao character varying(20) DEFAULT NULL::character varying,
    chave_referenciado character varying(44) DEFAULT NULL::character varying,
    codigo_municipio_envio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio_envio character varying(60) DEFAULT NULL::character varying,
    uf_envio character(2) DEFAULT NULL::bpchar,
    modal character(2) DEFAULT NULL::bpchar,
    tipo_servico character(1) DEFAULT NULL::bpchar,
    codigo_municipio_ini_prestacao numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio_ini_prestacao character varying(60) DEFAULT NULL::character varying,
    uf_ini_prestacao character(2) DEFAULT NULL::bpchar,
    codigo_municipio_fim_prestacao numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio_fim_prestacao character varying(60) DEFAULT NULL::character varying,
    uf_fim_prestacao character(2) DEFAULT NULL::bpchar,
    retira character(1) DEFAULT NULL::bpchar,
    retira_detalhe character varying(160) DEFAULT NULL::character varying,
    tomador character(1) DEFAULT NULL::bpchar,
    data_entrada_contingencia timestamp without time zone,
    justificativa_contingencia character varying(255) DEFAULT NULL::character varying,
    carac_adicional_transporte character varying(15) DEFAULT NULL::character varying,
    carac_adicional_servico character varying(30) DEFAULT NULL::character varying,
    funcionario_emissor character varying(20) DEFAULT NULL::character varying,
    fluxo_origem character varying(15) DEFAULT NULL::character varying,
    entrega_tipo_periodo character(1) DEFAULT NULL::bpchar,
    entrega_data_programada date,
    entrega_data_inicial date,
    entrega_data_final date,
    entrega_tipo_hora character(1) DEFAULT NULL::bpchar,
    entrega_hora_programada character varying(8) DEFAULT NULL::character varying,
    entrega_hora_inicial character varying(8) DEFAULT NULL::character varying,
    entrega_hora_final character varying(8) DEFAULT NULL::character varying,
    municipio_origem_calculo character varying(40) DEFAULT NULL::character varying,
    municipio_destino_calculo character varying(40) DEFAULT NULL::character varying,
    observacoes_gerais text,
    valor_total_servico numeric(18,6) DEFAULT NULL::numeric,
    valor_receber numeric(18,6) DEFAULT NULL::numeric,
    cst character(2) DEFAULT NULL::bpchar,
    base_calculo_icms numeric(18,6) DEFAULT NULL::numeric,
    aliquota_icms numeric(18,6) DEFAULT NULL::numeric,
    valor_icms numeric(18,6) DEFAULT NULL::numeric,
    percentual_reducao_bc_icms numeric(18,6) DEFAULT NULL::numeric,
    valor_bc_icms_st_retido numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_st_retido numeric(18,6) DEFAULT NULL::numeric,
    aliquota_icms_st_retido numeric(18,6) DEFAULT NULL::numeric,
    valor_credito_presumido_icms numeric(18,6) DEFAULT NULL::numeric,
    percentual_bc_icms_outra_uf numeric(18,6) DEFAULT NULL::numeric,
    valor_bc_icms_outra_uf numeric(18,6) DEFAULT NULL::numeric,
    aliquota_icms_outra_uf numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_outra_uf numeric(18,6) DEFAULT NULL::numeric,
    simples_nacional_indicador character(1) DEFAULT NULL::bpchar,
    simples_nacional_total numeric(18,6) DEFAULT NULL::numeric,
    informacoes_add_fisco text,
    valor_total_carga numeric(18,6) DEFAULT NULL::numeric,
    produto_predominante character varying(60) DEFAULT NULL::character varying,
    carga_outras_caracteristicas character varying(30) DEFAULT NULL::character varying,
    modal_versao_layout numeric(10,0) DEFAULT NULL::numeric,
    chave_cte_substituido character varying(44) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_cabecalho_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_cabecalho OWNER TO postgres;

--
-- TOC entry 389 (class 1259 OID 21471)
-- Name: seq_fisc_cte_carga; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_carga
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_carga OWNER TO postgres;

--
-- TOC entry 390 (class 1259 OID 21472)
-- Name: fisc_cte_carga; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_carga (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_carga'::regclass) CONSTRAINT "fisc_cte_carga_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_carga_ID_CTE_CABECALHO_not_null" NOT NULL,
    codigo_unidade_medida character(2) DEFAULT NULL::bpchar,
    tipo_medida character varying(20) DEFAULT NULL::character varying,
    quantidade numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_carga_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_carga OWNER TO postgres;

--
-- TOC entry 391 (class 1259 OID 21491)
-- Name: seq_fisc_cte_componente; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_componente
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_componente OWNER TO postgres;

--
-- TOC entry 392 (class 1259 OID 21492)
-- Name: fisc_cte_componente; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_componente (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_componente'::regclass) CONSTRAINT "fisc_cte_componente_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_componente_ID_CTE_CABECALHO_not_null" NOT NULL,
    nome character varying(15) DEFAULT NULL::character varying,
    valor numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_componente_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_componente OWNER TO postgres;

--
-- TOC entry 393 (class 1259 OID 21510)
-- Name: seq_fisc_cte_destinatario; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_destinatario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_destinatario OWNER TO postgres;

--
-- TOC entry 394 (class 1259 OID 21511)
-- Name: fisc_cte_destinatario; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_destinatario (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_destinatario'::regclass) CONSTRAINT "fisc_cte_destinatario_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_destinatario_ID_CTE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    ie character varying(20) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    fantasia character varying(60) DEFAULT NULL::character varying,
    telefone character varying(14) DEFAULT NULL::character varying,
    logradouro character varying(250) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    codigo_pais numeric(11,0) DEFAULT NULL::numeric,
    nome_pais character varying(60) DEFAULT NULL::character varying,
    email character varying(60) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_destinatario_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30),
    id_pessoa numeric(10,0)
);


ALTER TABLE sagnus.fisc_cte_destinatario OWNER TO postgres;

--
-- TOC entry 395 (class 1259 OID 21546)
-- Name: seq_fisc_cte_documento_anterior; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_documento_anterior
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_documento_anterior OWNER TO postgres;

--
-- TOC entry 396 (class 1259 OID 21547)
-- Name: fisc_cte_documento_anterior; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_documento_anterior (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_documento_anterior'::regclass) CONSTRAINT "fisc_cte_documento_anterior_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_documento_anterior_ID_CTE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    ie character varying(20) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    nome character varying(60) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_documento_anterior_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_documento_anterior OWNER TO postgres;

--
-- TOC entry 397 (class 1259 OID 21568)
-- Name: seq_fisc_cte_documento_anterior_id; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_documento_anterior_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_documento_anterior_id OWNER TO postgres;

--
-- TOC entry 398 (class 1259 OID 21569)
-- Name: fisc_cte_documento_anterior_id; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_documento_anterior_id (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_documento_anterior_id'::regclass) CONSTRAINT "fisc_cte_documento_anterior_id_ID_not_null" NOT NULL,
    id_cte_documento_anterior numeric(10,0) CONSTRAINT "fisc_cte_documento_anterior__ID_CTE_DOCUMENTO_ANTERIOR_not_null" NOT NULL,
    tipo character(2) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_documento_anterior_id_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_documento_anterior_id OWNER TO postgres;

--
-- TOC entry 399 (class 1259 OID 21580)
-- Name: seq_fisc_cte_duplicata; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_duplicata
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_duplicata OWNER TO postgres;

--
-- TOC entry 400 (class 1259 OID 21581)
-- Name: fisc_cte_duplicata; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_duplicata (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_duplicata'::regclass) CONSTRAINT "fisc_cte_duplicata_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_duplicata_ID_CTE_CABECALHO_not_null" NOT NULL,
    numero character varying(60) DEFAULT NULL::character varying,
    data_vencimento date,
    valor numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_duplicata_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_duplicata OWNER TO postgres;

--
-- TOC entry 401 (class 1259 OID 21599)
-- Name: seq_fisc_cte_dutoviario; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_dutoviario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_dutoviario OWNER TO postgres;

--
-- TOC entry 402 (class 1259 OID 21600)
-- Name: fisc_cte_dutoviario; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_dutoviario (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_dutoviario'::regclass) CONSTRAINT "fisc_cte_dutoviario_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_dutoviario_ID_CTE_CABECALHO_not_null" NOT NULL,
    valor_tarifa numeric(18,6) DEFAULT NULL::numeric,
    data_inicio date,
    data_fim date,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_dutoviario_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_dutoviario OWNER TO postgres;

--
-- TOC entry 403 (class 1259 OID 21617)
-- Name: seq_fisc_cte_emitente; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_emitente
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_emitente OWNER TO postgres;

--
-- TOC entry 404 (class 1259 OID 21618)
-- Name: fisc_cte_emitente; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_emitente (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_emitente'::regclass) CONSTRAINT "fisc_cte_emitente_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_emitente_ID_CTE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    ie character varying(14) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    fantasia character varying(60) DEFAULT NULL::character varying,
    logradouro character varying(60) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    telefone character varying(14) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_emitente_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30),
    id_pessoa numeric(10,0)
);


ALTER TABLE sagnus.fisc_cte_emitente OWNER TO postgres;

--
-- TOC entry 405 (class 1259 OID 21649)
-- Name: seq_fisc_cte_expedidor; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_expedidor
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_expedidor OWNER TO postgres;

--
-- TOC entry 406 (class 1259 OID 21650)
-- Name: fisc_cte_expedidor; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_expedidor (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_expedidor'::regclass) CONSTRAINT "fisc_cte_expedidor_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_expedidor_ID_CTE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    ie character varying(20) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    fantasia character varying(60) DEFAULT NULL::character varying,
    telefone character varying(14) DEFAULT NULL::character varying,
    logradouro character varying(250) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    codigo_pais numeric(11,0) DEFAULT NULL::numeric,
    nome_pais character varying(60) DEFAULT NULL::character varying,
    email character varying(60) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_expedidor_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30),
    id_pessoa numeric(10,0)
);


ALTER TABLE sagnus.fisc_cte_expedidor OWNER TO postgres;

--
-- TOC entry 407 (class 1259 OID 21685)
-- Name: seq_fisc_cte_fatura; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_fatura
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_fatura OWNER TO postgres;

--
-- TOC entry 408 (class 1259 OID 21686)
-- Name: fisc_cte_fatura; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_fatura (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_fatura'::regclass) CONSTRAINT "fisc_cte_fatura_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_fatura_ID_CTE_CABECALHO_not_null" NOT NULL,
    numero character varying(60) DEFAULT NULL::character varying,
    valor_original numeric(18,6) DEFAULT NULL::numeric,
    valor_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_liquido numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_fatura_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_fatura OWNER TO postgres;

--
-- TOC entry 409 (class 1259 OID 21706)
-- Name: seq_fisc_cte_ferroviario; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_ferroviario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_ferroviario OWNER TO postgres;

--
-- TOC entry 410 (class 1259 OID 21707)
-- Name: fisc_cte_ferroviario; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_ferroviario (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_ferroviario'::regclass) CONSTRAINT "fisc_cte_ferroviario_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_ferroviario_ID_CTE_CABECALHO_not_null" NOT NULL,
    tipo_trafego character(1) DEFAULT NULL::bpchar,
    responsavel_faturamento character(1) DEFAULT NULL::bpchar,
    ferrovia_emitente_cte character(1) DEFAULT NULL::bpchar,
    fluxo character varying(10) DEFAULT NULL::character varying,
    id_trem character varying(7) DEFAULT NULL::character varying,
    valor_frete numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_ferroviario_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_ferroviario OWNER TO postgres;

--
-- TOC entry 411 (class 1259 OID 21729)
-- Name: seq_fisc_cte_ferroviario_ferrovia; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_ferroviario_ferrovia
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_ferroviario_ferrovia OWNER TO postgres;

--
-- TOC entry 412 (class 1259 OID 21730)
-- Name: fisc_cte_ferroviario_ferrovia; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_ferroviario_ferrovia (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_ferroviario_ferrovia'::regclass) CONSTRAINT "fisc_cte_ferroviario_ferrovia_ID_not_null" NOT NULL,
    id_cte_ferroviario numeric(10,0) CONSTRAINT "fisc_cte_ferroviario_ferrovia_ID_CTE_FERROVIARIO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    codigo_interno character varying(10) DEFAULT NULL::character varying,
    ie character varying(20) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    logradouro character varying(250) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_ferroviario_ferrovia_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_ferroviario_ferrovia OWNER TO postgres;

--
-- TOC entry 413 (class 1259 OID 21760)
-- Name: seq_fisc_cte_ferroviario_vagao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_ferroviario_vagao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_ferroviario_vagao OWNER TO postgres;

--
-- TOC entry 414 (class 1259 OID 21761)
-- Name: fisc_cte_ferroviario_vagao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_ferroviario_vagao (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_ferroviario_vagao'::regclass) CONSTRAINT "fisc_cte_ferroviario_vagao_ID_not_null" NOT NULL,
    id_cte_ferroviario numeric(10,0) CONSTRAINT "fisc_cte_ferroviario_vagao_ID_CTE_FERROVIARIO_not_null" NOT NULL,
    numero_vagao numeric(10,0) DEFAULT NULL::numeric,
    capacidade numeric(18,6) DEFAULT NULL::numeric,
    tipo_vagao character(3) DEFAULT NULL::bpchar,
    peso_real numeric(18,6) DEFAULT NULL::numeric,
    peso_bc numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_ferroviario_vagao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_ferroviario_vagao OWNER TO postgres;

--
-- TOC entry 421 (class 1259 OID 21856)
-- Name: seq_fisc_cte_inf_nf_carga_lacre; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_inf_nf_carga_lacre
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_inf_nf_carga_lacre OWNER TO postgres;

--
-- TOC entry 422 (class 1259 OID 21857)
-- Name: fisc_cte_inf_nf_carga_lacre; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_inf_nf_carga_lacre (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_inf_nf_carga_lacre'::regclass) CONSTRAINT "fisc_cte_inf_nf_carga_lacre_ID_not_null" NOT NULL,
    id_cte_informacao_nf_carga numeric(10,0) CONSTRAINT "fisc_cte_inf_nf_carga_lacre_ID_CTE_INFORMACAO_NF_CARGA_not_null" NOT NULL,
    numero character varying(20) DEFAULT NULL::character varying,
    quantidade_rateada numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_inf_nf_carga_lacre_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_inf_nf_carga_lacre OWNER TO postgres;

--
-- TOC entry 423 (class 1259 OID 21875)
-- Name: seq_fisc_cte_inf_nf_transporte_lacre; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_inf_nf_transporte_lacre
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_inf_nf_transporte_lacre OWNER TO postgres;

--
-- TOC entry 424 (class 1259 OID 21876)
-- Name: fisc_cte_inf_nf_transporte_lacre; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_inf_nf_transporte_lacre (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_inf_nf_transporte_lacre'::regclass) CONSTRAINT "fisc_cte_inf_nf_transporte_lacre_ID_not_null" NOT NULL,
    id_cte_informacao_nf_transporte numeric(10,0) CONSTRAINT "fisc_cte_inf_nf_transporte__ID_CTE_INFORMACAO_NF_TRANS_not_null" NOT NULL,
    numero character varying(20) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_inf_nf_transporte_lacre_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_inf_nf_transporte_lacre OWNER TO postgres;

--
-- TOC entry 419 (class 1259 OID 21837)
-- Name: seq_fisc_cte_informacao_nf_carga; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_informacao_nf_carga
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_informacao_nf_carga OWNER TO postgres;

--
-- TOC entry 420 (class 1259 OID 21838)
-- Name: fisc_cte_informacao_nf_carga; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_informacao_nf_carga (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_informacao_nf_carga'::regclass) CONSTRAINT "fisc_cte_informacao_nf_carga_ID_not_null" NOT NULL,
    id_cte_informacao_nf numeric(10,0) CONSTRAINT "fisc_cte_informacao_nf_carga_ID_CTE_INFORMACAO_NF_not_null" NOT NULL,
    tipo_unidade_carga character(1) DEFAULT NULL::bpchar,
    id_unidade_carga character varying(20) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_informacao_nf_carga_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_informacao_nf_carga OWNER TO postgres;

--
-- TOC entry 415 (class 1259 OID 21782)
-- Name: seq_fisc_cte_informacao_nf_outros; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_informacao_nf_outros
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_informacao_nf_outros OWNER TO postgres;

--
-- TOC entry 416 (class 1259 OID 21783)
-- Name: fisc_cte_informacao_nf_outros; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_informacao_nf_outros (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_informacao_nf_outros'::regclass) CONSTRAINT "fisc_cte_informacao_nf_outros_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_informacao_nf_outros_ID_CTE_CABECALHO_not_null" NOT NULL,
    numero_romaneio character varying(20) DEFAULT NULL::character varying,
    numero_pedido character varying(20) DEFAULT NULL::character varying,
    chave_acesso_nfe character varying(44) DEFAULT NULL::character varying,
    codigo_modelo character(2) DEFAULT NULL::bpchar,
    serie character(3) DEFAULT NULL::bpchar,
    numero character varying(20) DEFAULT NULL::character varying,
    data_emissao date,
    uf_emitente numeric(10,0) DEFAULT NULL::numeric,
    base_calculo_icms numeric(18,6) DEFAULT NULL::numeric,
    valor_icms numeric(18,6) DEFAULT NULL::numeric,
    base_calculo_icms_st numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_st numeric(18,6) DEFAULT NULL::numeric,
    valor_total_produtos numeric(18,6) DEFAULT NULL::numeric,
    valor_total numeric(18,6) DEFAULT NULL::numeric,
    cfop_predominante numeric(10,0) DEFAULT NULL::numeric,
    peso_total_kg numeric(18,6) DEFAULT NULL::numeric,
    pin_suframa numeric(10,0) DEFAULT NULL::numeric,
    data_prevista_entrega date,
    outro_tipo_doc_orig character(2) DEFAULT NULL::bpchar,
    outro_descricao character varying(100) DEFAULT NULL::character varying,
    outro_valor_documento numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_informacao_nf_outros_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_informacao_nf_outros OWNER TO postgres;

--
-- TOC entry 417 (class 1259 OID 21818)
-- Name: seq_fisc_cte_informacao_nf_transporte; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_informacao_nf_transporte
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_informacao_nf_transporte OWNER TO postgres;

--
-- TOC entry 418 (class 1259 OID 21819)
-- Name: fisc_cte_informacao_nf_transporte; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_informacao_nf_transporte (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_informacao_nf_transporte'::regclass) CONSTRAINT "fisc_cte_informacao_nf_transporte_ID_not_null" NOT NULL,
    id_cte_informacao_nf numeric(10,0) CONSTRAINT "fisc_cte_informacao_nf_transporte_ID_CTE_INFORMACAO_NF_not_null" NOT NULL,
    tipo_unidade_transporte character(1) DEFAULT NULL::bpchar,
    id_unidade_transporte character varying(20) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_informacao_nf_transporte_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_informacao_nf_transporte OWNER TO postgres;

--
-- TOC entry 425 (class 1259 OID 21893)
-- Name: seq_fisc_cte_local_coleta; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_local_coleta
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_local_coleta OWNER TO postgres;

--
-- TOC entry 426 (class 1259 OID 21894)
-- Name: fisc_cte_local_coleta; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_local_coleta (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_local_coleta'::regclass) CONSTRAINT "fisc_cte_local_coleta_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_local_coleta_ID_CTE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    logradouro character varying(250) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_local_coleta_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30),
    id_pessoa numeric(10,0)
);


ALTER TABLE sagnus.fisc_cte_local_coleta OWNER TO postgres;

--
-- TOC entry 427 (class 1259 OID 21922)
-- Name: seq_fisc_cte_local_entrega; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_local_entrega
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_local_entrega OWNER TO postgres;

--
-- TOC entry 428 (class 1259 OID 21923)
-- Name: fisc_cte_local_entrega; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_local_entrega (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_local_entrega'::regclass) CONSTRAINT "fisc_cte_local_entrega_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_local_entrega_ID_CTE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    logradouro character varying(250) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_local_entrega_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30),
    id_pessoa numeric(10,0)
);


ALTER TABLE sagnus.fisc_cte_local_entrega OWNER TO postgres;

--
-- TOC entry 429 (class 1259 OID 21951)
-- Name: seq_fisc_cte_multimodal; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_multimodal
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_multimodal OWNER TO postgres;

--
-- TOC entry 430 (class 1259 OID 21952)
-- Name: fisc_cte_multimodal; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_multimodal (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_multimodal'::regclass) CONSTRAINT "fisc_cte_multimodal_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_multimodal_ID_CTE_CABECALHO_not_null" NOT NULL,
    cotm character varying(20) DEFAULT NULL::character varying,
    indicador_negociavel character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_multimodal_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_multimodal OWNER TO postgres;

--
-- TOC entry 431 (class 1259 OID 21970)
-- Name: seq_fisc_cte_passagem; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_passagem
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_passagem OWNER TO postgres;

--
-- TOC entry 432 (class 1259 OID 21971)
-- Name: fisc_cte_passagem; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_passagem (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_passagem'::regclass) CONSTRAINT "fisc_cte_passagem_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_passagem_ID_CTE_CABECALHO_not_null" NOT NULL,
    sigla_passagem character varying(15) DEFAULT NULL::character varying,
    sigla_destino character varying(15) DEFAULT NULL::character varying,
    rota character varying(10) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_passagem_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_passagem OWNER TO postgres;

--
-- TOC entry 433 (class 1259 OID 21990)
-- Name: seq_fisc_cte_perigoso; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_perigoso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_perigoso OWNER TO postgres;

--
-- TOC entry 434 (class 1259 OID 21991)
-- Name: fisc_cte_perigoso; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_perigoso (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_perigoso'::regclass) CONSTRAINT "fisc_cte_perigoso_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_perigoso_ID_CTE_CABECALHO_not_null" NOT NULL,
    numero_onu character varying(4) DEFAULT NULL::character varying,
    nome_apropriado character varying(150) DEFAULT NULL::character varying,
    classe_risco character varying(40) DEFAULT NULL::character varying,
    grupo_embalagem character varying(6) DEFAULT NULL::character varying,
    quantidade_total_produto character varying(20) DEFAULT NULL::character varying,
    quantidade_tipo_volume character varying(60) DEFAULT NULL::character varying,
    ponto_fulgor character varying(6) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_perigoso_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_perigoso OWNER TO postgres;

--
-- TOC entry 435 (class 1259 OID 22014)
-- Name: seq_fisc_cte_recebedor; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_recebedor
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_recebedor OWNER TO postgres;

--
-- TOC entry 436 (class 1259 OID 22015)
-- Name: fisc_cte_recebedor; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_recebedor (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_recebedor'::regclass) CONSTRAINT "fisc_cte_recebedor_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_recebedor_ID_CTE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    ie character varying(20) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    fantasia character varying(60) DEFAULT NULL::character varying,
    telefone character varying(14) DEFAULT NULL::character varying,
    logradouro character varying(250) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    codigo_pais numeric(11,0) DEFAULT NULL::numeric,
    nome_pais character varying(60) DEFAULT NULL::character varying,
    email character varying(60) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_recebedor_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30),
    id_pessoa numeric(10,0)
);


ALTER TABLE sagnus.fisc_cte_recebedor OWNER TO postgres;

--
-- TOC entry 437 (class 1259 OID 22050)
-- Name: seq_fisc_cte_remetente; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_remetente
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_remetente OWNER TO postgres;

--
-- TOC entry 438 (class 1259 OID 22051)
-- Name: fisc_cte_remetente; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_remetente (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_remetente'::regclass) CONSTRAINT "fisc_cte_remetente_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_remetente_ID_CTE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    ie character varying(20) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    fantasia character varying(60) DEFAULT NULL::character varying,
    telefone character varying(14) DEFAULT NULL::character varying,
    logradouro character varying(250) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    codigo_pais numeric(11,0) DEFAULT NULL::numeric,
    nome_pais character varying(60) DEFAULT NULL::character varying,
    email character varying(60) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_remetente_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30),
    id_pessoa numeric(10,0)
);


ALTER TABLE sagnus.fisc_cte_remetente OWNER TO postgres;

--
-- TOC entry 439 (class 1259 OID 22086)
-- Name: seq_fisc_cte_rodoviario; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_rodoviario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_rodoviario OWNER TO postgres;

--
-- TOC entry 440 (class 1259 OID 22087)
-- Name: fisc_cte_rodoviario; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_rodoviario (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_rodoviario'::regclass) CONSTRAINT "fisc_cte_rodoviario_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_rodoviario_ID_CTE_CABECALHO_not_null" NOT NULL,
    rntrc character varying(8) DEFAULT NULL::character varying,
    data_prevista_entrega date,
    indicador_lotacao character(1) DEFAULT NULL::bpchar,
    ciot numeric(10,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_rodoviario_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_rodoviario OWNER TO postgres;

--
-- TOC entry 441 (class 1259 OID 22106)
-- Name: seq_fisc_cte_rodoviario_lacre; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_rodoviario_lacre
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_rodoviario_lacre OWNER TO postgres;

--
-- TOC entry 442 (class 1259 OID 22107)
-- Name: fisc_cte_rodoviario_lacre; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_rodoviario_lacre (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_rodoviario_lacre'::regclass) CONSTRAINT "fisc_cte_rodoviario_lacre_ID_not_null" NOT NULL,
    id_cte_rodoviario numeric(10,0) CONSTRAINT "fisc_cte_rodoviario_lacre_ID_CTE_RODOVIARIO_not_null" NOT NULL,
    numero character varying(20) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_rodoviario_lacre_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_rodoviario_lacre OWNER TO postgres;

--
-- TOC entry 443 (class 1259 OID 22124)
-- Name: seq_fisc_cte_rodoviario_motorista; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_rodoviario_motorista
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_rodoviario_motorista OWNER TO postgres;

--
-- TOC entry 444 (class 1259 OID 22125)
-- Name: fisc_cte_rodoviario_motorista; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_rodoviario_motorista (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_rodoviario_motorista'::regclass) CONSTRAINT "fisc_cte_rodoviario_motorista_ID_not_null" NOT NULL,
    id_cte_rodoviario numeric(10,0) CONSTRAINT "fisc_cte_rodoviario_motorista_ID_CTE_RODOVIARIO_not_null" NOT NULL,
    nome character varying(60) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_rodoviario_motorista_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_rodoviario_motorista OWNER TO postgres;

--
-- TOC entry 445 (class 1259 OID 22143)
-- Name: seq_fisc_cte_rodoviario_occ; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_rodoviario_occ
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_rodoviario_occ OWNER TO postgres;

--
-- TOC entry 446 (class 1259 OID 22144)
-- Name: fisc_cte_rodoviario_occ; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_rodoviario_occ (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_rodoviario_occ'::regclass) CONSTRAINT "fisc_cte_rodoviario_occ_ID_not_null" NOT NULL,
    id_cte_rodoviario numeric(10,0) CONSTRAINT "fisc_cte_rodoviario_occ_ID_CTE_RODOVIARIO_not_null" NOT NULL,
    serie character(3) DEFAULT NULL::bpchar,
    numero numeric(10,0) DEFAULT NULL::numeric,
    data_emissao date,
    cnpj character varying(14) DEFAULT NULL::character varying,
    codigo_interno character varying(10) DEFAULT NULL::character varying,
    ie character varying(14) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    telefone character varying(14) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_rodoviario_occ_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_rodoviario_occ OWNER TO postgres;

--
-- TOC entry 447 (class 1259 OID 22167)
-- Name: seq_fisc_cte_rodoviario_pedagio; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_rodoviario_pedagio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_rodoviario_pedagio OWNER TO postgres;

--
-- TOC entry 448 (class 1259 OID 22168)
-- Name: fisc_cte_rodoviario_pedagio; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_rodoviario_pedagio (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_rodoviario_pedagio'::regclass) CONSTRAINT "fisc_cte_rodoviario_pedagio_ID_not_null" NOT NULL,
    id_cte_rodoviario numeric(10,0) CONSTRAINT "fisc_cte_rodoviario_pedagio_ID_CTE_RODOVIARIO_not_null" NOT NULL,
    cnpj_fornecedor character varying(14) DEFAULT NULL::character varying,
    comprovante_compra character varying(20) DEFAULT NULL::character varying,
    cnpj_responsavel character varying(14) DEFAULT NULL::character varying,
    valor numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_rodoviario_pedagio_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_rodoviario_pedagio OWNER TO postgres;

--
-- TOC entry 449 (class 1259 OID 22188)
-- Name: seq_fisc_cte_rodoviario_veiculo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_rodoviario_veiculo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_rodoviario_veiculo OWNER TO postgres;

--
-- TOC entry 450 (class 1259 OID 22189)
-- Name: fisc_cte_rodoviario_veiculo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_rodoviario_veiculo (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_rodoviario_veiculo'::regclass) CONSTRAINT "fisc_cte_rodoviario_veiculo_ID_not_null" NOT NULL,
    id_cte_rodoviario numeric(10,0) CONSTRAINT "fisc_cte_rodoviario_veiculo_ID_CTE_RODOVIARIO_not_null" NOT NULL,
    codigo_interno character varying(10) DEFAULT NULL::character varying,
    renavam character varying(11) DEFAULT NULL::character varying,
    placa character varying(7) DEFAULT NULL::character varying,
    tara numeric(10,0) DEFAULT NULL::numeric,
    capacidade_kg numeric(10,0) DEFAULT NULL::numeric,
    capacidade_m3 numeric(10,0) DEFAULT NULL::numeric,
    tipo_propriedade character(1) DEFAULT NULL::bpchar,
    tipo_veiculo character(1) DEFAULT NULL::bpchar,
    tipo_rodado character(2) DEFAULT NULL::bpchar,
    tipo_carroceria character(2) DEFAULT NULL::bpchar,
    uf character(2) DEFAULT NULL::bpchar,
    proprietario_cpf character varying(11) DEFAULT NULL::character varying,
    proprietario_cnpj character varying(14) DEFAULT NULL::character varying,
    proprietario_rntrc character varying(8) DEFAULT NULL::character varying,
    proprietario_nome character varying(60) DEFAULT NULL::character varying,
    proprietario_ie character varying(14) DEFAULT NULL::character varying,
    proprietario_uf character(2) DEFAULT NULL::bpchar,
    proprietario_tipo character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_rodoviario_veiculo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_rodoviario_veiculo OWNER TO postgres;

--
-- TOC entry 451 (class 1259 OID 22223)
-- Name: seq_fisc_cte_seguro; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_seguro
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_seguro OWNER TO postgres;

--
-- TOC entry 452 (class 1259 OID 22224)
-- Name: fisc_cte_seguro; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_seguro (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_seguro'::regclass) CONSTRAINT "fisc_cte_seguro_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_seguro_ID_CTE_CABECALHO_not_null" NOT NULL,
    responsavel character(1) DEFAULT NULL::bpchar,
    seguradora character varying(30) DEFAULT NULL::character varying,
    apolice character varying(20) DEFAULT NULL::character varying,
    averbacao character varying(20) DEFAULT NULL::character varying,
    valor_carga numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_seguro_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_seguro OWNER TO postgres;

--
-- TOC entry 453 (class 1259 OID 22245)
-- Name: seq_fisc_cte_tomador; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_tomador
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_tomador OWNER TO postgres;

--
-- TOC entry 454 (class 1259 OID 22246)
-- Name: fisc_cte_tomador; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_tomador (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_tomador'::regclass) CONSTRAINT "fisc_cte_tomador_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_tomador_ID_CTE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    ie character varying(14) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    fantasia character varying(60) DEFAULT NULL::character varying,
    telefone character varying(14) DEFAULT NULL::character varying,
    logradouro character varying(255) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    codigo_pais numeric(11,0) DEFAULT NULL::numeric,
    nome_pais character varying(60) DEFAULT NULL::character varying,
    email character varying(60) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_tomador_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30),
    id_pessoa numeric(10,0)
);


ALTER TABLE sagnus.fisc_cte_tomador OWNER TO postgres;

--
-- TOC entry 455 (class 1259 OID 22281)
-- Name: seq_fisc_cte_veiculo_novo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_cte_veiculo_novo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_cte_veiculo_novo OWNER TO postgres;

--
-- TOC entry 456 (class 1259 OID 22282)
-- Name: fisc_cte_veiculo_novo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_cte_veiculo_novo (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_cte_veiculo_novo'::regclass) CONSTRAINT "fisc_cte_veiculo_novo_ID_not_null" NOT NULL,
    id_cte_cabecalho numeric(10,0) CONSTRAINT "fisc_cte_veiculo_novo_ID_CTE_CABECALHO_not_null" NOT NULL,
    chassi character varying(17) DEFAULT NULL::character varying,
    cor character varying(4) DEFAULT NULL::character varying,
    descricao_cor character varying(40) DEFAULT NULL::character varying,
    codigo_marca_modelo character varying(6) DEFAULT NULL::character varying,
    valor_unitario numeric(18,6) DEFAULT NULL::numeric,
    valor_frete numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_cte_veiculo_novo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_cte_veiculo_novo OWNER TO postgres;

--
-- TOC entry 599 (class 1259 OID 25337)
-- Name: seq_fisc_ecf_aliquotas; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_ecf_aliquotas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_ecf_aliquotas OWNER TO postgres;

--
-- TOC entry 613 (class 1259 OID 25445)
-- Name: fisc_ecf_aliquotas; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_ecf_aliquotas (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_ecf_aliquotas'::regclass) CONSTRAINT "fisc_ecf_aliquotas_ID_not_null" NOT NULL,
    totalizador_parcial character varying(10) DEFAULT NULL::character varying,
    ecf_icms_st character varying(4) DEFAULT NULL::character varying,
    paf_p_st character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_ecf_aliquotas_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_ecf_aliquotas OWNER TO postgres;

--
-- TOC entry 601 (class 1259 OID 25339)
-- Name: seq_fisc_municipal_regime; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_municipal_regime
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_municipal_regime OWNER TO postgres;

--
-- TOC entry 615 (class 1259 OID 25468)
-- Name: fisc_municipal_regime; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_municipal_regime (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_municipal_regime'::regclass) CONSTRAINT "fisc_municipal_regime_ID_not_null" NOT NULL,
    uf character(2) DEFAULT NULL::bpchar,
    codigo character varying(20) DEFAULT NULL::character varying,
    nome character varying(50) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_municipal_regime_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_municipal_regime OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 19559)
-- Name: seq_fisc_nfe; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 19560)
-- Name: fisc_nfe; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe'::regclass) CONSTRAINT "fisc_nfe_cabecalho_ID_not_null" NOT NULL,
    id_vendedor numeric(11,0) DEFAULT NULL::numeric,
    id_fornecedor numeric(11,0) DEFAULT NULL::numeric,
    id_cliente numeric(11,0) DEFAULT NULL::numeric,
    id_tribut_operacao_fiscal numeric(10,0) DEFAULT NULL::numeric,
    id_venda_cabecalho numeric(10,0) DEFAULT NULL::numeric,
    id_nfce_movimento numeric(10,0) DEFAULT NULL::numeric,
    uf_emitente numeric(10,0) DEFAULT NULL::numeric,
    codigo_numerico character varying(8) DEFAULT NULL::character varying,
    natureza_operacao character varying(60) DEFAULT NULL::character varying,
    codigo_modelo character(2) DEFAULT NULL::bpchar,
    serie character(3) DEFAULT NULL::bpchar,
    numero character varying(9) DEFAULT NULL::character varying,
    data_hora_emissao timestamp without time zone,
    data_hora_entrada_saida timestamp without time zone,
    tipo_operacao character(1) DEFAULT NULL::bpchar,
    local_destino character(1) DEFAULT NULL::bpchar,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    formato_impressao_danfe character(1) DEFAULT NULL::bpchar,
    tipo_emissao character(1) DEFAULT NULL::bpchar,
    chave_acesso character varying(44) DEFAULT NULL::character varying,
    digito_chave_acesso character(1) DEFAULT NULL::bpchar,
    ambiente character(1) DEFAULT NULL::bpchar,
    finalidade_emissao character(1) DEFAULT NULL::bpchar,
    consumidor_operacao character(1) DEFAULT NULL::bpchar,
    consumidor_presenca character(1) DEFAULT NULL::bpchar,
    processo_emissao character(1) DEFAULT NULL::bpchar,
    versao_processo_emissao character varying(20) DEFAULT NULL::character varying,
    data_entrada_contingencia timestamp without time zone,
    justificativa_contingencia character varying(255) DEFAULT NULL::character varying,
    base_calculo_icms numeric(18,6) DEFAULT NULL::numeric,
    valor_icms numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_desonerado numeric(18,6) DEFAULT NULL::numeric,
    total_icms_fcp_uf_destino numeric(18,6) DEFAULT NULL::numeric,
    total_icms_interestadual_uf_destino numeric(18,6) DEFAULT NULL::numeric,
    total_icms_interestadual_uf_remente numeric(18,6) DEFAULT NULL::numeric,
    valor_total_fcp numeric(18,6) DEFAULT NULL::numeric,
    base_calculo_icms_st numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_st numeric(18,6) DEFAULT NULL::numeric,
    valor_total_fcp_st numeric(18,6) DEFAULT NULL::numeric,
    valor_total_fcp_st_retido numeric(18,6) DEFAULT NULL::numeric,
    valor_total_produtos numeric(18,6) DEFAULT NULL::numeric,
    valor_frete numeric(18,6) DEFAULT NULL::numeric,
    valor_seguro numeric(18,6) DEFAULT NULL::numeric,
    valor_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_imposto_importacao numeric(18,6) DEFAULT NULL::numeric,
    valor_ipi numeric(18,6) DEFAULT NULL::numeric,
    valor_ipi_devolvido numeric(18,6) DEFAULT NULL::numeric,
    valor_pis numeric(18,6) DEFAULT NULL::numeric,
    valor_cofins numeric(18,6) DEFAULT NULL::numeric,
    valor_despesas_acessorias numeric(18,6) DEFAULT NULL::numeric,
    valor_total numeric(18,6) DEFAULT NULL::numeric,
    valor_total_tributos numeric(18,6) DEFAULT NULL::numeric,
    valor_servicos numeric(18,6) DEFAULT NULL::numeric,
    base_calculo_issqn numeric(18,6) DEFAULT NULL::numeric,
    valor_issqn numeric(18,6) DEFAULT NULL::numeric,
    valor_pis_issqn numeric(18,6) DEFAULT NULL::numeric,
    valor_cofins_issqn numeric(18,6) DEFAULT NULL::numeric,
    data_prestacao_servico date,
    valor_deducao_issqn numeric(18,6) DEFAULT NULL::numeric,
    outras_retencoes_issqn numeric(18,6) DEFAULT NULL::numeric,
    desconto_incondicionado_issqn numeric(18,6) DEFAULT NULL::numeric,
    desconto_condicionado_issqn numeric(18,6) DEFAULT NULL::numeric,
    total_retencao_issqn numeric(18,6) DEFAULT NULL::numeric,
    regime_especial_tributacao character(1) DEFAULT NULL::bpchar,
    valor_retido_pis numeric(18,6) DEFAULT NULL::numeric,
    valor_retido_cofins numeric(18,6) DEFAULT NULL::numeric,
    valor_retido_csll numeric(18,6) DEFAULT NULL::numeric,
    base_calculo_irrf numeric(18,6) DEFAULT NULL::numeric,
    valor_retido_irrf numeric(18,6) DEFAULT NULL::numeric,
    base_calculo_previdencia numeric(18,6) DEFAULT NULL::numeric,
    valor_retido_previdencia numeric(18,6) DEFAULT NULL::numeric,
    informacoes_add_fisco text,
    informacoes_add_contribuinte text,
    comex_uf_embarque character(2) DEFAULT NULL::bpchar,
    comex_local_embarque character varying(60) DEFAULT NULL::character varying,
    comex_local_despacho character varying(60) DEFAULT NULL::character varying,
    compra_nota_empenho character varying(22) DEFAULT NULL::character varying,
    compra_pedido character varying(60) DEFAULT NULL::character varying,
    compra_contrato character varying(60) DEFAULT NULL::character varying,
    qrcode text,
    url_chave character varying(85) DEFAULT NULL::character varying,
    status_nota character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_cabecalho_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 19540)
-- Name: seq_fisc_nfe_acesso_xml; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_acesso_xml
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_acesso_xml OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 19541)
-- Name: fisc_nfe_acesso_xml; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_acesso_xml (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_acesso_xml'::regclass) CONSTRAINT "fisc_nfe_acesso_xml_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_acesso_xml_ID_NFE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_acesso_xml_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_acesso_xml OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 19652)
-- Name: seq_fisc_nfe_cana; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_cana
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_cana OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 19653)
-- Name: fisc_nfe_cana; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_cana (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_cana'::regclass) CONSTRAINT "fisc_nfe_cana_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_cana_ID_NFE_CABECALHO_not_null" NOT NULL,
    safra character varying(9) DEFAULT NULL::character varying,
    mes_ano_referencia character varying(7) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_cana_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_cana OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 19671)
-- Name: seq_fisc_nfe_cana_deducoes_safra; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_cana_deducoes_safra
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_cana_deducoes_safra OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 19672)
-- Name: fisc_nfe_cana_deducoes_safra; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_cana_deducoes_safra (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_cana_deducoes_safra'::regclass) CONSTRAINT "fisc_nfe_cana_deducoes_safra_ID_not_null" NOT NULL,
    id_nfe_cana numeric(10,0) CONSTRAINT "fisc_nfe_cana_deducoes_safra_ID_NFE_CANA_not_null" NOT NULL,
    decricao character varying(60) DEFAULT NULL::character varying,
    valor_deducao numeric(18,6) DEFAULT NULL::numeric,
    valor_fornecimento numeric(18,6) DEFAULT NULL::numeric,
    valor_total_deducao numeric(18,6) DEFAULT NULL::numeric,
    valor_liquido_fornecimento numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_cana_deducoes_safra_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_cana_deducoes_safra OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 19693)
-- Name: seq_fisc_nfe_cana_fornecimento_diario; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_cana_fornecimento_diario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_cana_fornecimento_diario OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 19694)
-- Name: fisc_nfe_cana_fornecimento_diario; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_cana_fornecimento_diario (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_cana_fornecimento_diario'::regclass) CONSTRAINT "fisc_nfe_cana_fornecimento_diario_ID_not_null" NOT NULL,
    id_nfe_cana numeric(10,0) CONSTRAINT "fisc_nfe_cana_fornecimento_diario_ID_NFE_CANA_not_null" NOT NULL,
    dia character(2) DEFAULT NULL::bpchar,
    quantidade numeric(18,6) DEFAULT NULL::numeric,
    quantidade_total_mes numeric(18,6) DEFAULT NULL::numeric,
    quantidade_total_anterior numeric(18,6) DEFAULT NULL::numeric,
    quantidade_total_geral numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_cana_fornecimento_diario_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_cana_fornecimento_diario OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 19715)
-- Name: seq_fisc_nfe_configuracao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_configuracao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_configuracao OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 19716)
-- Name: fisc_nfe_configuracao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_configuracao (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_configuracao'::regclass) CONSTRAINT "fisc_nfe_configuracao_ID_not_null" NOT NULL,
    certificado_digital_serie character varying(100) DEFAULT NULL::character varying,
    certificado_digital_caminho text,
    certificado_digital_senha character varying(100) DEFAULT NULL::character varying,
    tipo_emissao numeric(10,0) DEFAULT NULL::numeric,
    formato_impressao_danfe numeric(10,0) DEFAULT NULL::numeric,
    processo_emissao numeric(10,0) DEFAULT NULL::numeric,
    versao_processo_emissao character varying(20) DEFAULT NULL::character varying,
    caminho_logomarca text,
    salvar_xml character(1) DEFAULT NULL::bpchar,
    caminho_salvar_xml text,
    caminho_schemas text,
    caminho_arquivo_danfe text,
    caminho_salvar_pdf text,
    webservice_uf character(2) DEFAULT NULL::bpchar,
    webservice_ambiente numeric(10,0) DEFAULT NULL::numeric,
    webservice_proxy_host character varying(100) DEFAULT NULL::character varying,
    webservice_proxy_porta numeric(10,0) DEFAULT NULL::numeric,
    webservice_proxy_usuario character varying(100) DEFAULT NULL::character varying,
    webservice_proxy_senha character varying(100) DEFAULT NULL::character varying,
    webservice_visualizar character(1) DEFAULT NULL::bpchar,
    email_servidor_smtp character varying(100) DEFAULT NULL::character varying,
    email_porta numeric(10,0) DEFAULT NULL::numeric,
    email_usuario character varying(100) DEFAULT NULL::character varying,
    email_senha character varying(100) DEFAULT NULL::character varying,
    email_assunto character varying(100) DEFAULT NULL::character varying,
    email_autentica_ssl character(1) DEFAULT NULL::bpchar,
    email_texto text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_configuracao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_configuracao OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 19747)
-- Name: seq_fisc_nfe_cte_referenciado; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_cte_referenciado
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_cte_referenciado OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 19748)
-- Name: fisc_nfe_cte_referenciado; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_cte_referenciado (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_cte_referenciado'::regclass) CONSTRAINT "fisc_nfe_cte_referenciado_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_cte_referenciado_ID_NFE_CABECALHO_not_null" NOT NULL,
    chave_acesso character varying(44) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_cte_referenciado_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_cte_referenciado OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 19765)
-- Name: seq_fisc_nfe_cupom_fiscal_referenciado; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_cupom_fiscal_referenciado
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_cupom_fiscal_referenciado OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 19766)
-- Name: fisc_nfe_cupom_fiscal_referenciado; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_cupom_fiscal_referenciado (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_cupom_fiscal_referenciado'::regclass) CONSTRAINT "fisc_nfe_cupom_fiscal_referenciado_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_cupom_fiscal_referenciado_ID_NFE_CABECALHO_not_null" NOT NULL,
    modelo_documento_fiscal character(2) DEFAULT NULL::bpchar,
    numero_ordem_ecf numeric(10,0) DEFAULT NULL::numeric,
    coo numeric(10,0) DEFAULT NULL::numeric,
    data_emissao_cupom date,
    numero_caixa numeric(10,0) DEFAULT NULL::numeric,
    numero_serie_ecf character varying(21) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_cupom_fiscal_referenciado_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_cupom_fiscal_referenciado OWNER TO postgres;

--
-- TOC entry 347 (class 1259 OID 20353)
-- Name: seq_fisc_nfe_declaracao_importacao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_declaracao_importacao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_declaracao_importacao OWNER TO postgres;

--
-- TOC entry 348 (class 1259 OID 20354)
-- Name: fisc_nfe_declaracao_importacao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_declaracao_importacao (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_declaracao_importacao'::regclass) CONSTRAINT "fisc_nfe_declaracao_importacao_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_declaracao_importacao_ID_NFE_DETALHE_not_null" NOT NULL,
    numero_documento character varying(12) DEFAULT NULL::character varying,
    data_registro date,
    local_desembaraco character varying(60) DEFAULT NULL::character varying,
    uf_desembaraco character(2) DEFAULT NULL::bpchar,
    data_desembaraco date,
    via_transporte character(1) DEFAULT NULL::bpchar,
    valor_afrmm numeric(18,6) DEFAULT NULL::numeric,
    forma_intermediacao character(1) DEFAULT NULL::bpchar,
    cnpj character varying(14) DEFAULT NULL::character varying,
    uf_terceiro character(2) DEFAULT NULL::bpchar,
    codigo_exportador character varying(60) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_declaracao_importacao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_declaracao_importacao OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 19787)
-- Name: seq_fisc_nfe_destinatario; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_destinatario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_destinatario OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 19788)
-- Name: fisc_nfe_destinatario; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_destinatario (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_destinatario'::regclass) CONSTRAINT "fisc_nfe_destinatario_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_destinatario_ID_NFE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    estrangeiro_identificacao character varying(20) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    logradouro character varying(60) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    codigo_pais numeric(11,0) DEFAULT NULL::numeric,
    nome_pais character varying(60) DEFAULT NULL::character varying,
    telefone character varying(14) DEFAULT NULL::character varying,
    indicador_ie character(1) DEFAULT NULL::bpchar,
    inscricao_estadual character varying(14) DEFAULT NULL::character varying,
    suframa numeric(10,0) DEFAULT NULL::numeric,
    inscricao_municipal character varying(15) DEFAULT NULL::character varying,
    email character varying(60) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_destinatario_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_destinatario OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 19826)
-- Name: seq_fisc_nfe_det_especifico_armamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_det_especifico_armamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_det_especifico_armamento OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 19827)
-- Name: fisc_nfe_det_especifico_armamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_det_especifico_armamento (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_det_especifico_armamento'::regclass) CONSTRAINT "fisc_nfe_det_especifico_armamento_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_det_especifico_armamento_ID_NFE_DETALHE_not_null" NOT NULL,
    tipo_arma character(1) DEFAULT NULL::bpchar,
    numero_serie_arma character varying(15) DEFAULT NULL::character varying,
    numero_serie_cano character varying(15) DEFAULT NULL::character varying,
    descricao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_det_especifico_armamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_det_especifico_armamento OWNER TO postgres;

--
-- TOC entry 313 (class 1259 OID 19847)
-- Name: seq_fisc_nfe_det_especifico_combustivel; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_det_especifico_combustivel
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_det_especifico_combustivel OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 19848)
-- Name: fisc_nfe_det_especifico_combustivel; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_det_especifico_combustivel (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_det_especifico_combustivel'::regclass) CONSTRAINT "fisc_nfe_det_especifico_combustivel_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_det_especifico_combustivel_ID_NFE_DETALHE_not_null" NOT NULL,
    codigo_anp numeric(10,0) DEFAULT NULL::numeric,
    descricao_anp character varying(95) DEFAULT NULL::character varying,
    percentual_glp numeric(18,6) DEFAULT NULL::numeric,
    percentual_gas_nacional numeric(18,6) DEFAULT NULL::numeric,
    percentual_gas_importado numeric(18,6) DEFAULT NULL::numeric,
    valor_partida numeric(18,6) DEFAULT NULL::numeric,
    codif character varying(21) DEFAULT NULL::character varying,
    quantidade_temp_ambiente numeric(18,6) DEFAULT NULL::numeric,
    uf_consumo character(2) DEFAULT NULL::bpchar,
    cide_base_calculo numeric(18,6) DEFAULT NULL::numeric,
    cide_aliquota numeric(18,6) DEFAULT NULL::numeric,
    cide_valor numeric(18,6) DEFAULT NULL::numeric,
    encerrante_bico numeric(11,0) DEFAULT NULL::numeric,
    encerrante_bomba numeric(11,0) DEFAULT NULL::numeric,
    encerrante_tanque numeric(11,0) DEFAULT NULL::numeric,
    encerrante_valor_inicio numeric(18,6) DEFAULT NULL::numeric,
    encerrante_valor_fim numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_det_especifico_combustivel_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_det_especifico_combustivel OWNER TO postgres;

--
-- TOC entry 315 (class 1259 OID 19881)
-- Name: seq_fisc_nfe_det_especifico_medicamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_det_especifico_medicamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_det_especifico_medicamento OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 19882)
-- Name: fisc_nfe_det_especifico_medicamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_det_especifico_medicamento (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_det_especifico_medicamento'::regclass) CONSTRAINT "fisc_nfe_det_especifico_medicamento_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_det_especifico_medicamento_ID_NFE_DETALHE_not_null" NOT NULL,
    codigo_anvisa character varying(13) DEFAULT NULL::character varying,
    motivo_isencao character varying(250) DEFAULT NULL::character varying,
    preco_maximo_consumidor numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_det_especifico_medicamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_det_especifico_medicamento OWNER TO postgres;

--
-- TOC entry 317 (class 1259 OID 19901)
-- Name: seq_fisc_nfe_det_especifico_veiculo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_det_especifico_veiculo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_det_especifico_veiculo OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 19902)
-- Name: fisc_nfe_det_especifico_veiculo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_det_especifico_veiculo (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_det_especifico_veiculo'::regclass) CONSTRAINT "fisc_nfe_det_especifico_veiculo_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_det_especifico_veiculo_ID_NFE_DETALHE_not_null" NOT NULL,
    tipo_operacao character(1) DEFAULT NULL::bpchar,
    chassi character varying(17) DEFAULT NULL::character varying,
    cor character varying(4) DEFAULT NULL::character varying,
    descricao_cor character varying(40) DEFAULT NULL::character varying,
    potencia_motor character varying(4) DEFAULT NULL::character varying,
    cilindradas character varying(4) DEFAULT NULL::character varying,
    peso_liquido character varying(9) DEFAULT NULL::character varying,
    peso_bruto character varying(9) DEFAULT NULL::character varying,
    numero_serie character varying(9) DEFAULT NULL::character varying,
    tipo_combustivel character(2) DEFAULT NULL::bpchar,
    numero_motor character varying(21) DEFAULT NULL::character varying,
    capacidade_maxima_tracao character varying(9) DEFAULT NULL::character varying,
    distancia_eixos character varying(4) DEFAULT NULL::character varying,
    ano_modelo character(4) DEFAULT NULL::bpchar,
    ano_fabricacao character(4) DEFAULT NULL::bpchar,
    tipo_pintura character(1) DEFAULT NULL::bpchar,
    tipo_veiculo character(2) DEFAULT NULL::bpchar,
    especie_veiculo character(1) DEFAULT NULL::bpchar,
    condicao_vin character(1) DEFAULT NULL::bpchar,
    condicao_veiculo character(1) DEFAULT NULL::bpchar,
    codigo_marca_modelo character varying(6) DEFAULT NULL::character varying,
    codigo_cor_denatran character(2) DEFAULT NULL::bpchar,
    lotacao_maxima numeric(10,0) DEFAULT NULL::numeric,
    restricao character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_det_especifico_veiculo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_det_especifico_veiculo OWNER TO postgres;

--
-- TOC entry 319 (class 1259 OID 19942)
-- Name: seq_fisc_nfe_detalhe; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_detalhe
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_detalhe OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 19943)
-- Name: fisc_nfe_detalhe; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_detalhe (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_detalhe'::regclass) CONSTRAINT "fisc_nfe_detalhe_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_detalhe_ID_NFE_CABECALHO_not_null" NOT NULL,
    id_produto numeric(11,0) DEFAULT NULL::numeric,
    numero_item numeric(10,0) DEFAULT NULL::numeric,
    codigo_produto character varying(60) DEFAULT NULL::character varying,
    gtin character varying(14) DEFAULT NULL::character varying,
    nome_produto character varying(120) DEFAULT NULL::character varying,
    ncm character varying(8) DEFAULT NULL::character varying,
    nve character varying(6) DEFAULT NULL::character varying,
    cest character varying(7) DEFAULT NULL::character varying,
    indicador_escala_relevante character(1) DEFAULT NULL::bpchar,
    cnpj_fabricante character varying(14) DEFAULT NULL::character varying,
    codigo_beneficio_fiscal character varying(10) DEFAULT NULL::character varying,
    ex_tipi numeric(10,0) DEFAULT NULL::numeric,
    cfop numeric(10,0) DEFAULT NULL::numeric,
    unidade_comercial character varying(6) DEFAULT NULL::character varying,
    quantidade_comercial numeric(18,6) DEFAULT NULL::numeric,
    numero_pedido_compra character varying(15) DEFAULT NULL::character varying,
    item_pedido_compra numeric(10,0) DEFAULT NULL::numeric,
    numero_fci character varying(36) DEFAULT NULL::character varying,
    numero_recopi character varying(20) DEFAULT NULL::character varying,
    valor_unitario_comercial numeric(18,6) DEFAULT NULL::numeric,
    valor_bruto_produto numeric(18,6) DEFAULT NULL::numeric,
    gtin_unidade_tributavel character varying(14) DEFAULT NULL::character varying,
    unidade_tributavel character varying(6) DEFAULT NULL::character varying,
    quantidade_tributavel numeric(18,6) DEFAULT NULL::numeric,
    valor_unitario_tributavel numeric(18,6) DEFAULT NULL::numeric,
    valor_frete numeric(18,6) DEFAULT NULL::numeric,
    valor_seguro numeric(18,6) DEFAULT NULL::numeric,
    valor_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_outras_despesas numeric(18,6) DEFAULT NULL::numeric,
    entra_total character(1) DEFAULT NULL::bpchar,
    valor_total_tributos numeric(18,6) DEFAULT NULL::numeric,
    percentual_devolvido numeric(18,6) DEFAULT NULL::numeric,
    valor_ipi_devolvido numeric(18,6) DEFAULT NULL::numeric,
    informacoes_adicionais text,
    valor_subtotal numeric(18,6) DEFAULT NULL::numeric,
    valor_total numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_detalhe_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30),
    tributacao_json jsonb
);


ALTER TABLE sagnus.fisc_nfe_detalhe OWNER TO postgres;

--
-- TOC entry 321 (class 1259 OID 19997)
-- Name: seq_fisc_nfe_detalhe_imposto_cofins; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_cofins
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_cofins OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 19998)
-- Name: fisc_nfe_detalhe_imposto_cofins; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_detalhe_imposto_cofins (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_detalhe_imposto_cofins'::regclass) CONSTRAINT "fisc_nfe_detalhe_imposto_cofins_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_detalhe_imposto_cofins_ID_NFE_DETALHE_not_null" NOT NULL,
    cst_cofins character(2) DEFAULT NULL::bpchar,
    base_calculo_cofins numeric(18,6) DEFAULT NULL::numeric,
    aliquota_cofins_percentual numeric(18,6) DEFAULT NULL::numeric,
    quantidade_vendida numeric(18,6) DEFAULT NULL::numeric,
    aliquota_cofins_reais numeric(18,6) DEFAULT NULL::numeric,
    valor_cofins numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_detalhe_imposto_cofins_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_detalhe_imposto_cofins OWNER TO postgres;

--
-- TOC entry 323 (class 1259 OID 20020)
-- Name: seq_fisc_nfe_detalhe_imposto_cofins_st; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_cofins_st
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_cofins_st OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 20021)
-- Name: fisc_nfe_detalhe_imposto_cofins_st; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_detalhe_imposto_cofins_st (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_detalhe_imposto_cofins_st'::regclass) CONSTRAINT "fisc_nfe_detalhe_imposto_cofins_st_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_detalhe_imposto_cofins_st_ID_NFE_DETALHE_not_null" NOT NULL,
    base_calculo_cofins_st numeric(18,6) DEFAULT NULL::numeric,
    aliquota_cofins_st_percentual numeric(18,6) DEFAULT NULL::numeric,
    quantidade_vendida_cofins_st numeric(18,6) DEFAULT NULL::numeric,
    aliquota_cofins_st_reais numeric(18,6) DEFAULT NULL::numeric,
    valor_cofins_st numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_detalhe_imposto_cofins_st_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_detalhe_imposto_cofins_st OWNER TO postgres;

--
-- TOC entry 325 (class 1259 OID 20042)
-- Name: seq_fisc_nfe_detalhe_imposto_icms; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_icms
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_icms OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 20043)
-- Name: fisc_nfe_detalhe_imposto_icms; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_detalhe_imposto_icms (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_detalhe_imposto_icms'::regclass) CONSTRAINT "fisc_nfe_detalhe_imposto_icms_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_detalhe_imposto_icms_ID_NFE_DETALHE_not_null" NOT NULL,
    origem_mercadoria character(1) DEFAULT NULL::bpchar,
    cst_icms character(2) DEFAULT NULL::bpchar,
    csosn character(3) DEFAULT NULL::bpchar,
    modalidade_bc_icms character(1) DEFAULT NULL::bpchar,
    percentual_reducao_bc_icms numeric(18,6) DEFAULT NULL::numeric,
    valor_bc_icms numeric(18,6) DEFAULT NULL::numeric,
    aliquota_icms numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_operacao numeric(18,6) DEFAULT NULL::numeric,
    percentual_diferimento numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_diferido numeric(18,6) DEFAULT NULL::numeric,
    valor_icms numeric(18,6) DEFAULT NULL::numeric,
    base_calculo_fcp numeric(18,6) DEFAULT NULL::numeric,
    percentual_fcp numeric(18,6) DEFAULT NULL::numeric,
    valor_fcp numeric(18,6) DEFAULT NULL::numeric,
    modalidade_bc_icms_st character(1) DEFAULT NULL::bpchar,
    percentual_mva_icms_st numeric(18,6) DEFAULT NULL::numeric,
    percentual_reducao_bc_icms_st numeric(18,6) DEFAULT NULL::numeric,
    valor_base_calculo_icms_st numeric(18,6) DEFAULT NULL::numeric,
    aliquota_icms_st numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_st numeric(18,6) DEFAULT NULL::numeric,
    base_calculo_fcp_st numeric(18,6) DEFAULT NULL::numeric,
    percentual_fcp_st numeric(18,6) DEFAULT NULL::numeric,
    valor_fcp_st numeric(18,6) DEFAULT NULL::numeric,
    uf_st character(2) DEFAULT NULL::bpchar,
    percentual_bc_operacao_propria numeric(18,6) DEFAULT NULL::numeric,
    valor_bc_icms_st_retido numeric(18,6) DEFAULT NULL::numeric,
    aliquota_suportada_consumidor numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_substituto numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_st_retido numeric(18,6) DEFAULT NULL::numeric,
    base_calculo_fcp_st_retido numeric(18,6) DEFAULT NULL::numeric,
    percentual_fcp_st_retido numeric(18,6) DEFAULT NULL::numeric,
    valor_fcp_st_retido numeric(18,6) DEFAULT NULL::numeric,
    motivo_desoneracao_icms character(2) DEFAULT NULL::bpchar,
    valor_icms_desonerado numeric(18,6) DEFAULT NULL::numeric,
    aliquota_credito_icms_sn numeric(18,6) DEFAULT NULL::numeric,
    valor_credito_icms_sn numeric(18,6) DEFAULT NULL::numeric,
    valor_bc_icms_st_destino numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_st_destino numeric(18,6) DEFAULT NULL::numeric,
    percentual_reducao_bc_efetivo numeric(18,6) DEFAULT NULL::numeric,
    valor_bc_efetivo numeric(18,6) DEFAULT NULL::numeric,
    aliquota_icms_efetivo numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_efetivo numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_detalhe_imposto_icms_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_detalhe_imposto_icms OWNER TO postgres;

--
-- TOC entry 327 (class 1259 OID 20101)
-- Name: seq_fisc_nfe_detalhe_imposto_icms_ufdest; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_icms_ufdest
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_icms_ufdest OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 20102)
-- Name: fisc_nfe_detalhe_imposto_icms_ufdest; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_detalhe_imposto_icms_ufdest (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_detalhe_imposto_icms_ufdest'::regclass) CONSTRAINT "fisc_nfe_detalhe_imposto_icms_ufdest_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_detalhe_imposto_icms_ufdest_ID_NFE_DETALHE_not_null" NOT NULL,
    valor_bc_icms_uf_destino numeric(18,6) DEFAULT NULL::numeric,
    valor_bc_fcp_uf_destino numeric(18,6) DEFAULT NULL::numeric,
    percentual_fcp_uf_destino numeric(18,6) DEFAULT NULL::numeric,
    aliquota_interna_uf_destino numeric(18,6) DEFAULT NULL::numeric,
    aliquota_interesdatual_uf_envolvidas numeric(18,6) DEFAULT NULL::numeric,
    percentual_provisorio_partilha_icms numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_fcp_uf_destino numeric(18,6) DEFAULT NULL::numeric,
    valor_interestadual_uf_destino numeric(18,6) DEFAULT NULL::numeric,
    valor_interestadual_uf_remetente numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_detalhe_imposto_icms_ufdest_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_detalhe_imposto_icms_ufdest OWNER TO postgres;

--
-- TOC entry 329 (class 1259 OID 20127)
-- Name: seq_fisc_nfe_detalhe_imposto_ii; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_ii
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_ii OWNER TO postgres;

--
-- TOC entry 330 (class 1259 OID 20128)
-- Name: fisc_nfe_detalhe_imposto_ii; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_detalhe_imposto_ii (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_detalhe_imposto_ii'::regclass) CONSTRAINT "fisc_nfe_detalhe_imposto_ii_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_detalhe_imposto_ii_ID_NFE_DETALHE_not_null" NOT NULL,
    valor_bc_ii numeric(18,6) DEFAULT NULL::numeric,
    valor_despesas_aduaneiras numeric(18,6) DEFAULT NULL::numeric,
    valor_imposto_importacao numeric(18,6) DEFAULT NULL::numeric,
    valor_iof numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_detalhe_imposto_ii_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_detalhe_imposto_ii OWNER TO postgres;

--
-- TOC entry 331 (class 1259 OID 20148)
-- Name: seq_fisc_nfe_detalhe_imposto_ipi; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_ipi
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_ipi OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 20149)
-- Name: fisc_nfe_detalhe_imposto_ipi; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_detalhe_imposto_ipi (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_detalhe_imposto_ipi'::regclass) CONSTRAINT "fisc_nfe_detalhe_imposto_ipi_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_detalhe_imposto_ipi_ID_NFE_DETALHE_not_null" NOT NULL,
    cnpj_produtor character varying(14) DEFAULT NULL::character varying,
    codigo_selo_ipi character varying(60) DEFAULT NULL::character varying,
    quantidade_selo_ipi numeric(10,0) DEFAULT NULL::numeric,
    enquadramento_legal_ipi character(3) DEFAULT NULL::bpchar,
    cst_ipi character(2) DEFAULT NULL::bpchar,
    valor_base_calculo_ipi numeric(18,6) DEFAULT NULL::numeric,
    quantidade_unidade_tributavel numeric(18,6) DEFAULT NULL::numeric,
    valor_unidade_tributavel numeric(18,6) DEFAULT NULL::numeric,
    aliquota_ipi numeric(18,6) DEFAULT NULL::numeric,
    valor_ipi numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_detalhe_imposto_ipi_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_detalhe_imposto_ipi OWNER TO postgres;

--
-- TOC entry 333 (class 1259 OID 20175)
-- Name: seq_fisc_nfe_detalhe_imposto_issqn; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_issqn
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_issqn OWNER TO postgres;

--
-- TOC entry 334 (class 1259 OID 20176)
-- Name: fisc_nfe_detalhe_imposto_issqn; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_detalhe_imposto_issqn (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_detalhe_imposto_issqn'::regclass) CONSTRAINT "fisc_nfe_detalhe_imposto_issqn_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_detalhe_imposto_issqn_ID_NFE_DETALHE_not_null" NOT NULL,
    base_calculo_issqn numeric(18,6) DEFAULT NULL::numeric,
    aliquota_issqn numeric(18,6) DEFAULT NULL::numeric,
    valor_issqn numeric(18,6) DEFAULT NULL::numeric,
    municipio_issqn numeric(10,0) DEFAULT NULL::numeric,
    item_lista_servicos numeric(10,0) DEFAULT NULL::numeric,
    valor_deducao numeric(18,6) DEFAULT NULL::numeric,
    valor_outras_retencoes numeric(18,6) DEFAULT NULL::numeric,
    valor_desconto_incondicionado numeric(18,6) DEFAULT NULL::numeric,
    valor_desconto_condicionado numeric(18,6) DEFAULT NULL::numeric,
    valor_retencao_iss numeric(18,6) DEFAULT NULL::numeric,
    indicador_exigibilidade_iss character(1) DEFAULT NULL::bpchar,
    codigo_servico character varying(20) DEFAULT NULL::character varying,
    municipio_incidencia numeric(10,0) DEFAULT NULL::numeric,
    pais_sevico_prestado numeric(10,0) DEFAULT NULL::numeric,
    numero_processo character varying(30) DEFAULT NULL::character varying,
    indicador_incentivo_fiscal character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_detalhe_imposto_issqn_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_detalhe_imposto_issqn OWNER TO postgres;

--
-- TOC entry 335 (class 1259 OID 20208)
-- Name: seq_fisc_nfe_detalhe_imposto_pis; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_pis
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_pis OWNER TO postgres;

--
-- TOC entry 336 (class 1259 OID 20209)
-- Name: fisc_nfe_detalhe_imposto_pis; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_detalhe_imposto_pis (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_detalhe_imposto_pis'::regclass) CONSTRAINT "fisc_nfe_detalhe_imposto_pis_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_detalhe_imposto_pis_ID_NFE_DETALHE_not_null" NOT NULL,
    cst_pis character(2) DEFAULT NULL::bpchar,
    valor_base_calculo_pis numeric(18,6) DEFAULT NULL::numeric,
    aliquota_pis_percentual numeric(18,6) DEFAULT NULL::numeric,
    valor_pis numeric(18,6) DEFAULT NULL::numeric,
    quantidade_vendida numeric(18,6) DEFAULT NULL::numeric,
    aliquota_pis_reais numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_detalhe_imposto_pis_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_detalhe_imposto_pis OWNER TO postgres;

--
-- TOC entry 337 (class 1259 OID 20231)
-- Name: seq_fisc_nfe_detalhe_imposto_pis_st; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_pis_st
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_pis_st OWNER TO postgres;

--
-- TOC entry 338 (class 1259 OID 20232)
-- Name: fisc_nfe_detalhe_imposto_pis_st; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_detalhe_imposto_pis_st (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_detalhe_imposto_pis_st'::regclass) CONSTRAINT "fisc_nfe_detalhe_imposto_pis_st_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_detalhe_imposto_pis_st_ID_NFE_DETALHE_not_null" NOT NULL,
    valor_base_calculo_pis_st numeric(18,6) DEFAULT NULL::numeric,
    aliquota_pis_st_percentual numeric(18,6) DEFAULT NULL::numeric,
    quantidade_vendida_pis_st numeric(18,6) DEFAULT NULL::numeric,
    aliquota_pis_st_reais numeric(18,6) DEFAULT NULL::numeric,
    valor_pis_st numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_detalhe_imposto_pis_st_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_detalhe_imposto_pis_st OWNER TO postgres;

--
-- TOC entry 341 (class 1259 OID 20274)
-- Name: seq_fisc_nfe_duplicata; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_duplicata
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_duplicata OWNER TO postgres;

--
-- TOC entry 342 (class 1259 OID 20275)
-- Name: fisc_nfe_duplicata; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_duplicata (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_duplicata'::regclass) CONSTRAINT "fisc_nfe_duplicata_ID_not_null" NOT NULL,
    id_nfe_fatura numeric(10,0) CONSTRAINT "fisc_nfe_duplicata_ID_NFE_FATURA_not_null" NOT NULL,
    numero character varying(60) DEFAULT NULL::character varying,
    data_vencimento date,
    valor numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_duplicata_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_duplicata OWNER TO postgres;

--
-- TOC entry 343 (class 1259 OID 20293)
-- Name: seq_fisc_nfe_emitente; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_emitente
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_emitente OWNER TO postgres;

--
-- TOC entry 344 (class 1259 OID 20294)
-- Name: fisc_nfe_emitente; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_emitente (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_emitente'::regclass) CONSTRAINT "fisc_nfe_emitente_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_emitente_ID_NFE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    fantasia character varying(60) DEFAULT NULL::character varying,
    logradouro character varying(60) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    codigo_pais numeric(11,0) DEFAULT 1058,
    nome_pais character varying(60) DEFAULT 'BRASIL'::character varying,
    telefone character varying(14) DEFAULT NULL::character varying,
    inscricao_estadual character varying(14) DEFAULT NULL::character varying,
    inscricao_estadual_st character varying(14) DEFAULT NULL::character varying,
    inscricao_municipal character varying(15) DEFAULT NULL::character varying,
    cnae character varying(7) DEFAULT NULL::character varying,
    crt character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_emitente_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_emitente OWNER TO postgres;

--
-- TOC entry 345 (class 1259 OID 20332)
-- Name: seq_fisc_nfe_exportacao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_exportacao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_exportacao OWNER TO postgres;

--
-- TOC entry 346 (class 1259 OID 20333)
-- Name: fisc_nfe_exportacao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_exportacao (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_exportacao'::regclass) CONSTRAINT "fisc_nfe_exportacao_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_exportacao_ID_NFE_DETALHE_not_null" NOT NULL,
    drawback numeric(10,0) DEFAULT NULL::numeric,
    numero_registro numeric(10,0) DEFAULT NULL::numeric,
    chave_acesso character varying(44) DEFAULT NULL::character varying,
    quantidade numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_exportacao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_exportacao OWNER TO postgres;

--
-- TOC entry 339 (class 1259 OID 20253)
-- Name: seq_fisc_nfe_fatura; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_fatura
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_fatura OWNER TO postgres;

--
-- TOC entry 340 (class 1259 OID 20254)
-- Name: fisc_nfe_fatura; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_fatura (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_fatura'::regclass) CONSTRAINT "fisc_nfe_fatura_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_fatura_ID_NFE_CABECALHO_not_null" NOT NULL,
    numero character varying(60) DEFAULT NULL::character varying,
    valor_original numeric(18,6) DEFAULT NULL::numeric,
    valor_desconto numeric(18,6) DEFAULT NULL::numeric,
    valor_liquido numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_fatura_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_fatura OWNER TO postgres;

--
-- TOC entry 349 (class 1259 OID 20379)
-- Name: seq_fisc_nfe_importacao_detalhe; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_importacao_detalhe
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_importacao_detalhe OWNER TO postgres;

--
-- TOC entry 350 (class 1259 OID 20380)
-- Name: fisc_nfe_importacao_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_importacao_det (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_importacao_detalhe'::regclass) CONSTRAINT "fisc_nfe_importacao_detalhe_ID_not_null" NOT NULL,
    id_nfe_declaracao_importacao numeric(10,0) CONSTRAINT "fisc_nfe_importacao_detalhe_ID_NFE_DECLARACAO_IMPORTAC_not_null" NOT NULL,
    numero_adicao numeric(10,0) DEFAULT NULL::numeric,
    numero_sequencial numeric(10,0) DEFAULT NULL::numeric,
    codigo_fabricante_estrangeiro character varying(60) DEFAULT NULL::character varying,
    valor_desconto numeric(18,6) DEFAULT NULL::numeric,
    drawback numeric(10,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_importacao_detalhe_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_importacao_det OWNER TO postgres;

--
-- TOC entry 351 (class 1259 OID 20401)
-- Name: seq_fisc_nfe_informacao_pagamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_informacao_pagamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_informacao_pagamento OWNER TO postgres;

--
-- TOC entry 352 (class 1259 OID 20402)
-- Name: fisc_nfe_informacao_pagamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_informacao_pagamento (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_informacao_pagamento'::regclass) CONSTRAINT "fisc_nfe_informacao_pagamento_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_informacao_pagamento_ID_NFE_CABECALHO_not_null" NOT NULL,
    indicador_pagamento character(1) DEFAULT NULL::bpchar,
    meio_pagamento character(2) DEFAULT NULL::bpchar,
    valor numeric(18,6) DEFAULT NULL::numeric,
    tipo_integracao character(1) DEFAULT NULL::bpchar,
    cnpj_operadora_cartao character varying(14) DEFAULT NULL::character varying,
    bandeira character(2) DEFAULT NULL::bpchar,
    numero_autorizacao character varying(20) DEFAULT NULL::character varying,
    troco numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_informacao_pagamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_informacao_pagamento OWNER TO postgres;

--
-- TOC entry 353 (class 1259 OID 20426)
-- Name: seq_fisc_nfe_item_rastreado; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_item_rastreado
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_item_rastreado OWNER TO postgres;

--
-- TOC entry 354 (class 1259 OID 20427)
-- Name: fisc_nfe_item_rastreado; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_item_rastreado (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_nfe_item_rastreado'::regclass) CONSTRAINT "fisc_nfe_item_rastreado_ID_not_null" NOT NULL,
    id_nfe_detalhe numeric(10,0) CONSTRAINT "fisc_nfe_item_rastreado_ID_NFE_DETALHE_not_null" NOT NULL,
    numero_lote character varying(20) DEFAULT NULL::character varying,
    quantidade_itens numeric(18,6) DEFAULT NULL::numeric,
    data_fabricacao date,
    data_validade date,
    codigo_agregacao character varying(20) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_item_rastreado_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_item_rastreado OWNER TO postgres;

--
-- TOC entry 355 (class 1259 OID 20446)
-- Name: seq_fisc_nfe_local_entrega; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_local_entrega
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_local_entrega OWNER TO postgres;

--
-- TOC entry 356 (class 1259 OID 20447)
-- Name: fisc_nfe_local_entrega; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_local_entrega (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_local_entrega'::regclass) CONSTRAINT "fisc_nfe_local_entrega_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_local_entrega_ID_NFE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    nome_recebedor character varying(60) DEFAULT NULL::character varying,
    logradouro character varying(60) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    codigo_pais numeric(11,0) DEFAULT NULL::numeric,
    nome_pais character varying(60) DEFAULT NULL::character varying,
    telefone character varying(14) DEFAULT NULL::character varying,
    email character varying(60) DEFAULT NULL::character varying,
    inscricao_estadual character varying(14) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_local_entrega_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_local_entrega OWNER TO postgres;

--
-- TOC entry 357 (class 1259 OID 20481)
-- Name: seq_fisc_nfe_local_retirada; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_local_retirada
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_local_retirada OWNER TO postgres;

--
-- TOC entry 358 (class 1259 OID 20482)
-- Name: fisc_nfe_local_retirada; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_local_retirada (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_local_retirada'::regclass) CONSTRAINT "fisc_nfe_local_retirada_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_local_retirada_ID_NFE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    nome_expedidor character varying(60) DEFAULT NULL::character varying,
    logradouro character varying(60) DEFAULT NULL::character varying,
    numero character varying(60) DEFAULT NULL::character varying,
    complemento character varying(60) DEFAULT NULL::character varying,
    bairro character varying(60) DEFAULT NULL::character varying,
    codigo_municipio numeric(10,0) DEFAULT NULL::numeric,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    cep character varying(8) DEFAULT NULL::character varying,
    codigo_pais numeric(11,0) DEFAULT NULL::numeric,
    nome_pais character varying(60) DEFAULT NULL::character varying,
    telefone character varying(14) DEFAULT NULL::character varying,
    email character varying(60) DEFAULT NULL::character varying,
    inscricao_estadual character varying(14) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_local_retirada_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_local_retirada OWNER TO postgres;

--
-- TOC entry 359 (class 1259 OID 20516)
-- Name: seq_fisc_nfe_nf_referenciada; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_nf_referenciada
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_nf_referenciada OWNER TO postgres;

--
-- TOC entry 360 (class 1259 OID 20517)
-- Name: fisc_nfe_nf_referenciada; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_nf_referenciada (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_nf_referenciada'::regclass) CONSTRAINT "fisc_nfe_nf_referenciada_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_nf_referenciada_ID_NFE_CABECALHO_not_null" NOT NULL,
    codigo_uf numeric(10,0) DEFAULT NULL::numeric,
    ano_mes character varying(4) DEFAULT NULL::character varying,
    cnpj character varying(14) DEFAULT NULL::character varying,
    modelo character(2) DEFAULT '01'::bpchar,
    serie character(3) DEFAULT NULL::bpchar,
    numero_nf numeric(10,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_nf_referenciada_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_nf_referenciada OWNER TO postgres;

--
-- TOC entry 361 (class 1259 OID 20539)
-- Name: seq_fisc_nfe_numero; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_numero
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_numero OWNER TO postgres;

--
-- TOC entry 362 (class 1259 OID 20540)
-- Name: fisc_nfe_numero; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_numero (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_numero'::regclass) CONSTRAINT "fisc_nfe_numero_ID_not_null" NOT NULL,
    serie character(3) DEFAULT NULL::bpchar,
    numero numeric(10,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_numero_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_numero OWNER TO postgres;

--
-- TOC entry 363 (class 1259 OID 20551)
-- Name: seq_fisc_nfe_numero_inutilizado; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_numero_inutilizado
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_numero_inutilizado OWNER TO postgres;

--
-- TOC entry 364 (class 1259 OID 20552)
-- Name: fisc_nfe_numero_inutilizado; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_numero_inutilizado (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_numero_inutilizado'::regclass) CONSTRAINT "fisc_nfe_numero_inutilizado_ID_not_null" NOT NULL,
    serie character(3) DEFAULT NULL::bpchar,
    numero numeric(10,0) DEFAULT NULL::numeric,
    data_inutilizacao date,
    observacao text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_numero_inutilizado_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_numero_inutilizado OWNER TO postgres;

--
-- TOC entry 365 (class 1259 OID 20565)
-- Name: seq_fisc_nfe_processo_referenciado; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_processo_referenciado
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_processo_referenciado OWNER TO postgres;

--
-- TOC entry 366 (class 1259 OID 20566)
-- Name: fisc_nfe_processo_referenciado; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_processo_referenciado (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_processo_referenciado'::regclass) CONSTRAINT "fisc_nfe_processo_referenciado_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_processo_referenciado_ID_NFE_CABECALHO_not_null" NOT NULL,
    identificador character varying(60) DEFAULT NULL::character varying,
    origem character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_processo_referenciado_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_processo_referenciado OWNER TO postgres;

--
-- TOC entry 367 (class 1259 OID 20584)
-- Name: seq_fisc_nfe_prod_rural_referenciada; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_prod_rural_referenciada
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_prod_rural_referenciada OWNER TO postgres;

--
-- TOC entry 368 (class 1259 OID 20585)
-- Name: fisc_nfe_prod_rural_referenciada; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_prod_rural_referenciada (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_prod_rural_referenciada'::regclass) CONSTRAINT "fisc_nfe_prod_rural_referenciada_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_prod_rural_referenciada_ID_NFE_CABECALHO_not_null" NOT NULL,
    codigo_uf numeric(10,0) DEFAULT NULL::numeric,
    ano_mes character varying(4) DEFAULT NULL::character varying,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    inscricao_estadual character varying(14) DEFAULT NULL::character varying,
    modelo character(2) DEFAULT NULL::bpchar,
    serie character(3) DEFAULT NULL::bpchar,
    numero_nf numeric(10,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_prod_rural_referenciada_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_prod_rural_referenciada OWNER TO postgres;

--
-- TOC entry 369 (class 1259 OID 20609)
-- Name: seq_fisc_nfe_referenciada; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_referenciada
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_referenciada OWNER TO postgres;

--
-- TOC entry 370 (class 1259 OID 20610)
-- Name: fisc_nfe_referenciada; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_referenciada (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_referenciada'::regclass) CONSTRAINT "fisc_nfe_referenciada_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_referenciada_ID_NFE_CABECALHO_not_null" NOT NULL,
    chave_acesso character varying(44) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_referenciada_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_referenciada OWNER TO postgres;

--
-- TOC entry 371 (class 1259 OID 20627)
-- Name: seq_fisc_nfe_responsavel_tecnico; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_responsavel_tecnico
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_responsavel_tecnico OWNER TO postgres;

--
-- TOC entry 372 (class 1259 OID 20628)
-- Name: fisc_nfe_responsavel_tecnico; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_responsavel_tecnico (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_nfe_responsavel_tecnico'::regclass) CONSTRAINT "fisc_nfe_responsavel_tecnico_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_responsavel_tecnico_ID_NFE_CABECALHO_not_null" NOT NULL,
    cnpj character varying(14) DEFAULT NULL::character varying,
    contato character varying(60) DEFAULT NULL::character varying,
    email character varying(60) DEFAULT NULL::character varying,
    telefone character varying(14) DEFAULT NULL::character varying,
    identificador_csrt character(2) DEFAULT NULL::bpchar,
    hash_csrt character varying(28) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_responsavel_tecnico_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_responsavel_tecnico OWNER TO postgres;

--
-- TOC entry 373 (class 1259 OID 20650)
-- Name: seq_fisc_nfe_transporte; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_transporte
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_transporte OWNER TO postgres;

--
-- TOC entry 374 (class 1259 OID 20651)
-- Name: fisc_nfe_transporte; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_transporte (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_transporte'::regclass) CONSTRAINT "fisc_nfe_transporte_ID_not_null" NOT NULL,
    id_nfe_cabecalho numeric(10,0) CONSTRAINT "fisc_nfe_transporte_ID_NFE_CABECALHO_not_null" NOT NULL,
    id_transportadora numeric(11,0) DEFAULT NULL::numeric,
    modalidade_frete character(1) DEFAULT NULL::bpchar,
    cnpj character varying(14) DEFAULT NULL::character varying,
    cpf character varying(11) DEFAULT NULL::character varying,
    nome character varying(60) DEFAULT NULL::character varying,
    inscricao_estadual character varying(14) DEFAULT NULL::character varying,
    endereco character varying(60) DEFAULT NULL::character varying,
    nome_municipio character varying(60) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    valor_servico numeric(18,6) DEFAULT NULL::numeric,
    valor_bc_retencao_icms numeric(18,6) DEFAULT NULL::numeric,
    aliquota_retencao_icms numeric(18,6) DEFAULT NULL::numeric,
    valor_icms_retido numeric(18,6) DEFAULT NULL::numeric,
    cfop numeric(10,0) DEFAULT NULL::numeric,
    municipio numeric(10,0) DEFAULT NULL::numeric,
    placa_veiculo character varying(7) DEFAULT NULL::character varying,
    uf_veiculo character(2) DEFAULT NULL::bpchar,
    rntc_veiculo character varying(20) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_transporte_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_transporte OWNER TO postgres;

--
-- TOC entry 375 (class 1259 OID 20686)
-- Name: seq_fisc_nfe_transporte_reboque; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_transporte_reboque
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_transporte_reboque OWNER TO postgres;

--
-- TOC entry 376 (class 1259 OID 20687)
-- Name: fisc_nfe_transporte_reboque; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_transporte_reboque (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_transporte_reboque'::regclass) CONSTRAINT "fisc_nfe_transporte_reboque_ID_not_null" NOT NULL,
    id_nfe_transporte numeric(10,0) CONSTRAINT "fisc_nfe_transporte_reboque_ID_NFE_TRANSPORTE_not_null" NOT NULL,
    placa character varying(8) DEFAULT NULL::character varying,
    uf character(2) DEFAULT NULL::bpchar,
    rntc character varying(20) DEFAULT NULL::character varying,
    vagao character varying(20) DEFAULT NULL::character varying,
    balsa character varying(20) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_transporte_reboque_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_transporte_reboque OWNER TO postgres;

--
-- TOC entry 377 (class 1259 OID 20708)
-- Name: seq_fisc_nfe_transporte_volume; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_transporte_volume
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_transporte_volume OWNER TO postgres;

--
-- TOC entry 378 (class 1259 OID 20709)
-- Name: fisc_nfe_transporte_volume; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_transporte_volume (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_transporte_volume'::regclass) CONSTRAINT "fisc_nfe_transporte_volume_ID_not_null" NOT NULL,
    id_nfe_transporte numeric(10,0) CONSTRAINT "fisc_nfe_transporte_volume_ID_NFE_TRANSPORTE_not_null" NOT NULL,
    quantidade numeric(10,0) DEFAULT NULL::numeric,
    especie character varying(60) DEFAULT NULL::character varying,
    marca character varying(60) DEFAULT NULL::character varying,
    numeracao character varying(60) DEFAULT NULL::character varying,
    peso_liquido numeric(18,6) DEFAULT NULL::numeric,
    peso_bruto numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_transporte_volume_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_transporte_volume OWNER TO postgres;

--
-- TOC entry 379 (class 1259 OID 20731)
-- Name: seq_fisc_nfe_transporte_volume_lacre; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_nfe_transporte_volume_lacre
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_nfe_transporte_volume_lacre OWNER TO postgres;

--
-- TOC entry 380 (class 1259 OID 20732)
-- Name: fisc_nfe_transporte_volume_lacre; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_nfe_transporte_volume_lacre (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_nfe_transporte_volume_lacre'::regclass) CONSTRAINT "fisc_nfe_transporte_volume_lacre_ID_not_null" NOT NULL,
    id_nfe_transporte_volume numeric(10,0) CONSTRAINT "fisc_nfe_transporte_volume_la_ID_NFE_TRANSPORTE_VOLUME_not_null" NOT NULL,
    numero character varying(60) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_nfe_transporte_volume_lacre_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_nfe_transporte_volume_lacre OWNER TO postgres;

--
-- TOC entry 620 (class 1259 OID 25577)
-- Name: seq_fisc_trib_cfop; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_trib_cfop
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_trib_cfop OWNER TO postgres;

--
-- TOC entry 629 (class 1259 OID 25586)
-- Name: fisc_trib_cfop; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_trib_cfop (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_trib_cfop'::regclass) CONSTRAINT "fisc_trib_cfop_ID_not_null" NOT NULL,
    codigo numeric(11,0) DEFAULT NULL::numeric,
    descricao character varying(1000) DEFAULT NULL::character varying,
    aplicacao character varying(1000) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_trib_cfop_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_trib_cfop OWNER TO postgres;

--
-- TOC entry 621 (class 1259 OID 25578)
-- Name: seq_fisc_trib_csosn; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_trib_csosn
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_trib_csosn OWNER TO postgres;

--
-- TOC entry 630 (class 1259 OID 25600)
-- Name: fisc_trib_csosn; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_trib_csosn (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_trib_csosn'::regclass) CONSTRAINT "fisc_trib_csosn_ID_not_null" NOT NULL,
    codigo character(3) DEFAULT NULL::bpchar,
    descricao character varying(250) DEFAULT NULL::character varying,
    observacao character varying(1000) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_trib_csosn_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_trib_csosn OWNER TO postgres;

--
-- TOC entry 622 (class 1259 OID 25579)
-- Name: seq_fisc_trib_cst_cofins; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_trib_cst_cofins
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_trib_cst_cofins OWNER TO postgres;

--
-- TOC entry 631 (class 1259 OID 25614)
-- Name: fisc_trib_cst_cofins; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_trib_cst_cofins (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_trib_cst_cofins'::regclass) CONSTRAINT "fisc_trib_cst_cofins_ID_not_null" NOT NULL,
    codigo character(2) DEFAULT NULL::bpchar,
    descricao character varying(250) DEFAULT NULL::character varying,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_trib_cst_cofins_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_trib_cst_cofins OWNER TO postgres;

--
-- TOC entry 623 (class 1259 OID 25580)
-- Name: seq_fisc_trib_cst_icms; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_trib_cst_icms
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_trib_cst_icms OWNER TO postgres;

--
-- TOC entry 632 (class 1259 OID 25628)
-- Name: fisc_trib_cst_icms; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_trib_cst_icms (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_trib_cst_icms'::regclass) CONSTRAINT "fisc_trib_cst_icms_ID_not_null" NOT NULL,
    codigo character(2) DEFAULT NULL::bpchar,
    descricao character varying(250) DEFAULT NULL::character varying,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_trib_cst_icms_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_trib_cst_icms OWNER TO postgres;

--
-- TOC entry 624 (class 1259 OID 25581)
-- Name: seq_fisc_trib_cst_ipi; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_trib_cst_ipi
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_trib_cst_ipi OWNER TO postgres;

--
-- TOC entry 633 (class 1259 OID 25642)
-- Name: fisc_trib_cst_ipi; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_trib_cst_ipi (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_trib_cst_ipi'::regclass) CONSTRAINT "fisc_trib_cst_ipi_ID_not_null" NOT NULL,
    codigo character(2) DEFAULT NULL::bpchar,
    descricao character varying(250) DEFAULT NULL::character varying,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_trib_cst_ipi_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_trib_cst_ipi OWNER TO postgres;

--
-- TOC entry 625 (class 1259 OID 25582)
-- Name: seq_fisc_trib_cst_pis; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_trib_cst_pis
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_trib_cst_pis OWNER TO postgres;

--
-- TOC entry 634 (class 1259 OID 25656)
-- Name: fisc_trib_cst_pis; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_trib_cst_pis (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_trib_cst_pis'::regclass) CONSTRAINT "fisc_trib_cst_pis_ID_not_null" NOT NULL,
    codigo character(2) DEFAULT NULL::bpchar,
    descricao character varying(250) DEFAULT NULL::character varying,
    observacao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_trib_cst_pis_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_trib_cst_pis OWNER TO postgres;

--
-- TOC entry 626 (class 1259 OID 25583)
-- Name: seq_fisc_trib_ecf_aliquotas; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_trib_ecf_aliquotas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_trib_ecf_aliquotas OWNER TO postgres;

--
-- TOC entry 635 (class 1259 OID 25670)
-- Name: fisc_trib_ecf_aliquotas; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_trib_ecf_aliquotas (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_trib_ecf_aliquotas'::regclass) CONSTRAINT "fisc_trib_ecf_aliquotas_ID_not_null" NOT NULL,
    totalizador_parcial character varying(10) DEFAULT NULL::character varying,
    ecf_icms_st character varying(4) DEFAULT NULL::character varying,
    paf_p_st character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_trib_ecf_aliquotas_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_trib_ecf_aliquotas OWNER TO postgres;

--
-- TOC entry 498 (class 1259 OID 22838)
-- Name: seq_corp_tribut_grupo_tributario; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_tribut_grupo_tributario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_tribut_grupo_tributario OWNER TO postgres;

--
-- TOC entry 542 (class 1259 OID 23479)
-- Name: fisc_trib_grupo_tributario; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_trib_grupo_tributario (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_corp_tribut_grupo_tributario'::regclass) CONSTRAINT "corp_tribut_grupo_tributario_ID_not_null" NOT NULL,
    descricao character varying(100) DEFAULT NULL::character varying,
    origem_mercadoria character(1) DEFAULT NULL::bpchar,
    observacao text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_tribut_grupo_tributario_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_trib_grupo_tributario OWNER TO postgres;

--
-- TOC entry 499 (class 1259 OID 22839)
-- Name: seq_corp_tribut_icms_custom_cab; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_tribut_icms_custom_cab
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_tribut_icms_custom_cab OWNER TO postgres;

--
-- TOC entry 543 (class 1259 OID 23492)
-- Name: fisc_trib_icms_custom_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_trib_icms_custom_cab (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_corp_tribut_icms_custom_cab'::regclass) CONSTRAINT "corp_tribut_icms_custom_cab_ID_not_null" NOT NULL,
    descricao character varying(100) DEFAULT NULL::character varying,
    origem_mercadoria character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "corp_tribut_icms_custom_cab_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_trib_icms_custom_cab OWNER TO postgres;

--
-- TOC entry 628 (class 1259 OID 25585)
-- Name: seq_fisc_trib_icms_uf; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_trib_icms_uf
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_trib_icms_uf OWNER TO postgres;

--
-- TOC entry 637 (class 1259 OID 25694)
-- Name: fisc_trib_icms_uf; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_trib_icms_uf (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_trib_icms_uf'::regclass) CONSTRAINT "fisc_trib_icms_uf_ID_not_null" NOT NULL,
    id_tribut_configura_of_gt numeric(10,0) CONSTRAINT "fisc_trib_icms_uf_ID_TRIBUT_CONFIGURA_OF_GT_not_null" NOT NULL,
    uf_destino character(2) DEFAULT NULL::bpchar,
    cfop numeric(10,0) DEFAULT NULL::numeric,
    csosn character(3) DEFAULT NULL::bpchar,
    cst character(2) DEFAULT NULL::bpchar,
    modalidade_bc character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_trib_icms_uf_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_trib_icms_uf OWNER TO postgres;

--
-- TOC entry 627 (class 1259 OID 25584)
-- Name: seq_fisc_trib_municipal_regime; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_trib_municipal_regime
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_trib_municipal_regime OWNER TO postgres;

--
-- TOC entry 636 (class 1259 OID 25682)
-- Name: fisc_trib_municipal_regime; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_trib_municipal_regime (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_fisc_trib_municipal_regime'::regclass) CONSTRAINT "fisc_trib_municipal_regime_ID_not_null" NOT NULL,
    uf character(2) DEFAULT NULL::bpchar,
    codigo character varying(20) DEFAULT NULL::character varying,
    nome character varying(50) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_trib_municipal_regime_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_trib_municipal_regime OWNER TO postgres;

--
-- TOC entry 602 (class 1259 OID 25341)
-- Name: seq_fisc_tribut_icms_uf; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_fisc_tribut_icms_uf
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_fisc_tribut_icms_uf OWNER TO postgres;

--
-- TOC entry 616 (class 1259 OID 25480)
-- Name: fisc_tribut_icms_uf; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.fisc_tribut_icms_uf (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_fisc_tribut_icms_uf'::regclass) CONSTRAINT "fisc_tribut_icms_uf_ID_not_null" NOT NULL,
    id_tribut_configura_of_gt numeric(10,0) CONSTRAINT "fisc_tribut_icms_uf_ID_TRIBUT_CONFIGURA_OF_GT_not_null" NOT NULL,
    uf_destino character(2) DEFAULT NULL::bpchar,
    cfop numeric(10,0) DEFAULT NULL::numeric,
    csosn character(3) DEFAULT NULL::bpchar,
    cst character(2) DEFAULT NULL::bpchar,
    modalidade_bc character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "fisc_tribut_icms_uf_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.fisc_tribut_icms_uf OWNER TO postgres;

--
-- TOC entry 694 (class 1259 OID 27067)
-- Name: seq_orca_orcamento_detalhe; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_orca_orcamento_detalhe
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_orca_orcamento_detalhe OWNER TO postgres;

--
-- TOC entry 700 (class 1259 OID 27073)
-- Name: orca_orcamento_detalhe; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.orca_orcamento_detalhe (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_orca_orcamento_detalhe'::regclass) CONSTRAINT "orca_orcamento_detalhe_ID_not_null" NOT NULL,
    id_orcamento_empresarial numeric(11,0) CONSTRAINT "orca_orcamento_detalhe_ID_ORCAMENTO_EMPRESARIAL_not_null" NOT NULL,
    id_fin_natureza_financeira numeric(10,0) CONSTRAINT "orca_orcamento_detalhe_ID_FIN_NATUREZA_FINANCEIRA_not_null" NOT NULL,
    periodo character varying(10) DEFAULT NULL::character varying,
    valor_orcado numeric(18,6) DEFAULT NULL::numeric,
    valor_realizado numeric(18,6) DEFAULT NULL::numeric,
    taxa_variacao numeric(18,6) DEFAULT NULL::numeric,
    valor_variacao numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "orca_orcamento_detalhe_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.orca_orcamento_detalhe OWNER TO postgres;

--
-- TOC entry 695 (class 1259 OID 27068)
-- Name: seq_orca_orcamento_empresarial; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_orca_orcamento_empresarial
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_orca_orcamento_empresarial OWNER TO postgres;

--
-- TOC entry 701 (class 1259 OID 27089)
-- Name: orca_orcamento_empresarial; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.orca_orcamento_empresarial (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_orca_orcamento_empresarial'::regclass) CONSTRAINT "orca_orcamento_empresarial_ID_not_null" NOT NULL,
    id_orcamento_periodo numeric(11,0) CONSTRAINT "orca_orcamento_empresarial_ID_ORCAMENTO_PERIODO_not_null" NOT NULL,
    nome character varying(30) DEFAULT NULL::character varying,
    descricao text,
    data_inicial date,
    numero_periodos numeric(11,0) DEFAULT NULL::numeric,
    data_base date,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "orca_orcamento_empresarial_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.orca_orcamento_empresarial OWNER TO postgres;

--
-- TOC entry 696 (class 1259 OID 27069)
-- Name: seq_orca_orcamento_fluxo_caixa; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_orca_orcamento_fluxo_caixa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_orca_orcamento_fluxo_caixa OWNER TO postgres;

--
-- TOC entry 702 (class 1259 OID 27103)
-- Name: orca_orcamento_fluxo_caixa; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.orca_orcamento_fluxo_caixa (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_orca_orcamento_fluxo_caixa'::regclass) CONSTRAINT "orca_orcamento_fluxo_caixa_ID_not_null" NOT NULL,
    id_orc_fluxo_caixa_periodo numeric(11,0) CONSTRAINT "orca_orcamento_fluxo_caixa_ID_ORC_FLUXO_CAIXA_PERIODO_not_null" NOT NULL,
    nome character varying(30) DEFAULT NULL::character varying,
    descricao text,
    data_inicial date,
    numero_periodos numeric(11,0) DEFAULT NULL::numeric,
    data_base date,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "orca_orcamento_fluxo_caixa_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.orca_orcamento_fluxo_caixa OWNER TO postgres;

--
-- TOC entry 697 (class 1259 OID 27070)
-- Name: seq_orca_orcamento_fluxo_caixa_detalhe; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_orca_orcamento_fluxo_caixa_detalhe
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_orca_orcamento_fluxo_caixa_detalhe OWNER TO postgres;

--
-- TOC entry 703 (class 1259 OID 27117)
-- Name: orca_orcamento_fluxo_caixa_detalhe; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.orca_orcamento_fluxo_caixa_detalhe (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_orca_orcamento_fluxo_caixa_detalhe'::regclass) CONSTRAINT "orca_orcamento_fluxo_caixa_detalhe_ID_not_null" NOT NULL,
    id_orcamento_fluxo_caixa numeric(11,0) CONSTRAINT "orca_orcamento_fluxo_caixa_de_ID_ORCAMENTO_FLUXO_CAIXA_not_null" NOT NULL,
    id_fin_natureza_financeira numeric(10,0) CONSTRAINT "orca_orcamento_fluxo_caixa__ID_FIN_NATUREZA_FINANCEIRA_not_null" NOT NULL,
    periodo character varying(10) DEFAULT NULL::character varying,
    valor_orcado numeric(18,6) DEFAULT NULL::numeric,
    valor_realizado numeric(18,6) DEFAULT NULL::numeric,
    taxa_variacao numeric(18,6) DEFAULT NULL::numeric,
    valor_variacao numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "orca_orcamento_fluxo_caixa_detalhe_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.orca_orcamento_fluxo_caixa_detalhe OWNER TO postgres;

--
-- TOC entry 698 (class 1259 OID 27071)
-- Name: seq_orca_orcamento_fluxo_caixa_periodo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_orca_orcamento_fluxo_caixa_periodo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_orca_orcamento_fluxo_caixa_periodo OWNER TO postgres;

--
-- TOC entry 704 (class 1259 OID 27133)
-- Name: orca_orcamento_fluxo_caixa_periodo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.orca_orcamento_fluxo_caixa_periodo (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_orca_orcamento_fluxo_caixa_periodo'::regclass) CONSTRAINT "orca_orcamento_fluxo_caixa_periodo_ID_not_null" NOT NULL,
    id_banco_conta_caixa numeric(11,0) CONSTRAINT "orca_orcamento_fluxo_caixa_period_ID_BANCO_CONTA_CAIXA_not_null" NOT NULL,
    periodo character(2) DEFAULT NULL::bpchar,
    nome character varying(30) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "orca_orcamento_fluxo_caixa_periodo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.orca_orcamento_fluxo_caixa_periodo OWNER TO postgres;

--
-- TOC entry 699 (class 1259 OID 27072)
-- Name: seq_orca_orcamento_periodo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_orca_orcamento_periodo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_orca_orcamento_periodo OWNER TO postgres;

--
-- TOC entry 705 (class 1259 OID 27145)
-- Name: orca_orcamento_periodo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.orca_orcamento_periodo (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_orca_orcamento_periodo'::regclass) CONSTRAINT "orca_orcamento_periodo_ID_not_null" NOT NULL,
    periodo character(2) DEFAULT NULL::bpchar,
    nome character varying(30) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "orca_orcamento_periodo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.orca_orcamento_periodo OWNER TO postgres;

--
-- TOC entry 706 (class 1259 OID 27156)
-- Name: seq_pcp_instrucao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_pcp_instrucao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_pcp_instrucao OWNER TO postgres;

--
-- TOC entry 713 (class 1259 OID 27163)
-- Name: pcp_instrucao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.pcp_instrucao (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_pcp_instrucao'::regclass) CONSTRAINT "pcp_instrucao_ID_not_null" NOT NULL,
    codigo character(3) DEFAULT NULL::bpchar,
    descricao character varying(100) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "pcp_instrucao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.pcp_instrucao OWNER TO postgres;

--
-- TOC entry 707 (class 1259 OID 27157)
-- Name: seq_pcp_instrucao_op; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_pcp_instrucao_op
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_pcp_instrucao_op OWNER TO postgres;

--
-- TOC entry 714 (class 1259 OID 27174)
-- Name: pcp_instrucao_op; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.pcp_instrucao_op (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_pcp_instrucao_op'::regclass) CONSTRAINT "pcp_instrucao_op_ID_not_null" NOT NULL,
    id_pcp_instrucao numeric(11,0) CONSTRAINT "pcp_instrucao_op_ID_PCP_INSTRUCAO_not_null" NOT NULL,
    id_pcp_op_cabecalho numeric(11,0) CONSTRAINT "pcp_instrucao_op_ID_PCP_OP_CABECALHO_not_null" NOT NULL,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "pcp_instrucao_op_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.pcp_instrucao_op OWNER TO postgres;

--
-- TOC entry 708 (class 1259 OID 27158)
-- Name: seq_pcp_op_cabecalho; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_pcp_op_cabecalho
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_pcp_op_cabecalho OWNER TO postgres;

--
-- TOC entry 715 (class 1259 OID 27185)
-- Name: pcp_op_cabecalho; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.pcp_op_cabecalho (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_pcp_op_cabecalho'::regclass) CONSTRAINT "pcp_op_cabecalho_ID_not_null" NOT NULL,
    inicio date,
    previsao_entrega date,
    termino date,
    custo_total_previsto numeric(18,6) DEFAULT NULL::numeric,
    custo_total_realizado numeric(18,6) DEFAULT NULL::numeric,
    porcento_venda numeric(18,6) DEFAULT NULL::numeric,
    porcento_estoque numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "pcp_op_cabecalho_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.pcp_op_cabecalho OWNER TO postgres;

--
-- TOC entry 709 (class 1259 OID 27159)
-- Name: seq_pcp_op_detalhe; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_pcp_op_detalhe
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_pcp_op_detalhe OWNER TO postgres;

--
-- TOC entry 716 (class 1259 OID 27198)
-- Name: pcp_op_detalhe; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.pcp_op_detalhe (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_pcp_op_detalhe'::regclass) CONSTRAINT "pcp_op_detalhe_ID_not_null" NOT NULL,
    id_pcp_op_cabecalho numeric(11,0) CONSTRAINT "pcp_op_detalhe_ID_PCP_OP_CABECALHO_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "pcp_op_detalhe_ID_PRODUTO_not_null" NOT NULL,
    quantidade_produzir numeric(18,6) DEFAULT NULL::numeric,
    quantidade_produzida numeric(18,6) DEFAULT NULL::numeric,
    quantidade_entregue numeric(18,6) DEFAULT NULL::numeric,
    custo_previsto numeric(18,6) DEFAULT NULL::numeric,
    custo_realizado numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "pcp_op_detalhe_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.pcp_op_detalhe OWNER TO postgres;

--
-- TOC entry 710 (class 1259 OID 27160)
-- Name: seq_pcp_servico; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_pcp_servico
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_pcp_servico OWNER TO postgres;

--
-- TOC entry 717 (class 1259 OID 27214)
-- Name: pcp_servico; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.pcp_servico (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_pcp_servico'::regclass) CONSTRAINT "pcp_servico_ID_not_null" NOT NULL,
    id_pcp_op_detalhe numeric(11,0) CONSTRAINT "pcp_servico_ID_PCP_OP_DETALHE_not_null" NOT NULL,
    inicio_realizado date,
    termino_realizado date,
    horas_realizado numeric(11,0) DEFAULT NULL::numeric,
    minutos_realizado numeric(11,0) DEFAULT NULL::numeric,
    segundos_realizado numeric(11,0) DEFAULT NULL::numeric,
    custo_realizado numeric(18,6) DEFAULT NULL::numeric,
    inicio_previsto date,
    termino_previsto date,
    horas_previsto numeric(11,0) DEFAULT NULL::numeric,
    minutos_previsto numeric(11,0) DEFAULT NULL::numeric,
    segundos_previsto numeric(11,0) DEFAULT NULL::numeric,
    custo_previsto numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "pcp_servico_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.pcp_servico OWNER TO postgres;

--
-- TOC entry 711 (class 1259 OID 27161)
-- Name: seq_pcp_servico_colaborador; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_pcp_servico_colaborador
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_pcp_servico_colaborador OWNER TO postgres;

--
-- TOC entry 718 (class 1259 OID 27232)
-- Name: pcp_servico_colaborador; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.pcp_servico_colaborador (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_pcp_servico_colaborador'::regclass) CONSTRAINT "pcp_servico_colaborador_ID_not_null" NOT NULL,
    id_pcp_servico numeric(11,0) CONSTRAINT "pcp_servico_colaborador_ID_PCP_SERVICO_not_null" NOT NULL,
    id_colaborador numeric(11,0) CONSTRAINT "pcp_servico_colaborador_ID_COLABORADOR_not_null" NOT NULL,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "pcp_servico_colaborador_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.pcp_servico_colaborador OWNER TO postgres;

--
-- TOC entry 712 (class 1259 OID 27162)
-- Name: seq_pcp_servico_equipamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_pcp_servico_equipamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_pcp_servico_equipamento OWNER TO postgres;

--
-- TOC entry 719 (class 1259 OID 27243)
-- Name: pcp_servico_equipamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.pcp_servico_equipamento (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_pcp_servico_equipamento'::regclass) CONSTRAINT "pcp_servico_equipamento_ID_not_null" NOT NULL,
    id_patrim_bem numeric(11,0) CONSTRAINT "pcp_servico_equipamento_ID_PATRIM_BEM_not_null" NOT NULL,
    id_pcp_servico numeric(11,0) CONSTRAINT "pcp_servico_equipamento_ID_PCP_SERVICO_not_null" NOT NULL,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "pcp_servico_equipamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.pcp_servico_equipamento OWNER TO postgres;

--
-- TOC entry 720 (class 1259 OID 27254)
-- Name: seq_prdc_produto_ficha_tecnica; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_prdc_produto_ficha_tecnica
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_prdc_produto_ficha_tecnica OWNER TO postgres;

--
-- TOC entry 721 (class 1259 OID 27255)
-- Name: prdc_produto_ficha_tecnica; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.prdc_produto_ficha_tecnica (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_prdc_produto_ficha_tecnica'::regclass) CONSTRAINT "prdc_produto_ficha_tecnica_ID_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "prdc_produto_ficha_tecnica_ID_PRODUTO_not_null" NOT NULL,
    descricao character varying(100) DEFAULT NULL::character varying,
    id_produto_filho numeric(11,0) DEFAULT NULL::numeric,
    quantidade numeric(18,6) DEFAULT NULL::numeric,
    sequencia_producao numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "prdc_produto_ficha_tecnica_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.prdc_produto_ficha_tecnica OWNER TO postgres;

--
-- TOC entry 591 (class 1259 OID 25328)
-- Name: seq_rhfo_cbo; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_rhfo_cbo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_rhfo_cbo OWNER TO postgres;

--
-- TOC entry 606 (class 1259 OID 25347)
-- Name: rhfo_cbo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.rhfo_cbo (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_rhfo_cbo'::regclass) CONSTRAINT "rh_cbo_ID_not_null" NOT NULL,
    codigo character varying(10) DEFAULT NULL::character varying,
    codigo_1994 character varying(10) DEFAULT NULL::character varying,
    nome character varying(250) DEFAULT NULL::character varying,
    observacao text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "rh_cbo_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.rhfo_cbo OWNER TO postgres;

--
-- TOC entry 600 (class 1259 OID 25338)
-- Name: seq_rhfo_estado_civil; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_rhfo_estado_civil
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_rhfo_estado_civil OWNER TO postgres;

--
-- TOC entry 614 (class 1259 OID 25457)
-- Name: rhfo_estado_civil; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.rhfo_estado_civil (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_rhfo_estado_civil'::regclass) CONSTRAINT "rh_estado_civil_ID_not_null" NOT NULL,
    nome character varying(50) DEFAULT NULL::character varying,
    descricao character varying(250) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "rh_estado_civil_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.rhfo_estado_civil OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16656)
-- Name: seq_agen_categoria_compromisso; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_agen_categoria_compromisso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_agen_categoria_compromisso OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16481)
-- Name: seq_auth_perfil; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_auth_perfil
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_auth_perfil OWNER TO postgres;

--
-- TOC entry 10505 (class 0 OID 0)
-- Dependencies: 226
-- Name: seq_auth_perfil; Type: SEQUENCE OWNED BY; Schema: sagnus; Owner: postgres
--

ALTER SEQUENCE sagnus.seq_auth_perfil OWNED BY sagnus.auth_perfil.id;


--
-- TOC entry 228 (class 1259 OID 16510)
-- Name: seq_auth_permissao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_auth_permissao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_auth_permissao OWNER TO postgres;

--
-- TOC entry 10507 (class 0 OID 0)
-- Dependencies: 228
-- Name: seq_auth_permissao; Type: SEQUENCE OWNED BY; Schema: sagnus; Owner: postgres
--

ALTER SEQUENCE sagnus.seq_auth_permissao OWNED BY sagnus.auth_permissao.id;


--
-- TOC entry 224 (class 1259 OID 16461)
-- Name: seq_auth_usuario; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_auth_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_auth_usuario OWNER TO postgres;

--
-- TOC entry 10509 (class 0 OID 0)
-- Dependencies: 224
-- Name: seq_auth_usuario; Type: SEQUENCE OWNED BY; Schema: sagnus; Owner: postgres
--

ALTER SEQUENCE sagnus.seq_auth_usuario OWNED BY sagnus.auth_usuario.id;


--
-- TOC entry 639 (class 1259 OID 25723)
-- Name: seq_corp_pais; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_corp_pais
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_corp_pais OWNER TO postgres;

--
-- TOC entry 545 (class 1259 OID 24790)
-- Name: seq_supr_almoxarifado; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_almoxarifado
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_almoxarifado OWNER TO postgres;

--
-- TOC entry 546 (class 1259 OID 24791)
-- Name: seq_supr_estq_cor; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_estq_cor
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_estq_cor OWNER TO postgres;

--
-- TOC entry 547 (class 1259 OID 24792)
-- Name: seq_supr_estq_grade; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_estq_grade
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_estq_grade OWNER TO postgres;

--
-- TOC entry 548 (class 1259 OID 24793)
-- Name: seq_supr_estq_marca; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_estq_marca
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_estq_marca OWNER TO postgres;

--
-- TOC entry 549 (class 1259 OID 24794)
-- Name: seq_supr_estq_reajuste_cabecalho; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_estq_reajuste_cabecalho
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_estq_reajuste_cabecalho OWNER TO postgres;

--
-- TOC entry 550 (class 1259 OID 24795)
-- Name: seq_supr_estq_reajuste_detalhe; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_estq_reajuste_detalhe
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_estq_reajuste_detalhe OWNER TO postgres;

--
-- TOC entry 551 (class 1259 OID 24796)
-- Name: seq_supr_estq_sabor; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_estq_sabor
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_estq_sabor OWNER TO postgres;

--
-- TOC entry 552 (class 1259 OID 24797)
-- Name: seq_supr_estq_tamanho; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_estq_tamanho
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_estq_tamanho OWNER TO postgres;

--
-- TOC entry 553 (class 1259 OID 24798)
-- Name: seq_supr_invt_contagem_cab; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_invt_contagem_cab
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_invt_contagem_cab OWNER TO postgres;

--
-- TOC entry 554 (class 1259 OID 24799)
-- Name: seq_supr_invt_contagem_det; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_invt_contagem_det
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_invt_contagem_det OWNER TO postgres;

--
-- TOC entry 555 (class 1259 OID 24800)
-- Name: seq_supr_req_interna_cabecalho; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_req_interna_cabecalho
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_req_interna_cabecalho OWNER TO postgres;

--
-- TOC entry 556 (class 1259 OID 24801)
-- Name: seq_supr_req_interna_detalhe; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_req_interna_detalhe
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_req_interna_detalhe OWNER TO postgres;

--
-- TOC entry 557 (class 1259 OID 24802)
-- Name: seq_supr_wms_agendamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_wms_agendamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_wms_agendamento OWNER TO postgres;

--
-- TOC entry 558 (class 1259 OID 24803)
-- Name: seq_supr_wms_armazenamento; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_wms_armazenamento
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_wms_armazenamento OWNER TO postgres;

--
-- TOC entry 559 (class 1259 OID 24804)
-- Name: seq_supr_wms_caixa; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_wms_caixa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_wms_caixa OWNER TO postgres;

--
-- TOC entry 560 (class 1259 OID 24805)
-- Name: seq_supr_wms_estante; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_wms_estante
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_wms_estante OWNER TO postgres;

--
-- TOC entry 561 (class 1259 OID 24806)
-- Name: seq_supr_wms_expedicao; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_wms_expedicao
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_wms_expedicao OWNER TO postgres;

--
-- TOC entry 562 (class 1259 OID 24807)
-- Name: seq_supr_wms_ordem_separacao_cab; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_wms_ordem_separacao_cab
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_wms_ordem_separacao_cab OWNER TO postgres;

--
-- TOC entry 563 (class 1259 OID 24808)
-- Name: seq_supr_wms_ordem_separacao_det; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_wms_ordem_separacao_det
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_wms_ordem_separacao_det OWNER TO postgres;

--
-- TOC entry 564 (class 1259 OID 24809)
-- Name: seq_supr_wms_parametro; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_wms_parametro
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_wms_parametro OWNER TO postgres;

--
-- TOC entry 565 (class 1259 OID 24810)
-- Name: seq_supr_wms_recebimento_cabecalho; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_wms_recebimento_cabecalho
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_wms_recebimento_cabecalho OWNER TO postgres;

--
-- TOC entry 566 (class 1259 OID 24811)
-- Name: seq_supr_wms_recebimento_detalhe; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_wms_recebimento_detalhe
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_wms_recebimento_detalhe OWNER TO postgres;

--
-- TOC entry 567 (class 1259 OID 24812)
-- Name: seq_supr_wms_rua; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.seq_supr_wms_rua
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.seq_supr_wms_rua OWNER TO postgres;

--
-- TOC entry 568 (class 1259 OID 24813)
-- Name: supr_almoxarifado; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_almoxarifado (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_almoxarifado'::regclass) CONSTRAINT "supr_almoxarifado_ID_not_null" NOT NULL,
    nome character varying(50) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_almoxarifado_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_almoxarifado OWNER TO postgres;

--
-- TOC entry 569 (class 1259 OID 24823)
-- Name: supr_estq_cor; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_estq_cor (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_supr_estq_cor'::regclass) CONSTRAINT "supr_estq_cor_ID_not_null" NOT NULL,
    codigo character(4) DEFAULT NULL::bpchar,
    nome character varying(50) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_estq_cor_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_estq_cor OWNER TO postgres;

--
-- TOC entry 570 (class 1259 OID 24834)
-- Name: supr_estq_grade; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_estq_grade (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_supr_estq_grade'::regclass) CONSTRAINT "supr_estq_grade_ID_not_null" NOT NULL,
    id_estq_marca numeric(10,0) DEFAULT NULL::numeric,
    id_estq_sabor numeric(10,0) DEFAULT NULL::numeric,
    id_estq_tamanho numeric(10,0) DEFAULT NULL::numeric,
    id_estq_cor numeric(10,0) DEFAULT NULL::numeric,
    id_produto numeric(11,0) CONSTRAINT "supr_estq_grade_ID_PRODUTO_not_null" NOT NULL,
    codigo character varying(50) DEFAULT NULL::character varying,
    quantidade numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_estq_grade_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_estq_grade OWNER TO postgres;

--
-- TOC entry 764 (class 1259 OID 28462)
-- Name: supr_estq_local; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_estq_local (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    ativo boolean DEFAULT true
);


ALTER TABLE sagnus.supr_estq_local OWNER TO postgres;

--
-- TOC entry 763 (class 1259 OID 28461)
-- Name: supr_estq_local_id_seq; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.supr_estq_local_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.supr_estq_local_id_seq OWNER TO postgres;

--
-- TOC entry 10539 (class 0 OID 0)
-- Dependencies: 763
-- Name: supr_estq_local_id_seq; Type: SEQUENCE OWNED BY; Schema: sagnus; Owner: postgres
--

ALTER SEQUENCE sagnus.supr_estq_local_id_seq OWNED BY sagnus.supr_estq_local.id;


--
-- TOC entry 571 (class 1259 OID 24850)
-- Name: supr_estq_marca; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_estq_marca (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_supr_estq_marca'::regclass) CONSTRAINT "supr_estq_marca_ID_not_null" NOT NULL,
    codigo character(4) DEFAULT NULL::bpchar,
    nome character varying(50) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_estq_marca_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_estq_marca OWNER TO postgres;

--
-- TOC entry 767 (class 1259 OID 28486)
-- Name: supr_estq_movimentacao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_estq_movimentacao (
    id bigint NOT NULL,
    id_produto bigint NOT NULL,
    id_local bigint NOT NULL,
    tipo_movimentacao character varying(20) NOT NULL,
    quantidade numeric(15,4) NOT NULL,
    data_hora timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    origem_documento character varying(50),
    motivo_movimentacao character varying(100)
);


ALTER TABLE sagnus.supr_estq_movimentacao OWNER TO postgres;

--
-- TOC entry 766 (class 1259 OID 28485)
-- Name: supr_estq_movimentacao_id_seq; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.supr_estq_movimentacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.supr_estq_movimentacao_id_seq OWNER TO postgres;

--
-- TOC entry 10543 (class 0 OID 0)
-- Dependencies: 766
-- Name: supr_estq_movimentacao_id_seq; Type: SEQUENCE OWNED BY; Schema: sagnus; Owner: postgres
--

ALTER SEQUENCE sagnus.supr_estq_movimentacao_id_seq OWNED BY sagnus.supr_estq_movimentacao.id;


--
-- TOC entry 572 (class 1259 OID 24861)
-- Name: supr_estq_reajuste_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_estq_reajuste_cab (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_supr_estq_reajuste_cabecalho'::regclass) CONSTRAINT "supr_estq_reajuste_cabecalho_ID_not_null" NOT NULL,
    id_colaborador numeric(11,0) CONSTRAINT "supr_estq_reajuste_cabecalho_ID_COLABORADOR_not_null" NOT NULL,
    data_reajuste date,
    taxa numeric(18,6) DEFAULT NULL::numeric,
    tipo_reajuste character(1) DEFAULT NULL::bpchar,
    justificativa character varying(100) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_estq_reajuste_cabecalho_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_estq_reajuste_cab OWNER TO postgres;

--
-- TOC entry 573 (class 1259 OID 24874)
-- Name: supr_estq_reajuste_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_estq_reajuste_det (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_supr_estq_reajuste_detalhe'::regclass) CONSTRAINT "supr_estq_reajuste_detalhe_ID_not_null" NOT NULL,
    id_estq_reajuste_cabecalho numeric(10,0) CONSTRAINT "supr_estq_reajuste_detalhe_ID_ESTQ_REAJUSTE_CABECALHO_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "supr_estq_reajuste_detalhe_ID_PRODUTO_not_null" NOT NULL,
    valor_original numeric(18,6) DEFAULT NULL::numeric,
    valor_reajuste numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_estq_reajuste_detalhe_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_estq_reajuste_det OWNER TO postgres;

--
-- TOC entry 574 (class 1259 OID 24887)
-- Name: supr_estq_sabor; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_estq_sabor (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_supr_estq_sabor'::regclass) CONSTRAINT "supr_estq_sabor_ID_not_null" NOT NULL,
    codigo character(4) DEFAULT NULL::bpchar,
    nome character varying(50) DEFAULT NULL::character varying,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_estq_sabor_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_estq_sabor OWNER TO postgres;

--
-- TOC entry 765 (class 1259 OID 28471)
-- Name: supr_estq_saldo; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_estq_saldo (
    id_produto bigint NOT NULL,
    id_local bigint NOT NULL,
    quantidade_atual numeric(15,4) DEFAULT 0,
    quantidade_reservada numeric(15,4) DEFAULT 0,
    custo_medio numeric(15,4) DEFAULT 0,
    valor_total_estoque numeric(15,4) DEFAULT 0,
    data_ultima_movimentacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE sagnus.supr_estq_saldo OWNER TO postgres;

--
-- TOC entry 10548 (class 0 OID 0)
-- Dependencies: 765
-- Name: COLUMN supr_estq_saldo.custo_medio; Type: COMMENT; Schema: sagnus; Owner: postgres
--

COMMENT ON COLUMN sagnus.supr_estq_saldo.custo_medio IS 'Valor unitário médio ponderado do produto neste local';


--
-- TOC entry 769 (class 1259 OID 28503)
-- Name: supr_estq_saldo_historico; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_estq_saldo_historico (
    id bigint NOT NULL,
    data_snapshot date NOT NULL,
    id_produto bigint NOT NULL,
    id_local bigint NOT NULL,
    quantidade_fisica numeric(15,4),
    quantidade_reservada numeric(15,4),
    custo_medio_na_data numeric(15,4),
    valor_total_estoque numeric(15,4)
);


ALTER TABLE sagnus.supr_estq_saldo_historico OWNER TO postgres;

--
-- TOC entry 768 (class 1259 OID 28502)
-- Name: supr_estq_saldo_historico_id_seq; Type: SEQUENCE; Schema: sagnus; Owner: postgres
--

CREATE SEQUENCE sagnus.supr_estq_saldo_historico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sagnus.supr_estq_saldo_historico_id_seq OWNER TO postgres;

--
-- TOC entry 10551 (class 0 OID 0)
-- Dependencies: 768
-- Name: supr_estq_saldo_historico_id_seq; Type: SEQUENCE OWNED BY; Schema: sagnus; Owner: postgres
--

ALTER SEQUENCE sagnus.supr_estq_saldo_historico_id_seq OWNED BY sagnus.supr_estq_saldo_historico.id;


--
-- TOC entry 575 (class 1259 OID 24898)
-- Name: supr_estq_tamanho; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_estq_tamanho (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_supr_estq_tamanho'::regclass) CONSTRAINT "supr_estq_tamanho_ID_not_null" NOT NULL,
    codigo character(4) DEFAULT NULL::bpchar,
    nome character varying(50) DEFAULT NULL::character varying,
    altura numeric(18,6) DEFAULT NULL::numeric,
    comprimento numeric(18,6) DEFAULT NULL::numeric,
    largura numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_estq_tamanho_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_estq_tamanho OWNER TO postgres;

--
-- TOC entry 576 (class 1259 OID 24912)
-- Name: supr_invt_contagem_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_invt_contagem_cab (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_invt_contagem_cab'::regclass) CONSTRAINT "supr_invt_contagem_cab_ID_not_null" NOT NULL,
    data_contagem date,
    estq_atualizado character(1) DEFAULT NULL::bpchar,
    tipo character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_invt_contagem_cab_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_invt_contagem_cab OWNER TO postgres;

--
-- TOC entry 577 (class 1259 OID 24923)
-- Name: supr_invt_contagem_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_invt_contagem_det (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_invt_contagem_det'::regclass) CONSTRAINT "supr_invt_contagem_det_ID_not_null" NOT NULL,
    id_inventario_contagem_cab numeric(11,0) CONSTRAINT "supr_invt_contagem_det_ID_INVENTARIO_CONTAGEM_CAB_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "supr_invt_contagem_det_ID_PRODUTO_not_null" NOT NULL,
    contagem01 numeric(18,6) DEFAULT NULL::numeric,
    contagem02 numeric(18,6) DEFAULT NULL::numeric,
    contagem03 numeric(18,6) DEFAULT NULL::numeric,
    fechado_contagem character(2) DEFAULT NULL::bpchar,
    quantidade_sistema numeric(18,6) DEFAULT NULL::numeric,
    acuracidade numeric(18,6) DEFAULT NULL::numeric,
    divergencia numeric(18,6) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_invt_contagem_det_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_invt_contagem_det OWNER TO postgres;

--
-- TOC entry 578 (class 1259 OID 24941)
-- Name: supr_req_interna_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_req_interna_cab (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_supr_req_interna_cabecalho'::regclass) CONSTRAINT "supr_req_interna_cabecalho_ID_not_null" NOT NULL,
    id_colaborador numeric(11,0) CONSTRAINT "supr_req_interna_cabecalho_ID_COLABORADOR_not_null" NOT NULL,
    data_requisicao date,
    situacao character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_req_interna_cabecalho_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_req_interna_cab OWNER TO postgres;

--
-- TOC entry 579 (class 1259 OID 24952)
-- Name: supr_req_interna_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_req_interna_det (
    id numeric(10,0) DEFAULT nextval('sagnus.seq_supr_req_interna_detalhe'::regclass) CONSTRAINT "supr_req_interna_detalhe_ID_not_null" NOT NULL,
    id_requisicao_interna_cabecalho numeric(10,0) CONSTRAINT "supr_req_interna_detalhe_ID_REQUISICAO_INTERNA_CABECAL_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "supr_req_interna_detalhe_ID_PRODUTO_not_null" NOT NULL,
    quantidade numeric(18,6) CONSTRAINT "supr_req_interna_detalhe_QUANTIDADE_not_null" NOT NULL,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_req_interna_detalhe_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_req_interna_det OWNER TO postgres;

--
-- TOC entry 580 (class 1259 OID 24964)
-- Name: supr_wms_agendamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_wms_agendamento (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_wms_agendamento'::regclass) CONSTRAINT "supr_wms_agendamento_ID_not_null" NOT NULL,
    data_operacao date,
    hora_operacao character varying(8) DEFAULT NULL::character varying,
    local_operacao character varying(100) DEFAULT NULL::character varying,
    quantidade_volume numeric(11,0) DEFAULT NULL::numeric,
    peso_total_volume numeric(18,6) DEFAULT NULL::numeric,
    quantidade_pessoa numeric(11,0) DEFAULT NULL::numeric,
    quantidade_hora numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_wms_agendamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_wms_agendamento OWNER TO postgres;

--
-- TOC entry 581 (class 1259 OID 24979)
-- Name: supr_wms_armazenamento; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_wms_armazenamento (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_wms_armazenamento'::regclass) CONSTRAINT "supr_wms_armazenamento_ID_not_null" NOT NULL,
    id_wms_caixa numeric(11,0) CONSTRAINT "supr_wms_armazenamento_ID_WMS_CAIXA_not_null" NOT NULL,
    id_wms_recebimento_detalhe numeric(11,0) CONSTRAINT "supr_wms_armazenamento_ID_WMS_RECEBIMENTO_DETALHE_not_null" NOT NULL,
    quantidade numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_wms_armazenamento_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_wms_armazenamento OWNER TO postgres;

--
-- TOC entry 582 (class 1259 OID 24991)
-- Name: supr_wms_caixa; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_wms_caixa (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_wms_caixa'::regclass) CONSTRAINT "supr_wms_caixa_ID_not_null" NOT NULL,
    id_wms_estante numeric(11,0) CONSTRAINT "supr_wms_caixa_ID_WMS_ESTANTE_not_null" NOT NULL,
    codigo character varying(10) DEFAULT NULL::character varying,
    altura numeric(11,0) DEFAULT NULL::numeric,
    largura numeric(11,0) DEFAULT NULL::numeric,
    profundidade numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_wms_caixa_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_wms_caixa OWNER TO postgres;

--
-- TOC entry 583 (class 1259 OID 25005)
-- Name: supr_wms_estante; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_wms_estante (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_wms_estante'::regclass) CONSTRAINT "supr_wms_estante_ID_not_null" NOT NULL,
    id_wms_rua numeric(11,0) CONSTRAINT "supr_wms_estante_ID_WMS_RUA_not_null" NOT NULL,
    codigo character varying(10) DEFAULT NULL::character varying,
    quantidade_caixa numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_wms_estante_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_wms_estante OWNER TO postgres;

--
-- TOC entry 584 (class 1259 OID 25017)
-- Name: supr_wms_expedicao; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_wms_expedicao (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_wms_expedicao'::regclass) CONSTRAINT "supr_wms_expedicao_ID_not_null" NOT NULL,
    id_wms_ordem_separacao_det numeric(11,0) CONSTRAINT "supr_wms_expedicao_ID_WMS_ORDEM_SEPARACAO_DET_not_null" NOT NULL,
    id_wms_armazenamento numeric(11,0) CONSTRAINT "supr_wms_expedicao_ID_WMS_ARMAZENAMENTO_not_null" NOT NULL,
    quantidade numeric(11,0) DEFAULT NULL::numeric,
    data_saida date,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_wms_expedicao_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_wms_expedicao OWNER TO postgres;

--
-- TOC entry 585 (class 1259 OID 25029)
-- Name: supr_wms_ordem_separacao_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_wms_ordem_separacao_cab (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_wms_ordem_separacao_cab'::regclass) CONSTRAINT "supr_wms_ordem_separacao_cab_ID_not_null" NOT NULL,
    origem character(1) DEFAULT NULL::bpchar,
    data_solicitacao date,
    data_limite date,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_wms_ordem_separacao_cab_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_wms_ordem_separacao_cab OWNER TO postgres;

--
-- TOC entry 586 (class 1259 OID 25039)
-- Name: supr_wms_ordem_separacao_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_wms_ordem_separacao_det (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_wms_ordem_separacao_det'::regclass) CONSTRAINT "supr_wms_ordem_separacao_det_ID_not_null" NOT NULL,
    id_wms_ordem_separacao_cab numeric(11,0) CONSTRAINT "supr_wms_ordem_separacao_de_ID_WMS_ORDEM_SEPARACAO_CAB_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "supr_wms_ordem_separacao_det_ID_PRODUTO_not_null" NOT NULL,
    quantidade numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_wms_ordem_separacao_det_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_wms_ordem_separacao_det OWNER TO postgres;

--
-- TOC entry 587 (class 1259 OID 25051)
-- Name: supr_wms_parametro; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_wms_parametro (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_wms_parametro'::regclass) CONSTRAINT "supr_wms_parametro_ID_not_null" NOT NULL,
    hora_por_volume numeric(11,0) DEFAULT NULL::numeric,
    pessoa_por_volume numeric(11,0) DEFAULT NULL::numeric,
    hora_por_peso numeric(11,0) DEFAULT NULL::numeric,
    pessoa_por_peso numeric(11,0) DEFAULT NULL::numeric,
    item_diferente_caixa character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_wms_parametro_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_wms_parametro OWNER TO postgres;

--
-- TOC entry 588 (class 1259 OID 25065)
-- Name: supr_wms_recebimento_cab; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_wms_recebimento_cab (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_wms_recebimento_cabecalho'::regclass) CONSTRAINT "supr_wms_recebimento_cabecalho_ID_not_null" NOT NULL,
    id_wms_agendamento numeric(11,0) CONSTRAINT "supr_wms_recebimento_cabecalho_ID_WMS_AGENDAMENTO_not_null" NOT NULL,
    data_recebimento date,
    hora_inicio character varying(8) DEFAULT NULL::character varying,
    hora_fim character varying(8) DEFAULT NULL::character varying,
    volume_recebido numeric(11,0) DEFAULT NULL::numeric,
    peso_recebido numeric(18,6) DEFAULT NULL::numeric,
    inconsistencia character(1) DEFAULT NULL::bpchar,
    observacao text,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_wms_recebimento_cabecalho_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_wms_recebimento_cab OWNER TO postgres;

--
-- TOC entry 589 (class 1259 OID 25082)
-- Name: supr_wms_recebimento_det; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_wms_recebimento_det (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_wms_recebimento_detalhe'::regclass) CONSTRAINT "supr_wms_recebimento_detalhe_ID_not_null" NOT NULL,
    id_wms_recebimento_cabecalho numeric(11,0) CONSTRAINT "supr_wms_recebimento_detalh_ID_WMS_RECEBIMENTO_CABECAL_not_null" NOT NULL,
    id_produto numeric(11,0) CONSTRAINT "supr_wms_recebimento_detalhe_ID_PRODUTO_not_null" NOT NULL,
    quantidade_volume numeric(11,0) DEFAULT NULL::numeric,
    quantidade_item_por_volume numeric(11,0) DEFAULT NULL::numeric,
    quantidade_recebida numeric(11,0) DEFAULT NULL::numeric,
    destino character(1) DEFAULT NULL::bpchar,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_wms_recebimento_detalhe_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_wms_recebimento_det OWNER TO postgres;

--
-- TOC entry 590 (class 1259 OID 25097)
-- Name: supr_wms_rua; Type: TABLE; Schema: sagnus; Owner: postgres
--

CREATE TABLE sagnus.supr_wms_rua (
    id numeric(11,0) DEFAULT nextval('sagnus.seq_supr_wms_rua'::regclass) CONSTRAINT "supr_wms_rua_ID_not_null" NOT NULL,
    codigo character varying(10) DEFAULT NULL::character varying,
    nome character varying(100) DEFAULT NULL::character varying,
    quantidade_estante numeric(11,0) DEFAULT NULL::numeric,
    dt_criacao timestamp with time zone DEFAULT now() CONSTRAINT "supr_wms_rua_DT_CRIACAO_not_null" NOT NULL,
    usu_criacao character varying(30),
    dt_alteracao timestamp with time zone,
    usu_alteracao character varying(30)
);


ALTER TABLE sagnus.supr_wms_rua OWNER TO postgres;

--
-- TOC entry 6143 (class 2604 OID 16485)
-- Name: auth_perfil id; Type: DEFAULT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_perfil ALTER COLUMN id SET DEFAULT nextval('sagnus.seq_auth_perfil'::regclass);


--
-- TOC entry 6145 (class 2604 OID 16514)
-- Name: auth_permissao id; Type: DEFAULT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_permissao ALTER COLUMN id SET DEFAULT nextval('sagnus.seq_auth_permissao'::regclass);


--
-- TOC entry 6140 (class 2604 OID 16465)
-- Name: auth_usuario id; Type: DEFAULT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_usuario ALTER COLUMN id SET DEFAULT nextval('sagnus.seq_auth_usuario'::regclass);


--
-- TOC entry 8250 (class 2604 OID 28528)
-- Name: com_vend_pedido id; Type: DEFAULT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pedido ALTER COLUMN id SET DEFAULT nextval('sagnus.com_vend_pedido_id_seq'::regclass);


--
-- TOC entry 8252 (class 2604 OID 28550)
-- Name: fina_plano_contas id; Type: DEFAULT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_plano_contas ALTER COLUMN id SET DEFAULT nextval('sagnus.fina_plano_contas_id_seq'::regclass);


--
-- TOC entry 8253 (class 2604 OID 28561)
-- Name: fina_titulo id; Type: DEFAULT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_titulo ALTER COLUMN id SET DEFAULT nextval('sagnus.fina_titulo_id_seq'::regclass);


--
-- TOC entry 8240 (class 2604 OID 28465)
-- Name: supr_estq_local id; Type: DEFAULT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_local ALTER COLUMN id SET DEFAULT nextval('sagnus.supr_estq_local_id_seq'::regclass);


--
-- TOC entry 8247 (class 2604 OID 28489)
-- Name: supr_estq_movimentacao id; Type: DEFAULT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_movimentacao ALTER COLUMN id SET DEFAULT nextval('sagnus.supr_estq_movimentacao_id_seq'::regclass);


--
-- TOC entry 8249 (class 2604 OID 28506)
-- Name: supr_estq_saldo_historico id; Type: DEFAULT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_saldo_historico ALTER COLUMN id SET DEFAULT nextval('sagnus.supr_estq_saldo_historico_id_seq'::regclass);


--
-- TOC entry 9466 (class 0 OID 16875)
-- Dependencies: 240
-- Data for Name: adm_agen_cat_compromisso; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.adm_agen_cat_compromisso (id, nome, cor, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9470 (class 0 OID 16912)
-- Dependencies: 244
-- Data for Name: adm_agen_comp_conv; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.adm_agen_comp_conv (id, id_compromisso, id_colaborador, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9468 (class 0 OID 16887)
-- Dependencies: 242
-- Data for Name: adm_agen_compromisso; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.adm_agen_compromisso (id, id_categoria, id_colaborador, data_compromisso, hora, duracao, onde, descricao, tipo, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9472 (class 0 OID 16937)
-- Dependencies: 246
-- Data for Name: adm_agen_notificacao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.adm_agen_notificacao (id, id_compromisso, data_notificacao, hora, tipo, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9462 (class 0 OID 16850)
-- Dependencies: 236
-- Data for Name: adm_modulo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.adm_modulo (id, codigo, nome, descricao, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9464 (class 0 OID 16864)
-- Dependencies: 238
-- Data for Name: adm_parametro; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.adm_parametro (id, fin_parcela_aberto, fin_parcela_quitado, fin_parcela_quitado_parcial, fin_tipo_recebimento_edi, compra_fin_doc_origem, compra_conta_caixa, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9453 (class 0 OID 16482)
-- Dependencies: 227
-- Data for Name: auth_perfil; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.auth_perfil (id, nome, descricao, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9456 (class 0 OID 16524)
-- Dependencies: 230
-- Data for Name: auth_perfil_permissao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.auth_perfil_permissao (perfil_id, permissao_id, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9455 (class 0 OID 16511)
-- Dependencies: 229
-- Data for Name: auth_permissao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.auth_permissao (id, codigo, descricao, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9451 (class 0 OID 16462)
-- Dependencies: 225
-- Data for Name: auth_usuario; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.auth_usuario (id, username, email, senha_hash, ativo, criado_em, usu_criacao, atualizado_em, usu_alteracao, token_version, pessoa_id, role) FROM stdin;
5	admin	admin@slifesys.com	$2a$10$7r1R0m1gF5Q7c5KpXz8e0e0pQKp3dZJ1XGz5z7YzV5P0g9y4bQw6u	true	2025-12-15 20:57:09.952494-03	postgres	2025-12-15 20:57:09.952494-03	\N	\N	\N	ROLE_AUTH_ADMIN
\.


--
-- TOC entry 9457 (class 0 OID 16544)
-- Dependencies: 231
-- Data for Name: auth_usuario_perfil; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.auth_usuario_perfil (usuario_id, perfil_id, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9912 (class 0 OID 26682)
-- Dependencies: 686
-- Data for Name: com_vend_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_cab (id, id_venda_orcamento_cab, id_venda_condicoes_pagamento, id_nota_fiscal_tipo, id_cliente, id_transportadora, id_vendedor, data_venda, data_saida, hora_saida, numero_fatura, local_entrega, local_cobranca, valor_subtotal, taxa_comissao, valor_comissao, taxa_desconto, valor_desconto, valor_total, tipo_frete, forma_pagamento, valor_frete, valor_seguro, observacao, situacao, dia_fixo_parcela, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9913 (class 0 OID 26715)
-- Dependencies: 687
-- Data for Name: com_vend_comissao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_comissao (id, id_venda_cab, id_vendedor, valor_venda, tipo_contabil, valor_comissao, situacao, data_lancamento, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9894 (class 0 OID 26296)
-- Dependencies: 668
-- Data for Name: com_vend_comissao_objetivo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_comissao_objetivo (id, id_comissao_perfil, id_produto, codigo, nome, descricao, forma_pagamento, taxa_pagamento, valor_pagamento, valor_meta, quantidade, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9895 (class 0 OID 26316)
-- Dependencies: 669
-- Data for Name: com_vend_comissao_perfil; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_comissao_perfil (id, codigo, nome, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9914 (class 0 OID 26730)
-- Dependencies: 688
-- Data for Name: com_vend_condicoes_pagamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_condicoes_pagamento (id, nome, descricao, faturamento_minimo, faturamento_maximo, indice_correcao, dias_tolerancia, valor_tolerancia, prazo_medio, vista_prazo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9915 (class 0 OID 26749)
-- Dependencies: 689
-- Data for Name: com_vend_condicoes_parcelas; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_condicoes_parcelas (id, id_venda_condicoes_pagamento, parcela, dias, taxa, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9916 (class 0 OID 26762)
-- Dependencies: 690
-- Data for Name: com_vend_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_det (id, id_venda_cab, id_produto, quantidade, valor_unitario, valor_subtotal, taxa_desconto, valor_desconto, valor_total, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9917 (class 0 OID 26779)
-- Dependencies: 691
-- Data for Name: com_vend_frete; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_frete (id, id_venda_cab, id_transportadora, conhecimento, responsavel, placa, uf_placa, selo_fiscal, quantidade_volume, marca_volume, especie_volume, peso_bruto, peso_liquido, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9896 (class 0 OID 26327)
-- Dependencies: 670
-- Data for Name: com_vend_integracao_pdv; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_integracao_pdv (id, identifica, data_integracao, hora_integracao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9918 (class 0 OID 26800)
-- Dependencies: 692
-- Data for Name: com_vend_orcamento_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_orcamento_cab (id, id_venda_condicoes_pagamento, id_vendedor, id_cliente, id_transportadora, codigo, data_cadastro, data_entrega, validade, tipo_frete, valor_subtotal, valor_frete, taxa_comissao, valor_comissao, taxa_desconto, valor_desconto, valor_total, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9919 (class 0 OID 26824)
-- Dependencies: 693
-- Data for Name: com_vend_orcamento_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_orcamento_det (id, id_venda_orcamento_cab, id_produto, quantidade, valor_unitario, valor_subtotal, taxa_desconto, valor_desconto, valor_total, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9897 (class 0 OID 26338)
-- Dependencies: 671
-- Data for Name: com_vend_pdv_caixa; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pdv_caixa (id, nome, data_cadastro, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9898 (class 0 OID 26348)
-- Dependencies: 672
-- Data for Name: com_vend_pdv_configuracao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pdv_configuracao (id, nome_caixa, id_gerado_caixa, id_empresa, id_ecf_impressora, id_pdv_caixa, mensagem_cupom, porta_ecf, ip_servidor, ip_sitef, tipo_tef, titulo_tela_caixa, caminho_imagens_produtos, caminho_imagens_marketing, cor_janelas_internas, marketing_ativo, cfop_ecf, timeout_ecf, intervalo_ecf, descricao_suprimento, descricao_sangria, tef_tipo_gp, tef_tempo_espera, tef_espera_sts, tef_numero_vias, decimais_quantidade, decimais_valor, bits_por_segundo, qtde_maxima_cartoes, pesquisa_parte, configuracao_balanca, parametros_diversos, ultima_exclusao, laudo, indice_gerencial, data_atualizacao_estoque, data_sincronizacao, hora_sincronizacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9899 (class 0 OID 26394)
-- Dependencies: 673
-- Data for Name: com_vend_pdv_fechamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pdv_fechamento (id, nome_caixa, id_gerado_caixa, id_empresa, id_pdv_movimento, tipo_pagamento, valor, data_sincronizacao, hora_sincronizacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9900 (class 0 OID 26410)
-- Dependencies: 674
-- Data for Name: com_vend_pdv_movimento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pdv_movimento (id, nome_caixa, id_gerado_caixa, id_empresa, id_ecf_impressora, id_pdv_operador, id_pdv_caixa, id_gerente_supervisor, data_abertura, hora_abertura, data_fechamento, hora_fechamento, total_suprimento, total_sangria, total_nao_fiscal, total_venda, total_desconto, total_acrescimo, total_final, total_recebido, total_troco, total_cancelado, status_movimento, data_sincronizacao, hora_sincronizacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9901 (class 0 OID 26440)
-- Dependencies: 675
-- Data for Name: com_vend_pdv_sangria; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pdv_sangria (id, nome_caixa, id_gerado_caixa, id_empresa, id_pdv_movimento, data_sangria, valor, data_sincronizacao, hora_sincronizacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9902 (class 0 OID 26455)
-- Dependencies: 676
-- Data for Name: com_vend_pdv_suprimento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pdv_suprimento (id, nome_caixa, id_gerado_caixa, id_empresa, id_pdv_movimento, data_suprimento, valor, data_sincronizacao, hora_sincronizacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9903 (class 0 OID 26470)
-- Dependencies: 677
-- Data for Name: com_vend_pdv_tipo_pagamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pdv_tipo_pagamento (id, codigo, descricao, tef, imprime_vinculado, permite_troco, tef_tipo_gp, gera_parcelas, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9904 (class 0 OID 26486)
-- Dependencies: 678
-- Data for Name: com_vend_pdv_total_tipo_pagamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pdv_total_tipo_pagamento (id, nome_caixa, id_gerado_caixa, id_empresa, id_pdv_venda_cab, id_pdv_tipo_pagamento, serie_ecf, coo, ccf, gnf, valor, nsu, estorno, rede, cartao_dc, data_venda, hash_registro, data_sincronizacao, hora_sincronizacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9905 (class 0 OID 26511)
-- Dependencies: 679
-- Data for Name: com_vend_pdv_venda_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pdv_venda_cab (id, nome_caixa, id_gerado_caixa, id_empresa, id_cliente, id_pdv_funcionario, id_pdv_movimento, id_ecf_dav, id_ecf_pre_venda_cab, serie_ecf, cfop, coo, ccf, data_venda, hora_venda, valor_venda, taxa_desconto, desconto, taxa_acrescimo, acrescimo, valor_final, valor_recebido, troco, valor_cancelado, total_produtos, total_documento, base_icms, icms, icms_outras, issqn, pis, cofins, acrescimo_itens, desconto_itens, status_venda, nome_cliente, cpf_cnpj_cliente, cupom_cancelado, hash_registro, data_sincronizacao, hora_sincronizacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9906 (class 0 OID 26558)
-- Dependencies: 680
-- Data for Name: com_vend_pdv_venda_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pdv_venda_det (id, nome_caixa, id_gerado_caixa, id_empresa, id_produto, id_pdv_venda_cab, cfop, gtin, ccf, coo, serie_ecf, item, quantidade, valor_unitario, valor_total, total_item, base_icms, taxa_icms, icms, taxa_desconto, desconto, taxa_issqn, issqn, taxa_pis, pis, taxa_cofins, cofins, taxa_acrescimo, acrescimo, acrescimo_rateio, desconto_rateio, totalizador_parcial, cst, cancelado, movimenta_estoque, ecf_icms_st, hash_registro, data_sincronizacao, hora_sincronizacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9997 (class 0 OID 28525)
-- Dependencies: 771
-- Data for Name: com_vend_pedido; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pedido (id, id_cliente, id_tabela_preco, data_pedido, status, valor_total_bruto, valor_total_desconto, valor_total_liquido, data_faturamento, numero_nota_fiscal, serie_nota_fiscal) FROM stdin;
\.


--
-- TOC entry 9907 (class 0 OID 26604)
-- Dependencies: 681
-- Data for Name: com_vend_pre_venda_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pre_venda_cab (id, id_pessoa, data_emissao, hora_emissao, situacao, ccf, valor, nome_destinatario, cpf_cnpj_destinatario, subtotal, desconto, acrescimo, taxa_acrescimo, taxa_desconto, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9908 (class 0 OID 26625)
-- Dependencies: 682
-- Data for Name: com_vend_pre_venda_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_pre_venda_det (id, id_pre_venda_cab, id_produto, item, quantidade, valor_unitario, valor_total, cancelado, gtin_produto, nome_produto, unidade_produto, ecf_icms_st, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9909 (class 0 OID 26645)
-- Dependencies: 683
-- Data for Name: com_vend_produto_promocao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_produto_promocao (id, id_produto, data_inicio, data_fim, quantidade_em_promocao, quantidade_maxima_cliente, valor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9910 (class 0 OID 26658)
-- Dependencies: 684
-- Data for Name: com_vend_tabela_preco; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_tabela_preco (id, nome, principal, coeficiente, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9911 (class 0 OID 26670)
-- Dependencies: 685
-- Data for Name: com_vend_tabela_preco_produto; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.com_vend_tabela_preco_produto (id, id_tabela_preco, id_produto, preco, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9727 (class 0 OID 22841)
-- Dependencies: 501
-- Data for Name: corp_cargo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_cargo (id, nome, descricao, salario, cbo_1994, cbo_2002, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9728 (class 0 OID 22855)
-- Dependencies: 502
-- Data for Name: corp_cep; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_cep (id, numero, logradouro, complemento, bairro, municipio, uf, codigo_ibge_municipio, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9729 (class 0 OID 22871)
-- Dependencies: 503
-- Data for Name: corp_cliente; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_cliente (id, id_pessoa, id_tabela_preco, desde, data_cadastro, taxa_desconto, limite_credito, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9730 (class 0 OID 22885)
-- Dependencies: 504
-- Data for Name: corp_cnae; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_cnae (id, codigo, denominacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9731 (class 0 OID 22898)
-- Dependencies: 505
-- Data for Name: corp_colaborador; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_colaborador (id, id_pessoa, id_cargo, id_setor, id_colaborador_situacao, id_tipo_admissao, id_colaborador_tipo, id_sindicato, matricula, data_cadastro, data_admissao, data_demissao, ctps_numero, ctps_serie, ctps_data_expedicao, ctps_uf, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9732 (class 0 OID 22919)
-- Dependencies: 506
-- Data for Name: corp_colaborador_relacionamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_colaborador_relacionamento (id, id_tipo_relacionamento, id_colaborador, nome, data_nascimento, cpf, registro_matricula, registro_cartorio, registro_cartorio_numero, registro_numero_livro, registro_numero_folha, data_entrega_documento, salario_familia, salario_familia_idade_limite, salario_familia_data_fim, imposto_renda_idade_limite, imposto_renda_data_fim, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9733 (class 0 OID 22941)
-- Dependencies: 507
-- Data for Name: corp_colaborador_situacao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_colaborador_situacao (id, codigo, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9734 (class 0 OID 22954)
-- Dependencies: 508
-- Data for Name: corp_colaborador_tipo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_colaborador_tipo (id, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9735 (class 0 OID 22966)
-- Dependencies: 509
-- Data for Name: corp_comissao_perfil; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_comissao_perfil (id, codigo, nome, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9736 (class 0 OID 22977)
-- Dependencies: 510
-- Data for Name: corp_empresa; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_empresa (id, razao_social, nome_fantasia, cnpj, inscricao_estadual, inscricao_municipal, tipo_regime, crt, email, site, contato, data_constituicao, tipo, inscricao_junta_comercial, data_insc_junta_comercial, codigo_ibge_cidade, codigo_ibge_uf, cei, codigo_cnae_principal, imagem_logotipo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9737 (class 0 OID 23004)
-- Dependencies: 511
-- Data for Name: corp_empresa_cnae; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_empresa_cnae (id, id_empresa, id_cnae, principal, ramo_atividade, objeto_social, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9738 (class 0 OID 23019)
-- Dependencies: 512
-- Data for Name: corp_empresa_contato; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_empresa_contato (id, id_empresa, nome, email, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9739 (class 0 OID 23034)
-- Dependencies: 513
-- Data for Name: corp_empresa_endereco; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_empresa_endereco (id, id_empresa, logradouro, numero, bairro, cidade, uf, cep, municipio_ibge, complemento, principal, entrega, cobranca, correspondencia, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9740 (class 0 OID 23058)
-- Dependencies: 514
-- Data for Name: corp_empresa_telefone; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_empresa_telefone (id, id_empresa, tipo, numero, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9741 (class 0 OID 23070)
-- Dependencies: 515
-- Data for Name: corp_empresa_transporte; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_empresa_transporte (id, uf, nome, classificacao_contabil_conta, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9742 (class 0 OID 23082)
-- Dependencies: 516
-- Data for Name: corp_empresa_transporte_itinerario; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_empresa_transporte_itinerario (id, id_empresa_transporte, nome, tarifa, trajeto, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9743 (class 0 OID 23096)
-- Dependencies: 517
-- Data for Name: corp_estado_civil; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_estado_civil (id, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9744 (class 0 OID 23107)
-- Dependencies: 518
-- Data for Name: corp_fornecedor; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_fornecedor (id, id_pessoa, desde, data_cadastro, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9867 (class 0 OID 25753)
-- Dependencies: 641
-- Data for Name: corp_municipio; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_municipio (id, id_uf, nome, codigo_ibge, codigo_receita_federal, codigo_estadual, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9745 (class 0 OID 23118)
-- Dependencies: 519
-- Data for Name: corp_ncm; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_ncm (id, codigo, descricao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9746 (class 0 OID 23147)
-- Dependencies: 520
-- Data for Name: corp_pessoa; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_pessoa (id, nome, tipo, site, email, eh_cliente, eh_fornecedor, eh_transportadora, eh_colaborador, eh_contador, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9747 (class 0 OID 23167)
-- Dependencies: 521
-- Data for Name: corp_pessoa_alteracao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_pessoa_alteracao (id, id_pessoa, data_alteracao, objeto_antigo, objeto_novo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9748 (class 0 OID 23179)
-- Dependencies: 522
-- Data for Name: corp_pessoa_contato; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_pessoa_contato (id, id_pessoa, nome, email, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9749 (class 0 OID 23194)
-- Dependencies: 523
-- Data for Name: corp_pessoa_endereco; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_pessoa_endereco (id, id_pessoa, logradouro, numero, bairro, municipio_ibge, uf, cep, cidade, complemento, principal, entrega, cobranca, correspondencia, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9750 (class 0 OID 23218)
-- Dependencies: 524
-- Data for Name: corp_pessoa_fisica; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_pessoa_fisica (id, id_pessoa, id_nivel_formacao, id_estado_civil, cpf, rg, orgao_rg, data_emissao_rg, data_nascimento, sexo, raca, nacionalidade, naturalidade, nome_pai, nome_mae, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9751 (class 0 OID 23241)
-- Dependencies: 525
-- Data for Name: corp_pessoa_juridica; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_pessoa_juridica (id, id_pessoa, cnpj, nome_fantasia, inscricao_estadual, inscricao_municipal, data_constituicao, tipo_regime, crt, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9988 (class 0 OID 28449)
-- Dependencies: 762
-- Data for Name: corp_pessoa_papel; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_pessoa_papel (id_pessoa, tipo_papel) FROM stdin;
\.


--
-- TOC entry 9752 (class 0 OID 23257)
-- Dependencies: 526
-- Data for Name: corp_pessoa_telefone; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_pessoa_telefone (id, id_pessoa, tipo, numero, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9753 (class 0 OID 23269)
-- Dependencies: 527
-- Data for Name: corp_produto; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_produto (id, id_produto_subgrupo, id_produto_marca, id_produto_unidade, id_tribut_icms_custom_cab, id_tribut_grupo_tributario, nome, descricao, gtin, codigo_interno, valor_compra, valor_venda, codigo_ncm, estoque_minimo, estoque_maximo, quantidade_estoque, data_cadastro, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9754 (class 0 OID 23295)
-- Dependencies: 528
-- Data for Name: corp_produto_alteracao_item; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_produto_alteracao_item (id, id_produto, codigo, nome, data_inicial, data_final, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9755 (class 0 OID 23307)
-- Dependencies: 529
-- Data for Name: corp_produto_codigo_adicional; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_produto_codigo_adicional (id, id_produto, codigo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9756 (class 0 OID 23318)
-- Dependencies: 530
-- Data for Name: corp_produto_ficha_tecnica; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_produto_ficha_tecnica (id, id_produto, descricao, id_produto_filho, quantidade, sequencia_producao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9757 (class 0 OID 23332)
-- Dependencies: 531
-- Data for Name: corp_produto_grupo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_produto_grupo (id, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9758 (class 0 OID 23343)
-- Dependencies: 532
-- Data for Name: corp_produto_marca; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_produto_marca (id, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9759 (class 0 OID 23354)
-- Dependencies: 533
-- Data for Name: corp_produto_promocao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_produto_promocao (id, id_produto, data_inicio, data_fim, quantidade_em_promocao, quantidade_maxima_cliente, valor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9760 (class 0 OID 23367)
-- Dependencies: 534
-- Data for Name: corp_produto_subgrupo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_produto_subgrupo (id, id_produto_grupo, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9761 (class 0 OID 23379)
-- Dependencies: 535
-- Data for Name: corp_produto_unidade; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_produto_unidade (id, sigla, descricao, pode_fracionar, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9762 (class 0 OID 23391)
-- Dependencies: 536
-- Data for Name: corp_setor; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_setor (id, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9763 (class 0 OID 23402)
-- Dependencies: 537
-- Data for Name: corp_sindicato; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_sindicato (id, nome, codigo_banco, codigo_agencia, conta_banco, codigo_cedente, logradouro, numero, bairro, municipio_ibge, uf, fone1, fone2, email, tipo_sindicato, data_base, piso_salarial, cnpj, classificacao_contabil_conta, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9764 (class 0 OID 23430)
-- Dependencies: 538
-- Data for Name: corp_tabela_preco; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_tabela_preco (id, nome, principal, coeficiente, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9765 (class 0 OID 23442)
-- Dependencies: 539
-- Data for Name: corp_tipo_admissao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_tipo_admissao (id, codigo, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9766 (class 0 OID 23455)
-- Dependencies: 540
-- Data for Name: corp_tipo_relacionamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_tipo_relacionamento (id, codigo, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9767 (class 0 OID 23468)
-- Dependencies: 541
-- Data for Name: corp_transportadora; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_transportadora (id, id_pessoa, data_cadastro, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9866 (class 0 OID 25741)
-- Dependencies: 640
-- Data for Name: corp_uf; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_uf (id, sigla, nome, codigo_ibge, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9770 (class 0 OID 23503)
-- Dependencies: 544
-- Data for Name: corp_vendedor; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.corp_vendedor (id, id_colaborador, id_comissao_perfil, comissao, meta_venda, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9968 (class 0 OID 27289)
-- Dependencies: 742
-- Data for Name: ctbl_conta; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_conta (id, id_plano_conta, id_ctbl_conta, id_plano_conta_ref_sped, classificacao, tipo, descricao, data_inclusao, situacao, natureza, patrimonio_resultado, livro_caixa, dfc, ordem, codigo_reduzido, codigo_efd, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9969 (class 0 OID 27312)
-- Dependencies: 743
-- Data for Name: ctbl_conta_rateio; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_conta_rateio (id, id_centro_resultado, id_ctbl_conta, porcento_rateio, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9970 (class 0 OID 27324)
-- Dependencies: 744
-- Data for Name: ctbl_dre_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_dre_cab (id, descricao, padrao, periodo_inicial, periodo_final, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9971 (class 0 OID 27337)
-- Dependencies: 745
-- Data for Name: ctbl_dre_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_dre_det (id, id_ctbl_dre_cab, classificacao, descricao, forma_calculo, sinal, natureza, valor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9972 (class 0 OID 27353)
-- Dependencies: 746
-- Data for Name: ctbl_encerramento_exe_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_encerramento_exe_cab (id, data_inicio, data_fim, data_inclusao, motivo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9973 (class 0 OID 27363)
-- Dependencies: 747
-- Data for Name: ctbl_encerramento_exe_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_encerramento_exe_det (id, id_ctbl_conta, id_ctbl_encerramento_exe, saldo_anterior, valor_debito, valor_credito, saldo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9974 (class 0 OID 27378)
-- Dependencies: 748
-- Data for Name: ctbl_fechamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_fechamento (id, data_inicio, data_fim, criterio_lancamento, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9975 (class 0 OID 27388)
-- Dependencies: 749
-- Data for Name: ctbl_historico; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_historico (id, descricao, historico, pede_complemento, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9976 (class 0 OID 27400)
-- Dependencies: 750
-- Data for Name: ctbl_indice; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_indice (id, indice, periodicidade, diario_a_partir_de, mensal_mes_ano, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9977 (class 0 OID 27412)
-- Dependencies: 751
-- Data for Name: ctbl_indice_valor; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_indice_valor (id, id_ctbl_indice, data_indice, valor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9978 (class 0 OID 27423)
-- Dependencies: 752
-- Data for Name: ctbl_lancamento_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_lancamento_cab (id, id_ctbl_lote, data_lancamento, data_inclusao, tipo, liberado, valor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9979 (class 0 OID 27436)
-- Dependencies: 753
-- Data for Name: ctbl_lancamento_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_lancamento_det (id, id_ctbl_conta, id_ctbl_historico, id_ctbl_lancamento_cab, historico, valor, tipo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9980 (class 0 OID 27451)
-- Dependencies: 754
-- Data for Name: ctbl_lancamento_orcado; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_lancamento_orcado (id, id_ctbl_conta, ano, janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9981 (class 0 OID 27474)
-- Dependencies: 755
-- Data for Name: ctbl_lancamento_padrao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_lancamento_padrao (id, descricao, historico, id_conta_debito, id_conta_credito, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9982 (class 0 OID 27487)
-- Dependencies: 756
-- Data for Name: ctbl_livro; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_livro (id, descricao, competencia, forma_escrituracao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9983 (class 0 OID 27499)
-- Dependencies: 757
-- Data for Name: ctbl_lote; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_lote (id, descricao, liberado, data_inclusao, data_liberacao, programado, valor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9984 (class 0 OID 27512)
-- Dependencies: 758
-- Data for Name: ctbl_parametro; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_parametro (id, mascara, niveis, informar_conta_por, compartilha_plano_conta, compartilha_historicos, altera_lancamento_outro, historico_obrigatorio, permite_lancamento_zerado, gera_informativo_sped, sped_forma_escrit_diario, sped_nome_livro_diario, assinatura_direita, assinatura_esquerda, conta_ativo, conta_passivo, conta_patrimonio_liquido, conta_depreciacao_acumulada, conta_capital_social, conta_resultado_exercicio, conta_prejuizo_acumulado, conta_lucro_acumulado, conta_titulo_pagar, conta_titulo_receber, conta_juros_passivo, conta_juros_ativo, conta_desconto_obtido, conta_desconto_concedido, conta_cmv, conta_venda, conta_venda_servico, conta_estoque, conta_apura_resultado, conta_juros_apropriar, id_hist_padrao_resultado, id_hist_padrao_lucro, id_hist_padrao_prejuizo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9843 (class 0 OID 25518)
-- Dependencies: 617
-- Data for Name: ctbl_patrim_estado_conservacao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_patrim_estado_conservacao (id, codigo, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9844 (class 0 OID 25531)
-- Dependencies: 618
-- Data for Name: ctbl_patrim_indice_atualizacao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_patrim_indice_atualizacao (id, data_indice, nome, valor, valor_alternativo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9986 (class 0 OID 27575)
-- Dependencies: 760
-- Data for Name: ctbl_plano_conta; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_plano_conta (id, nome, data_inclusao, mascara, niveis, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao, codigo_plano) FROM stdin;
\.


--
-- TOC entry 9987 (class 0 OID 27587)
-- Dependencies: 761
-- Data for Name: ctbl_plano_conta_ref_sped; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_plano_conta_ref_sped (id, cod_cta_ref, descricao, orientacoes, inicio_validade, fim_validade, tipo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9985 (class 0 OID 27557)
-- Dependencies: 759
-- Data for Name: ctbl_termo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctbl_termo (id, id_ctbl_livro, abertura_encerramento, numero, pagina_inicial, pagina_final, registrado, numero_registro, data_despacho, data_abertura, data_encerramento, escrituracao_inicio, escrituracao_fim, texto, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9845 (class 0 OID 25543)
-- Dependencies: 619
-- Data for Name: ctrs_tipo_servico; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.ctrs_tipo_servico (id, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9476 (class 0 OID 16967)
-- Dependencies: 250
-- Data for Name: fina_cad_doc_origem; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cad_doc_origem (id, codigo, sigla, descricao, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9474 (class 0 OID 16955)
-- Dependencies: 248
-- Data for Name: fina_cad_nat_financeira; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cad_nat_financeira (id, codigo, descricao, tipo, aplicacao, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9478 (class 0 OID 16981)
-- Dependencies: 252
-- Data for Name: fina_cad_status_parcela; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cad_status_parcela (id, situacao, descricao, procedimento, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9480 (class 0 OID 16996)
-- Dependencies: 254
-- Data for Name: fina_cad_tipo_pagto; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cad_tipo_pagto (id, codigo, descricao, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9482 (class 0 OID 17008)
-- Dependencies: 256
-- Data for Name: fina_cad_tipo_receb; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cad_tipo_receb (id, codigo, descricao, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9490 (class 0 OID 17070)
-- Dependencies: 264
-- Data for Name: fina_cap_lancamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cap_lancamento (id, id_doc_origem, id_nat_financeira, id_fornecedor, id_conta_caixa, quantidade_parcela, valor_total, data_lancamento, numero_documento, primeiro_vencimento, intervalo_parcelas_dias, dia_fixo, historico, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9492 (class 0 OID 17109)
-- Dependencies: 266
-- Data for Name: fina_cap_parcela; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cap_parcela (id, id_lancamento, id_status_parcela, id_tipo_pagto, numero_parcela, data_emissao, data_vencimento, data_pagamento, valor_parcela, valor_pago, valor_desconto, valor_juros, valor_multa, historico, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9494 (class 0 OID 17141)
-- Dependencies: 268
-- Data for Name: fina_car_lancamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_car_lancamento (id, id_doc_origem, id_nat_financeira, id_cliente, id_conta_caixa, quantidade_parcela, valor_total, data_lancamento, numero_documento, primeiro_vencimento, intervalo_parcelas_dias, dia_fixo, historico, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9496 (class 0 OID 17180)
-- Dependencies: 270
-- Data for Name: fina_car_parcela; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_car_parcela (id, id_lancamento, id_status_parcela, id_tipo_receb, numero_parcela, data_emissao, data_vencimento, data_recebimento, valor_parcela, valor_recebido, valor_desconto, valor_juros, valor_multa, historico, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9504 (class 0 OID 17304)
-- Dependencies: 278
-- Data for Name: fina_cbk_conc; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cbk_conc (id, id_conta_caixa, periodo_inicio, periodo_fim, saldo_inicial_banco, saldo_final_banco, saldo_inicial_sis, saldo_final_sis, status, observacao, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9506 (class 0 OID 17326)
-- Dependencies: 280
-- Data for Name: fina_cbk_conc_item; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cbk_conc_item (id, id_conciliacao, id_extrato, id_cap_parcela, id_car_parcela, id_edi_linha, tipo_origem, status_match, diferenca_valor, observacao, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9484 (class 0 OID 17020)
-- Dependencies: 258
-- Data for Name: fina_cxb_banco; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cxb_banco (id, codigo, nome, url, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9486 (class 0 OID 17032)
-- Dependencies: 260
-- Data for Name: fina_cxb_banco_agencia; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cxb_banco_agencia (id, id_banco, numero, digito, nome, telefone, contato, observacao, gerente, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9488 (class 0 OID 17052)
-- Dependencies: 262
-- Data for Name: fina_cxb_conta_caixa; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cxb_conta_caixa (id, id_banco_agencia, numero, digito, nome, tipo, descricao, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9502 (class 0 OID 17266)
-- Dependencies: 276
-- Data for Name: fina_cxb_extrato; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_cxb_extrato (id, id_conta_caixa, data_movimento, historico, documento, tipo_lancamento, valor, saldo_apos, id_cap_parcela, id_car_parcela, id_edi_linha, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9498 (class 0 OID 17212)
-- Dependencies: 272
-- Data for Name: fina_edi_arquivo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_edi_arquivo (id, id_conta_caixa, tipo_arquivo, banco_codigo, banco_nome, data_geracao, hora_geracao, nome_arquivo, caminho_arquivo, layout, sequencial_arquivo, total_registros, total_titulos, valor_total, status_processamento, mensagem_erro, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9500 (class 0 OID 17234)
-- Dependencies: 274
-- Data for Name: fina_edi_linha; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_edi_linha (id, id_arquivo, linha_numero, linha_conteudo, id_cap_parcela, id_car_parcela, nosso_numero, numero_documento, data_vencimento, valor_titulo, data_ocorrencia, codigo_ocorrencia, descricao_ocorrencia, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9516 (class 0 OID 17515)
-- Dependencies: 290
-- Data for Name: fina_fcx_previsto; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_fcx_previsto (id, id_conta_caixa, data_prevista, tipo_fluxo, origem, id_cap_parcela, id_car_parcela, id_tes_movimento, valor_previsto, valor_realizado, data_realizacao, id_extrato, status, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9518 (class 0 OID 17559)
-- Dependencies: 292
-- Data for Name: fina_fcx_saldo_diario; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_fcx_saldo_diario (id, id_conta_caixa, data_referencia, saldo_inicial, total_entradas, total_saidas, saldo_final, origem_calculo, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9999 (class 0 OID 28547)
-- Dependencies: 773
-- Data for Name: fina_plano_contas; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_plano_contas (id, codigo_estrutural, descricao, tipo) FROM stdin;
\.


--
-- TOC entry 9512 (class 0 OID 17441)
-- Dependencies: 286
-- Data for Name: fina_tes_aplicacao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_tes_aplicacao (id, id_conta_origem, id_conta_aplicacao, data_aplicacao, valor_aplicado, taxa_juros_anual, indice_correcao, data_vencimento, tipo_aplicacao, numero_contrato, id_mov_origem, id_mov_destino, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9508 (class 0 OID 17370)
-- Dependencies: 282
-- Data for Name: fina_tes_movimento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_tes_movimento (id, id_conta_caixa, data_movimento, tipo_movimento, origem, historico, documento, valor, id_cap_parcela, id_car_parcela, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9514 (class 0 OID 17478)
-- Dependencies: 288
-- Data for Name: fina_tes_resgate; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_tes_resgate (id, id_aplicacao, id_conta_destino, data_resgate, valor_resgatado, valor_juros, valor_imposto, valor_iof, id_mov_origem, id_mov_destino, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9510 (class 0 OID 17404)
-- Dependencies: 284
-- Data for Name: fina_tes_transferencia; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_tes_transferencia (id, id_conta_origem, id_conta_destino, data_movimento, valor, historico, documento, status, id_mov_origem, id_mov_destino, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 10001 (class 0 OID 28558)
-- Dependencies: 775
-- Data for Name: fina_titulo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fina_titulo (id, id_pessoa, id_plano_contas, tipo_titulo, numero_documento, data_emissao, data_vencimento, valor_original, valor_saldo, status, id_origem_venda) FROM stdin;
\.


--
-- TOC entry 9459 (class 0 OID 16621)
-- Dependencies: 233
-- Data for Name: fisc_aidf_aimdf; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_aidf_aimdf (id, numero, data_validade, data_autorizacao, numero_autorizacao, formulario_disponivel, criado_em, usu_criacao, atualizado_em, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9833 (class 0 OID 25361)
-- Dependencies: 607
-- Data for Name: fisc_cfop; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cfop (id, codigo, descricao, aplicacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9834 (class 0 OID 25375)
-- Dependencies: 608
-- Data for Name: fisc_csosn; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_csosn (id, codigo, descricao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9835 (class 0 OID 25389)
-- Dependencies: 609
-- Data for Name: fisc_cst_cofins; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cst_cofins (id, codigo, descricao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9836 (class 0 OID 25403)
-- Dependencies: 610
-- Data for Name: fisc_cst_icms; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cst_icms (id, codigo, descricao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9837 (class 0 OID 25417)
-- Dependencies: 611
-- Data for Name: fisc_cst_ipi; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cst_ipi (id, codigo, descricao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9838 (class 0 OID 25431)
-- Dependencies: 612
-- Data for Name: fisc_cst_pis; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cst_pis (id, codigo, descricao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9610 (class 0 OID 21398)
-- Dependencies: 384
-- Data for Name: fisc_cte_aereo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_aereo (id, id_cte_cabecalho, numero_minuta, numero_conhecimento, data_prevista_entrega, id_emissor, id_interna_tomador, tarifa_classe, tarifa_codigo, tarifa_valor, carga_dimensao, carga_informacao_manuseio, carga_especial, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9612 (class 0 OID 21425)
-- Dependencies: 386
-- Data for Name: fisc_cte_aquaviario; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_aquaviario (id, id_cte_cabecalho, valor_prestacao, afrmm, numero_booking, numero_controle, id_navio, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9614 (class 0 OID 21447)
-- Dependencies: 388
-- Data for Name: fisc_cte_aquaviario_balsa; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_aquaviario_balsa (id, id_cte_aquaviario, id_balsa, numero_viagem, direcao, porto_embarque, porto_transbordo, porto_destino, tipo_navegacao, irin, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9608 (class 0 OID 21321)
-- Dependencies: 382
-- Data for Name: fisc_cte_cabecalho; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_cabecalho (id, uf_emitente, codigo_numerico, cfop, natureza_operacao, forma_pagamento, modelo, serie, numero, data_hora_emissao, formato_impressao_dacte, tipo_emissao, chave_acesso, digito_chave_acesso, ambiente, tipo_cte, processo_emissao, versao_processo_emissao, chave_referenciado, codigo_municipio_envio, nome_municipio_envio, uf_envio, modal, tipo_servico, codigo_municipio_ini_prestacao, nome_municipio_ini_prestacao, uf_ini_prestacao, codigo_municipio_fim_prestacao, nome_municipio_fim_prestacao, uf_fim_prestacao, retira, retira_detalhe, tomador, data_entrada_contingencia, justificativa_contingencia, carac_adicional_transporte, carac_adicional_servico, funcionario_emissor, fluxo_origem, entrega_tipo_periodo, entrega_data_programada, entrega_data_inicial, entrega_data_final, entrega_tipo_hora, entrega_hora_programada, entrega_hora_inicial, entrega_hora_final, municipio_origem_calculo, municipio_destino_calculo, observacoes_gerais, valor_total_servico, valor_receber, cst, base_calculo_icms, aliquota_icms, valor_icms, percentual_reducao_bc_icms, valor_bc_icms_st_retido, valor_icms_st_retido, aliquota_icms_st_retido, valor_credito_presumido_icms, percentual_bc_icms_outra_uf, valor_bc_icms_outra_uf, aliquota_icms_outra_uf, valor_icms_outra_uf, simples_nacional_indicador, simples_nacional_total, informacoes_add_fisco, valor_total_carga, produto_predominante, carga_outras_caracteristicas, modal_versao_layout, chave_cte_substituido, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9616 (class 0 OID 21472)
-- Dependencies: 390
-- Data for Name: fisc_cte_carga; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_carga (id, id_cte_cabecalho, codigo_unidade_medida, tipo_medida, quantidade, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9618 (class 0 OID 21492)
-- Dependencies: 392
-- Data for Name: fisc_cte_componente; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_componente (id, id_cte_cabecalho, nome, valor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9620 (class 0 OID 21511)
-- Dependencies: 394
-- Data for Name: fisc_cte_destinatario; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_destinatario (id, id_cte_cabecalho, cnpj, cpf, ie, nome, fantasia, telefone, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, cep, codigo_pais, nome_pais, email, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao, id_pessoa) FROM stdin;
\.


--
-- TOC entry 9622 (class 0 OID 21547)
-- Dependencies: 396
-- Data for Name: fisc_cte_documento_anterior; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_documento_anterior (id, id_cte_cabecalho, cnpj, cpf, ie, uf, nome, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9624 (class 0 OID 21569)
-- Dependencies: 398
-- Data for Name: fisc_cte_documento_anterior_id; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_documento_anterior_id (id, id_cte_documento_anterior, tipo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9626 (class 0 OID 21581)
-- Dependencies: 400
-- Data for Name: fisc_cte_duplicata; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_duplicata (id, id_cte_cabecalho, numero, data_vencimento, valor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9628 (class 0 OID 21600)
-- Dependencies: 402
-- Data for Name: fisc_cte_dutoviario; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_dutoviario (id, id_cte_cabecalho, valor_tarifa, data_inicio, data_fim, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9630 (class 0 OID 21618)
-- Dependencies: 404
-- Data for Name: fisc_cte_emitente; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_emitente (id, id_cte_cabecalho, cnpj, ie, nome, fantasia, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, cep, telefone, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao, id_pessoa) FROM stdin;
\.


--
-- TOC entry 9632 (class 0 OID 21650)
-- Dependencies: 406
-- Data for Name: fisc_cte_expedidor; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_expedidor (id, id_cte_cabecalho, cnpj, cpf, ie, nome, fantasia, telefone, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, cep, codigo_pais, nome_pais, email, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao, id_pessoa) FROM stdin;
\.


--
-- TOC entry 9634 (class 0 OID 21686)
-- Dependencies: 408
-- Data for Name: fisc_cte_fatura; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_fatura (id, id_cte_cabecalho, numero, valor_original, valor_desconto, valor_liquido, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9636 (class 0 OID 21707)
-- Dependencies: 410
-- Data for Name: fisc_cte_ferroviario; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_ferroviario (id, id_cte_cabecalho, tipo_trafego, responsavel_faturamento, ferrovia_emitente_cte, fluxo, id_trem, valor_frete, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9638 (class 0 OID 21730)
-- Dependencies: 412
-- Data for Name: fisc_cte_ferroviario_ferrovia; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_ferroviario_ferrovia (id, id_cte_ferroviario, cnpj, codigo_interno, ie, nome, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, cep, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9640 (class 0 OID 21761)
-- Dependencies: 414
-- Data for Name: fisc_cte_ferroviario_vagao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_ferroviario_vagao (id, id_cte_ferroviario, numero_vagao, capacidade, tipo_vagao, peso_real, peso_bc, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9648 (class 0 OID 21857)
-- Dependencies: 422
-- Data for Name: fisc_cte_inf_nf_carga_lacre; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_inf_nf_carga_lacre (id, id_cte_informacao_nf_carga, numero, quantidade_rateada, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9650 (class 0 OID 21876)
-- Dependencies: 424
-- Data for Name: fisc_cte_inf_nf_transporte_lacre; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_inf_nf_transporte_lacre (id, id_cte_informacao_nf_transporte, numero, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9646 (class 0 OID 21838)
-- Dependencies: 420
-- Data for Name: fisc_cte_informacao_nf_carga; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_informacao_nf_carga (id, id_cte_informacao_nf, tipo_unidade_carga, id_unidade_carga, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9642 (class 0 OID 21783)
-- Dependencies: 416
-- Data for Name: fisc_cte_informacao_nf_outros; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_informacao_nf_outros (id, id_cte_cabecalho, numero_romaneio, numero_pedido, chave_acesso_nfe, codigo_modelo, serie, numero, data_emissao, uf_emitente, base_calculo_icms, valor_icms, base_calculo_icms_st, valor_icms_st, valor_total_produtos, valor_total, cfop_predominante, peso_total_kg, pin_suframa, data_prevista_entrega, outro_tipo_doc_orig, outro_descricao, outro_valor_documento, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9644 (class 0 OID 21819)
-- Dependencies: 418
-- Data for Name: fisc_cte_informacao_nf_transporte; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_informacao_nf_transporte (id, id_cte_informacao_nf, tipo_unidade_transporte, id_unidade_transporte, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9652 (class 0 OID 21894)
-- Dependencies: 426
-- Data for Name: fisc_cte_local_coleta; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_local_coleta (id, id_cte_cabecalho, cnpj, cpf, nome, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao, id_pessoa) FROM stdin;
\.


--
-- TOC entry 9654 (class 0 OID 21923)
-- Dependencies: 428
-- Data for Name: fisc_cte_local_entrega; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_local_entrega (id, id_cte_cabecalho, cnpj, cpf, nome, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao, id_pessoa) FROM stdin;
\.


--
-- TOC entry 9656 (class 0 OID 21952)
-- Dependencies: 430
-- Data for Name: fisc_cte_multimodal; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_multimodal (id, id_cte_cabecalho, cotm, indicador_negociavel, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9658 (class 0 OID 21971)
-- Dependencies: 432
-- Data for Name: fisc_cte_passagem; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_passagem (id, id_cte_cabecalho, sigla_passagem, sigla_destino, rota, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9660 (class 0 OID 21991)
-- Dependencies: 434
-- Data for Name: fisc_cte_perigoso; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_perigoso (id, id_cte_cabecalho, numero_onu, nome_apropriado, classe_risco, grupo_embalagem, quantidade_total_produto, quantidade_tipo_volume, ponto_fulgor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9662 (class 0 OID 22015)
-- Dependencies: 436
-- Data for Name: fisc_cte_recebedor; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_recebedor (id, id_cte_cabecalho, cnpj, cpf, ie, nome, fantasia, telefone, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, cep, codigo_pais, nome_pais, email, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao, id_pessoa) FROM stdin;
\.


--
-- TOC entry 9664 (class 0 OID 22051)
-- Dependencies: 438
-- Data for Name: fisc_cte_remetente; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_remetente (id, id_cte_cabecalho, cnpj, cpf, ie, nome, fantasia, telefone, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, cep, codigo_pais, nome_pais, email, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao, id_pessoa) FROM stdin;
\.


--
-- TOC entry 9666 (class 0 OID 22087)
-- Dependencies: 440
-- Data for Name: fisc_cte_rodoviario; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_rodoviario (id, id_cte_cabecalho, rntrc, data_prevista_entrega, indicador_lotacao, ciot, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9668 (class 0 OID 22107)
-- Dependencies: 442
-- Data for Name: fisc_cte_rodoviario_lacre; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_rodoviario_lacre (id, id_cte_rodoviario, numero, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9670 (class 0 OID 22125)
-- Dependencies: 444
-- Data for Name: fisc_cte_rodoviario_motorista; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_rodoviario_motorista (id, id_cte_rodoviario, nome, cpf, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9672 (class 0 OID 22144)
-- Dependencies: 446
-- Data for Name: fisc_cte_rodoviario_occ; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_rodoviario_occ (id, id_cte_rodoviario, serie, numero, data_emissao, cnpj, codigo_interno, ie, uf, telefone, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9674 (class 0 OID 22168)
-- Dependencies: 448
-- Data for Name: fisc_cte_rodoviario_pedagio; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_rodoviario_pedagio (id, id_cte_rodoviario, cnpj_fornecedor, comprovante_compra, cnpj_responsavel, valor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9676 (class 0 OID 22189)
-- Dependencies: 450
-- Data for Name: fisc_cte_rodoviario_veiculo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_rodoviario_veiculo (id, id_cte_rodoviario, codigo_interno, renavam, placa, tara, capacidade_kg, capacidade_m3, tipo_propriedade, tipo_veiculo, tipo_rodado, tipo_carroceria, uf, proprietario_cpf, proprietario_cnpj, proprietario_rntrc, proprietario_nome, proprietario_ie, proprietario_uf, proprietario_tipo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9678 (class 0 OID 22224)
-- Dependencies: 452
-- Data for Name: fisc_cte_seguro; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_seguro (id, id_cte_cabecalho, responsavel, seguradora, apolice, averbacao, valor_carga, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9680 (class 0 OID 22246)
-- Dependencies: 454
-- Data for Name: fisc_cte_tomador; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_tomador (id, id_cte_cabecalho, cnpj, cpf, ie, nome, fantasia, telefone, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, cep, codigo_pais, nome_pais, email, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao, id_pessoa) FROM stdin;
\.


--
-- TOC entry 9682 (class 0 OID 22282)
-- Dependencies: 456
-- Data for Name: fisc_cte_veiculo_novo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_cte_veiculo_novo (id, id_cte_cabecalho, chassi, cor, descricao_cor, codigo_marca_modelo, valor_unitario, valor_frete, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9839 (class 0 OID 25445)
-- Dependencies: 613
-- Data for Name: fisc_ecf_aliquotas; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_ecf_aliquotas (id, totalizador_parcial, ecf_icms_st, paf_p_st, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9841 (class 0 OID 25468)
-- Dependencies: 615
-- Data for Name: fisc_municipal_regime; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_municipal_regime (id, uf, codigo, nome, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9522 (class 0 OID 19560)
-- Dependencies: 296
-- Data for Name: fisc_nfe; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe (id, id_vendedor, id_fornecedor, id_cliente, id_tribut_operacao_fiscal, id_venda_cabecalho, id_nfce_movimento, uf_emitente, codigo_numerico, natureza_operacao, codigo_modelo, serie, numero, data_hora_emissao, data_hora_entrada_saida, tipo_operacao, local_destino, codigo_municipio, formato_impressao_danfe, tipo_emissao, chave_acesso, digito_chave_acesso, ambiente, finalidade_emissao, consumidor_operacao, consumidor_presenca, processo_emissao, versao_processo_emissao, data_entrada_contingencia, justificativa_contingencia, base_calculo_icms, valor_icms, valor_icms_desonerado, total_icms_fcp_uf_destino, total_icms_interestadual_uf_destino, total_icms_interestadual_uf_remente, valor_total_fcp, base_calculo_icms_st, valor_icms_st, valor_total_fcp_st, valor_total_fcp_st_retido, valor_total_produtos, valor_frete, valor_seguro, valor_desconto, valor_imposto_importacao, valor_ipi, valor_ipi_devolvido, valor_pis, valor_cofins, valor_despesas_acessorias, valor_total, valor_total_tributos, valor_servicos, base_calculo_issqn, valor_issqn, valor_pis_issqn, valor_cofins_issqn, data_prestacao_servico, valor_deducao_issqn, outras_retencoes_issqn, desconto_incondicionado_issqn, desconto_condicionado_issqn, total_retencao_issqn, regime_especial_tributacao, valor_retido_pis, valor_retido_cofins, valor_retido_csll, base_calculo_irrf, valor_retido_irrf, base_calculo_previdencia, valor_retido_previdencia, informacoes_add_fisco, informacoes_add_contribuinte, comex_uf_embarque, comex_local_embarque, comex_local_despacho, compra_nota_empenho, compra_pedido, compra_contrato, qrcode, url_chave, status_nota, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9520 (class 0 OID 19541)
-- Dependencies: 294
-- Data for Name: fisc_nfe_acesso_xml; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_acesso_xml (id, id_nfe_cabecalho, cnpj, cpf, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9524 (class 0 OID 19653)
-- Dependencies: 298
-- Data for Name: fisc_nfe_cana; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_cana (id, id_nfe_cabecalho, safra, mes_ano_referencia, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9526 (class 0 OID 19672)
-- Dependencies: 300
-- Data for Name: fisc_nfe_cana_deducoes_safra; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_cana_deducoes_safra (id, id_nfe_cana, decricao, valor_deducao, valor_fornecimento, valor_total_deducao, valor_liquido_fornecimento, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9528 (class 0 OID 19694)
-- Dependencies: 302
-- Data for Name: fisc_nfe_cana_fornecimento_diario; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_cana_fornecimento_diario (id, id_nfe_cana, dia, quantidade, quantidade_total_mes, quantidade_total_anterior, quantidade_total_geral, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9530 (class 0 OID 19716)
-- Dependencies: 304
-- Data for Name: fisc_nfe_configuracao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_configuracao (id, certificado_digital_serie, certificado_digital_caminho, certificado_digital_senha, tipo_emissao, formato_impressao_danfe, processo_emissao, versao_processo_emissao, caminho_logomarca, salvar_xml, caminho_salvar_xml, caminho_schemas, caminho_arquivo_danfe, caminho_salvar_pdf, webservice_uf, webservice_ambiente, webservice_proxy_host, webservice_proxy_porta, webservice_proxy_usuario, webservice_proxy_senha, webservice_visualizar, email_servidor_smtp, email_porta, email_usuario, email_senha, email_assunto, email_autentica_ssl, email_texto, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9532 (class 0 OID 19748)
-- Dependencies: 306
-- Data for Name: fisc_nfe_cte_referenciado; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_cte_referenciado (id, id_nfe_cabecalho, chave_acesso, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9534 (class 0 OID 19766)
-- Dependencies: 308
-- Data for Name: fisc_nfe_cupom_fiscal_referenciado; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_cupom_fiscal_referenciado (id, id_nfe_cabecalho, modelo_documento_fiscal, numero_ordem_ecf, coo, data_emissao_cupom, numero_caixa, numero_serie_ecf, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9574 (class 0 OID 20354)
-- Dependencies: 348
-- Data for Name: fisc_nfe_declaracao_importacao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_declaracao_importacao (id, id_nfe_detalhe, numero_documento, data_registro, local_desembaraco, uf_desembaraco, data_desembaraco, via_transporte, valor_afrmm, forma_intermediacao, cnpj, uf_terceiro, codigo_exportador, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9536 (class 0 OID 19788)
-- Dependencies: 310
-- Data for Name: fisc_nfe_destinatario; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_destinatario (id, id_nfe_cabecalho, cnpj, cpf, estrangeiro_identificacao, nome, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, cep, codigo_pais, nome_pais, telefone, indicador_ie, inscricao_estadual, suframa, inscricao_municipal, email, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9538 (class 0 OID 19827)
-- Dependencies: 312
-- Data for Name: fisc_nfe_det_especifico_armamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_det_especifico_armamento (id, id_nfe_detalhe, tipo_arma, numero_serie_arma, numero_serie_cano, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9540 (class 0 OID 19848)
-- Dependencies: 314
-- Data for Name: fisc_nfe_det_especifico_combustivel; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_det_especifico_combustivel (id, id_nfe_detalhe, codigo_anp, descricao_anp, percentual_glp, percentual_gas_nacional, percentual_gas_importado, valor_partida, codif, quantidade_temp_ambiente, uf_consumo, cide_base_calculo, cide_aliquota, cide_valor, encerrante_bico, encerrante_bomba, encerrante_tanque, encerrante_valor_inicio, encerrante_valor_fim, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9542 (class 0 OID 19882)
-- Dependencies: 316
-- Data for Name: fisc_nfe_det_especifico_medicamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_det_especifico_medicamento (id, id_nfe_detalhe, codigo_anvisa, motivo_isencao, preco_maximo_consumidor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9544 (class 0 OID 19902)
-- Dependencies: 318
-- Data for Name: fisc_nfe_det_especifico_veiculo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_det_especifico_veiculo (id, id_nfe_detalhe, tipo_operacao, chassi, cor, descricao_cor, potencia_motor, cilindradas, peso_liquido, peso_bruto, numero_serie, tipo_combustivel, numero_motor, capacidade_maxima_tracao, distancia_eixos, ano_modelo, ano_fabricacao, tipo_pintura, tipo_veiculo, especie_veiculo, condicao_vin, condicao_veiculo, codigo_marca_modelo, codigo_cor_denatran, lotacao_maxima, restricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9546 (class 0 OID 19943)
-- Dependencies: 320
-- Data for Name: fisc_nfe_detalhe; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_detalhe (id, id_nfe_cabecalho, id_produto, numero_item, codigo_produto, gtin, nome_produto, ncm, nve, cest, indicador_escala_relevante, cnpj_fabricante, codigo_beneficio_fiscal, ex_tipi, cfop, unidade_comercial, quantidade_comercial, numero_pedido_compra, item_pedido_compra, numero_fci, numero_recopi, valor_unitario_comercial, valor_bruto_produto, gtin_unidade_tributavel, unidade_tributavel, quantidade_tributavel, valor_unitario_tributavel, valor_frete, valor_seguro, valor_desconto, valor_outras_despesas, entra_total, valor_total_tributos, percentual_devolvido, valor_ipi_devolvido, informacoes_adicionais, valor_subtotal, valor_total, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao, tributacao_json) FROM stdin;
\.


--
-- TOC entry 9548 (class 0 OID 19998)
-- Dependencies: 322
-- Data for Name: fisc_nfe_detalhe_imposto_cofins; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_detalhe_imposto_cofins (id, id_nfe_detalhe, cst_cofins, base_calculo_cofins, aliquota_cofins_percentual, quantidade_vendida, aliquota_cofins_reais, valor_cofins, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9550 (class 0 OID 20021)
-- Dependencies: 324
-- Data for Name: fisc_nfe_detalhe_imposto_cofins_st; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_detalhe_imposto_cofins_st (id, id_nfe_detalhe, base_calculo_cofins_st, aliquota_cofins_st_percentual, quantidade_vendida_cofins_st, aliquota_cofins_st_reais, valor_cofins_st, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9552 (class 0 OID 20043)
-- Dependencies: 326
-- Data for Name: fisc_nfe_detalhe_imposto_icms; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_detalhe_imposto_icms (id, id_nfe_detalhe, origem_mercadoria, cst_icms, csosn, modalidade_bc_icms, percentual_reducao_bc_icms, valor_bc_icms, aliquota_icms, valor_icms_operacao, percentual_diferimento, valor_icms_diferido, valor_icms, base_calculo_fcp, percentual_fcp, valor_fcp, modalidade_bc_icms_st, percentual_mva_icms_st, percentual_reducao_bc_icms_st, valor_base_calculo_icms_st, aliquota_icms_st, valor_icms_st, base_calculo_fcp_st, percentual_fcp_st, valor_fcp_st, uf_st, percentual_bc_operacao_propria, valor_bc_icms_st_retido, aliquota_suportada_consumidor, valor_icms_substituto, valor_icms_st_retido, base_calculo_fcp_st_retido, percentual_fcp_st_retido, valor_fcp_st_retido, motivo_desoneracao_icms, valor_icms_desonerado, aliquota_credito_icms_sn, valor_credito_icms_sn, valor_bc_icms_st_destino, valor_icms_st_destino, percentual_reducao_bc_efetivo, valor_bc_efetivo, aliquota_icms_efetivo, valor_icms_efetivo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9554 (class 0 OID 20102)
-- Dependencies: 328
-- Data for Name: fisc_nfe_detalhe_imposto_icms_ufdest; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_detalhe_imposto_icms_ufdest (id, id_nfe_detalhe, valor_bc_icms_uf_destino, valor_bc_fcp_uf_destino, percentual_fcp_uf_destino, aliquota_interna_uf_destino, aliquota_interesdatual_uf_envolvidas, percentual_provisorio_partilha_icms, valor_icms_fcp_uf_destino, valor_interestadual_uf_destino, valor_interestadual_uf_remetente, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9556 (class 0 OID 20128)
-- Dependencies: 330
-- Data for Name: fisc_nfe_detalhe_imposto_ii; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_detalhe_imposto_ii (id, id_nfe_detalhe, valor_bc_ii, valor_despesas_aduaneiras, valor_imposto_importacao, valor_iof, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9558 (class 0 OID 20149)
-- Dependencies: 332
-- Data for Name: fisc_nfe_detalhe_imposto_ipi; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_detalhe_imposto_ipi (id, id_nfe_detalhe, cnpj_produtor, codigo_selo_ipi, quantidade_selo_ipi, enquadramento_legal_ipi, cst_ipi, valor_base_calculo_ipi, quantidade_unidade_tributavel, valor_unidade_tributavel, aliquota_ipi, valor_ipi, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9560 (class 0 OID 20176)
-- Dependencies: 334
-- Data for Name: fisc_nfe_detalhe_imposto_issqn; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_detalhe_imposto_issqn (id, id_nfe_detalhe, base_calculo_issqn, aliquota_issqn, valor_issqn, municipio_issqn, item_lista_servicos, valor_deducao, valor_outras_retencoes, valor_desconto_incondicionado, valor_desconto_condicionado, valor_retencao_iss, indicador_exigibilidade_iss, codigo_servico, municipio_incidencia, pais_sevico_prestado, numero_processo, indicador_incentivo_fiscal, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9562 (class 0 OID 20209)
-- Dependencies: 336
-- Data for Name: fisc_nfe_detalhe_imposto_pis; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_detalhe_imposto_pis (id, id_nfe_detalhe, cst_pis, valor_base_calculo_pis, aliquota_pis_percentual, valor_pis, quantidade_vendida, aliquota_pis_reais, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9564 (class 0 OID 20232)
-- Dependencies: 338
-- Data for Name: fisc_nfe_detalhe_imposto_pis_st; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_detalhe_imposto_pis_st (id, id_nfe_detalhe, valor_base_calculo_pis_st, aliquota_pis_st_percentual, quantidade_vendida_pis_st, aliquota_pis_st_reais, valor_pis_st, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9568 (class 0 OID 20275)
-- Dependencies: 342
-- Data for Name: fisc_nfe_duplicata; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_duplicata (id, id_nfe_fatura, numero, data_vencimento, valor, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9570 (class 0 OID 20294)
-- Dependencies: 344
-- Data for Name: fisc_nfe_emitente; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_emitente (id, id_nfe_cabecalho, cnpj, cpf, nome, fantasia, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, cep, codigo_pais, nome_pais, telefone, inscricao_estadual, inscricao_estadual_st, inscricao_municipal, cnae, crt, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9572 (class 0 OID 20333)
-- Dependencies: 346
-- Data for Name: fisc_nfe_exportacao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_exportacao (id, id_nfe_detalhe, drawback, numero_registro, chave_acesso, quantidade, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9566 (class 0 OID 20254)
-- Dependencies: 340
-- Data for Name: fisc_nfe_fatura; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_fatura (id, id_nfe_cabecalho, numero, valor_original, valor_desconto, valor_liquido, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9576 (class 0 OID 20380)
-- Dependencies: 350
-- Data for Name: fisc_nfe_importacao_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_importacao_det (id, id_nfe_declaracao_importacao, numero_adicao, numero_sequencial, codigo_fabricante_estrangeiro, valor_desconto, drawback, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9578 (class 0 OID 20402)
-- Dependencies: 352
-- Data for Name: fisc_nfe_informacao_pagamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_informacao_pagamento (id, id_nfe_cabecalho, indicador_pagamento, meio_pagamento, valor, tipo_integracao, cnpj_operadora_cartao, bandeira, numero_autorizacao, troco, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9580 (class 0 OID 20427)
-- Dependencies: 354
-- Data for Name: fisc_nfe_item_rastreado; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_item_rastreado (id, id_nfe_detalhe, numero_lote, quantidade_itens, data_fabricacao, data_validade, codigo_agregacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9582 (class 0 OID 20447)
-- Dependencies: 356
-- Data for Name: fisc_nfe_local_entrega; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_local_entrega (id, id_nfe_cabecalho, cnpj, cpf, nome_recebedor, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, cep, codigo_pais, nome_pais, telefone, email, inscricao_estadual, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9584 (class 0 OID 20482)
-- Dependencies: 358
-- Data for Name: fisc_nfe_local_retirada; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_local_retirada (id, id_nfe_cabecalho, cnpj, cpf, nome_expedidor, logradouro, numero, complemento, bairro, codigo_municipio, nome_municipio, uf, cep, codigo_pais, nome_pais, telefone, email, inscricao_estadual, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9586 (class 0 OID 20517)
-- Dependencies: 360
-- Data for Name: fisc_nfe_nf_referenciada; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_nf_referenciada (id, id_nfe_cabecalho, codigo_uf, ano_mes, cnpj, modelo, serie, numero_nf, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9588 (class 0 OID 20540)
-- Dependencies: 362
-- Data for Name: fisc_nfe_numero; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_numero (id, serie, numero, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9590 (class 0 OID 20552)
-- Dependencies: 364
-- Data for Name: fisc_nfe_numero_inutilizado; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_numero_inutilizado (id, serie, numero, data_inutilizacao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9592 (class 0 OID 20566)
-- Dependencies: 366
-- Data for Name: fisc_nfe_processo_referenciado; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_processo_referenciado (id, id_nfe_cabecalho, identificador, origem, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9594 (class 0 OID 20585)
-- Dependencies: 368
-- Data for Name: fisc_nfe_prod_rural_referenciada; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_prod_rural_referenciada (id, id_nfe_cabecalho, codigo_uf, ano_mes, cnpj, cpf, inscricao_estadual, modelo, serie, numero_nf, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9596 (class 0 OID 20610)
-- Dependencies: 370
-- Data for Name: fisc_nfe_referenciada; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_referenciada (id, id_nfe_cabecalho, chave_acesso, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9598 (class 0 OID 20628)
-- Dependencies: 372
-- Data for Name: fisc_nfe_responsavel_tecnico; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_responsavel_tecnico (id, id_nfe_cabecalho, cnpj, contato, email, telefone, identificador_csrt, hash_csrt, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9600 (class 0 OID 20651)
-- Dependencies: 374
-- Data for Name: fisc_nfe_transporte; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_transporte (id, id_nfe_cabecalho, id_transportadora, modalidade_frete, cnpj, cpf, nome, inscricao_estadual, endereco, nome_municipio, uf, valor_servico, valor_bc_retencao_icms, aliquota_retencao_icms, valor_icms_retido, cfop, municipio, placa_veiculo, uf_veiculo, rntc_veiculo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9602 (class 0 OID 20687)
-- Dependencies: 376
-- Data for Name: fisc_nfe_transporte_reboque; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_transporte_reboque (id, id_nfe_transporte, placa, uf, rntc, vagao, balsa, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9604 (class 0 OID 20709)
-- Dependencies: 378
-- Data for Name: fisc_nfe_transporte_volume; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_transporte_volume (id, id_nfe_transporte, quantidade, especie, marca, numeracao, peso_liquido, peso_bruto, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9606 (class 0 OID 20732)
-- Dependencies: 380
-- Data for Name: fisc_nfe_transporte_volume_lacre; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_nfe_transporte_volume_lacre (id, id_nfe_transporte_volume, numero, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9855 (class 0 OID 25586)
-- Dependencies: 629
-- Data for Name: fisc_trib_cfop; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_trib_cfop (id, codigo, descricao, aplicacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9856 (class 0 OID 25600)
-- Dependencies: 630
-- Data for Name: fisc_trib_csosn; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_trib_csosn (id, codigo, descricao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9857 (class 0 OID 25614)
-- Dependencies: 631
-- Data for Name: fisc_trib_cst_cofins; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_trib_cst_cofins (id, codigo, descricao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9858 (class 0 OID 25628)
-- Dependencies: 632
-- Data for Name: fisc_trib_cst_icms; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_trib_cst_icms (id, codigo, descricao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9859 (class 0 OID 25642)
-- Dependencies: 633
-- Data for Name: fisc_trib_cst_ipi; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_trib_cst_ipi (id, codigo, descricao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9860 (class 0 OID 25656)
-- Dependencies: 634
-- Data for Name: fisc_trib_cst_pis; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_trib_cst_pis (id, codigo, descricao, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9861 (class 0 OID 25670)
-- Dependencies: 635
-- Data for Name: fisc_trib_ecf_aliquotas; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_trib_ecf_aliquotas (id, totalizador_parcial, ecf_icms_st, paf_p_st, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9768 (class 0 OID 23479)
-- Dependencies: 542
-- Data for Name: fisc_trib_grupo_tributario; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_trib_grupo_tributario (id, descricao, origem_mercadoria, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9769 (class 0 OID 23492)
-- Dependencies: 543
-- Data for Name: fisc_trib_icms_custom_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_trib_icms_custom_cab (id, descricao, origem_mercadoria, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9863 (class 0 OID 25694)
-- Dependencies: 637
-- Data for Name: fisc_trib_icms_uf; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_trib_icms_uf (id, id_tribut_configura_of_gt, uf_destino, cfop, csosn, cst, modalidade_bc, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9862 (class 0 OID 25682)
-- Dependencies: 636
-- Data for Name: fisc_trib_municipal_regime; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_trib_municipal_regime (id, uf, codigo, nome, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9842 (class 0 OID 25480)
-- Dependencies: 616
-- Data for Name: fisc_tribut_icms_uf; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.fisc_tribut_icms_uf (id, id_tribut_configura_of_gt, uf_destino, cfop, csosn, cst, modalidade_bc, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9926 (class 0 OID 27073)
-- Dependencies: 700
-- Data for Name: orca_orcamento_detalhe; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.orca_orcamento_detalhe (id, id_orcamento_empresarial, id_fin_natureza_financeira, periodo, valor_orcado, valor_realizado, taxa_variacao, valor_variacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9927 (class 0 OID 27089)
-- Dependencies: 701
-- Data for Name: orca_orcamento_empresarial; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.orca_orcamento_empresarial (id, id_orcamento_periodo, nome, descricao, data_inicial, numero_periodos, data_base, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9928 (class 0 OID 27103)
-- Dependencies: 702
-- Data for Name: orca_orcamento_fluxo_caixa; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.orca_orcamento_fluxo_caixa (id, id_orc_fluxo_caixa_periodo, nome, descricao, data_inicial, numero_periodos, data_base, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9929 (class 0 OID 27117)
-- Dependencies: 703
-- Data for Name: orca_orcamento_fluxo_caixa_detalhe; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.orca_orcamento_fluxo_caixa_detalhe (id, id_orcamento_fluxo_caixa, id_fin_natureza_financeira, periodo, valor_orcado, valor_realizado, taxa_variacao, valor_variacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9930 (class 0 OID 27133)
-- Dependencies: 704
-- Data for Name: orca_orcamento_fluxo_caixa_periodo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.orca_orcamento_fluxo_caixa_periodo (id, id_banco_conta_caixa, periodo, nome, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9931 (class 0 OID 27145)
-- Dependencies: 705
-- Data for Name: orca_orcamento_periodo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.orca_orcamento_periodo (id, periodo, nome, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9939 (class 0 OID 27163)
-- Dependencies: 713
-- Data for Name: pcp_instrucao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.pcp_instrucao (id, codigo, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9940 (class 0 OID 27174)
-- Dependencies: 714
-- Data for Name: pcp_instrucao_op; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.pcp_instrucao_op (id, id_pcp_instrucao, id_pcp_op_cabecalho, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9941 (class 0 OID 27185)
-- Dependencies: 715
-- Data for Name: pcp_op_cabecalho; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.pcp_op_cabecalho (id, inicio, previsao_entrega, termino, custo_total_previsto, custo_total_realizado, porcento_venda, porcento_estoque, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9942 (class 0 OID 27198)
-- Dependencies: 716
-- Data for Name: pcp_op_detalhe; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.pcp_op_detalhe (id, id_pcp_op_cabecalho, id_produto, quantidade_produzir, quantidade_produzida, quantidade_entregue, custo_previsto, custo_realizado, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9943 (class 0 OID 27214)
-- Dependencies: 717
-- Data for Name: pcp_servico; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.pcp_servico (id, id_pcp_op_detalhe, inicio_realizado, termino_realizado, horas_realizado, minutos_realizado, segundos_realizado, custo_realizado, inicio_previsto, termino_previsto, horas_previsto, minutos_previsto, segundos_previsto, custo_previsto, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9944 (class 0 OID 27232)
-- Dependencies: 718
-- Data for Name: pcp_servico_colaborador; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.pcp_servico_colaborador (id, id_pcp_servico, id_colaborador, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9945 (class 0 OID 27243)
-- Dependencies: 719
-- Data for Name: pcp_servico_equipamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.pcp_servico_equipamento (id, id_patrim_bem, id_pcp_servico, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9947 (class 0 OID 27255)
-- Dependencies: 721
-- Data for Name: prdc_produto_ficha_tecnica; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.prdc_produto_ficha_tecnica (id, id_produto, descricao, id_produto_filho, quantidade, sequencia_producao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9832 (class 0 OID 25347)
-- Dependencies: 606
-- Data for Name: rhfo_cbo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.rhfo_cbo (id, codigo, codigo_1994, nome, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9840 (class 0 OID 25457)
-- Dependencies: 614
-- Data for Name: rhfo_estado_civil; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.rhfo_estado_civil (id, nome, descricao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9794 (class 0 OID 24813)
-- Dependencies: 568
-- Data for Name: supr_almoxarifado; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_almoxarifado (id, nome, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9795 (class 0 OID 24823)
-- Dependencies: 569
-- Data for Name: supr_estq_cor; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_estq_cor (id, codigo, nome, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9796 (class 0 OID 24834)
-- Dependencies: 570
-- Data for Name: supr_estq_grade; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_estq_grade (id, id_estq_marca, id_estq_sabor, id_estq_tamanho, id_estq_cor, id_produto, codigo, quantidade, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9990 (class 0 OID 28462)
-- Dependencies: 764
-- Data for Name: supr_estq_local; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_estq_local (id, nome, ativo) FROM stdin;
\.


--
-- TOC entry 9797 (class 0 OID 24850)
-- Dependencies: 571
-- Data for Name: supr_estq_marca; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_estq_marca (id, codigo, nome, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9993 (class 0 OID 28486)
-- Dependencies: 767
-- Data for Name: supr_estq_movimentacao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_estq_movimentacao (id, id_produto, id_local, tipo_movimentacao, quantidade, data_hora, origem_documento, motivo_movimentacao) FROM stdin;
\.


--
-- TOC entry 9798 (class 0 OID 24861)
-- Dependencies: 572
-- Data for Name: supr_estq_reajuste_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_estq_reajuste_cab (id, id_colaborador, data_reajuste, taxa, tipo_reajuste, justificativa, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9799 (class 0 OID 24874)
-- Dependencies: 573
-- Data for Name: supr_estq_reajuste_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_estq_reajuste_det (id, id_estq_reajuste_cabecalho, id_produto, valor_original, valor_reajuste, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9800 (class 0 OID 24887)
-- Dependencies: 574
-- Data for Name: supr_estq_sabor; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_estq_sabor (id, codigo, nome, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9991 (class 0 OID 28471)
-- Dependencies: 765
-- Data for Name: supr_estq_saldo; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_estq_saldo (id_produto, id_local, quantidade_atual, quantidade_reservada, custo_medio, valor_total_estoque, data_ultima_movimentacao) FROM stdin;
\.


--
-- TOC entry 9995 (class 0 OID 28503)
-- Dependencies: 769
-- Data for Name: supr_estq_saldo_historico; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_estq_saldo_historico (id, data_snapshot, id_produto, id_local, quantidade_fisica, quantidade_reservada, custo_medio_na_data, valor_total_estoque) FROM stdin;
\.


--
-- TOC entry 9801 (class 0 OID 24898)
-- Dependencies: 575
-- Data for Name: supr_estq_tamanho; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_estq_tamanho (id, codigo, nome, altura, comprimento, largura, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9802 (class 0 OID 24912)
-- Dependencies: 576
-- Data for Name: supr_invt_contagem_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_invt_contagem_cab (id, data_contagem, estq_atualizado, tipo, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9803 (class 0 OID 24923)
-- Dependencies: 577
-- Data for Name: supr_invt_contagem_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_invt_contagem_det (id, id_inventario_contagem_cab, id_produto, contagem01, contagem02, contagem03, fechado_contagem, quantidade_sistema, acuracidade, divergencia, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9804 (class 0 OID 24941)
-- Dependencies: 578
-- Data for Name: supr_req_interna_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_req_interna_cab (id, id_colaborador, data_requisicao, situacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9805 (class 0 OID 24952)
-- Dependencies: 579
-- Data for Name: supr_req_interna_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_req_interna_det (id, id_requisicao_interna_cabecalho, id_produto, quantidade, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9806 (class 0 OID 24964)
-- Dependencies: 580
-- Data for Name: supr_wms_agendamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_wms_agendamento (id, data_operacao, hora_operacao, local_operacao, quantidade_volume, peso_total_volume, quantidade_pessoa, quantidade_hora, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9807 (class 0 OID 24979)
-- Dependencies: 581
-- Data for Name: supr_wms_armazenamento; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_wms_armazenamento (id, id_wms_caixa, id_wms_recebimento_detalhe, quantidade, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9808 (class 0 OID 24991)
-- Dependencies: 582
-- Data for Name: supr_wms_caixa; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_wms_caixa (id, id_wms_estante, codigo, altura, largura, profundidade, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9809 (class 0 OID 25005)
-- Dependencies: 583
-- Data for Name: supr_wms_estante; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_wms_estante (id, id_wms_rua, codigo, quantidade_caixa, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9810 (class 0 OID 25017)
-- Dependencies: 584
-- Data for Name: supr_wms_expedicao; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_wms_expedicao (id, id_wms_ordem_separacao_det, id_wms_armazenamento, quantidade, data_saida, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9811 (class 0 OID 25029)
-- Dependencies: 585
-- Data for Name: supr_wms_ordem_separacao_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_wms_ordem_separacao_cab (id, origem, data_solicitacao, data_limite, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9812 (class 0 OID 25039)
-- Dependencies: 586
-- Data for Name: supr_wms_ordem_separacao_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_wms_ordem_separacao_det (id, id_wms_ordem_separacao_cab, id_produto, quantidade, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9813 (class 0 OID 25051)
-- Dependencies: 587
-- Data for Name: supr_wms_parametro; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_wms_parametro (id, hora_por_volume, pessoa_por_volume, hora_por_peso, pessoa_por_peso, item_diferente_caixa, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9814 (class 0 OID 25065)
-- Dependencies: 588
-- Data for Name: supr_wms_recebimento_cab; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_wms_recebimento_cab (id, id_wms_agendamento, data_recebimento, hora_inicio, hora_fim, volume_recebido, peso_recebido, inconsistencia, observacao, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9815 (class 0 OID 25082)
-- Dependencies: 589
-- Data for Name: supr_wms_recebimento_det; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_wms_recebimento_det (id, id_wms_recebimento_cabecalho, id_produto, quantidade_volume, quantidade_item_por_volume, quantidade_recebida, destino, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 9816 (class 0 OID 25097)
-- Dependencies: 590
-- Data for Name: supr_wms_rua; Type: TABLE DATA; Schema: sagnus; Owner: postgres
--

COPY sagnus.supr_wms_rua (id, codigo, nome, quantidade_estante, dt_criacao, usu_criacao, dt_alteracao, usu_alteracao) FROM stdin;
\.


--
-- TOC entry 10569 (class 0 OID 0)
-- Dependencies: 770
-- Name: com_vend_pedido_id_seq; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.com_vend_pedido_id_seq', 1, false);


--
-- TOC entry 10570 (class 0 OID 0)
-- Dependencies: 772
-- Name: fina_plano_contas_id_seq; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.fina_plano_contas_id_seq', 1, false);


--
-- TOC entry 10571 (class 0 OID 0)
-- Dependencies: 774
-- Name: fina_titulo_id_seq; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.fina_titulo_id_seq', 1, false);


--
-- TOC entry 10572 (class 0 OID 0)
-- Dependencies: 239
-- Name: seq_adm_agen_cat_comp; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_adm_agen_cat_comp', 1, false);


--
-- TOC entry 10573 (class 0 OID 0)
-- Dependencies: 243
-- Name: seq_adm_agen_comp_conv; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_adm_agen_comp_conv', 1, false);


--
-- TOC entry 10574 (class 0 OID 0)
-- Dependencies: 241
-- Name: seq_adm_agen_compromisso; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_adm_agen_compromisso', 1, false);


--
-- TOC entry 10575 (class 0 OID 0)
-- Dependencies: 245
-- Name: seq_adm_agen_notificacao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_adm_agen_notificacao', 1, false);


--
-- TOC entry 10576 (class 0 OID 0)
-- Dependencies: 235
-- Name: seq_adm_modulo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_adm_modulo', 1, false);


--
-- TOC entry 10577 (class 0 OID 0)
-- Dependencies: 237
-- Name: seq_adm_parametro; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_adm_parametro', 1, false);


--
-- TOC entry 10578 (class 0 OID 0)
-- Dependencies: 234
-- Name: seq_agen_categoria_compromisso; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_agen_categoria_compromisso', 1, false);


--
-- TOC entry 10579 (class 0 OID 0)
-- Dependencies: 226
-- Name: seq_auth_perfil; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_auth_perfil', 1, false);


--
-- TOC entry 10580 (class 0 OID 0)
-- Dependencies: 228
-- Name: seq_auth_permissao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_auth_permissao', 1, false);


--
-- TOC entry 10581 (class 0 OID 0)
-- Dependencies: 224
-- Name: seq_auth_usuario; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_auth_usuario', 5, true);


--
-- TOC entry 10582 (class 0 OID 0)
-- Dependencies: 605
-- Name: seq_com_ctrs_tipo_servico; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_com_ctrs_tipo_servico', 1, false);


--
-- TOC entry 10583 (class 0 OID 0)
-- Dependencies: 457
-- Name: seq_corp_cargo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_cargo', 1, false);


--
-- TOC entry 10584 (class 0 OID 0)
-- Dependencies: 458
-- Name: seq_corp_cep; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_cep', 1, false);


--
-- TOC entry 10585 (class 0 OID 0)
-- Dependencies: 459
-- Name: seq_corp_cliente; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_cliente', 1, false);


--
-- TOC entry 10586 (class 0 OID 0)
-- Dependencies: 460
-- Name: seq_corp_cnae; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_cnae', 1, false);


--
-- TOC entry 10587 (class 0 OID 0)
-- Dependencies: 461
-- Name: seq_corp_colaborador; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_colaborador', 1, false);


--
-- TOC entry 10588 (class 0 OID 0)
-- Dependencies: 462
-- Name: seq_corp_colaborador_relacionamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_colaborador_relacionamento', 1, false);


--
-- TOC entry 10589 (class 0 OID 0)
-- Dependencies: 463
-- Name: seq_corp_colaborador_situacao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_colaborador_situacao', 1, false);


--
-- TOC entry 10590 (class 0 OID 0)
-- Dependencies: 464
-- Name: seq_corp_colaborador_tipo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_colaborador_tipo', 1, false);


--
-- TOC entry 10591 (class 0 OID 0)
-- Dependencies: 465
-- Name: seq_corp_comissao_perfil; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_comissao_perfil', 1, false);


--
-- TOC entry 10592 (class 0 OID 0)
-- Dependencies: 466
-- Name: seq_corp_empresa; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_empresa', 1, false);


--
-- TOC entry 10593 (class 0 OID 0)
-- Dependencies: 467
-- Name: seq_corp_empresa_cnae; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_empresa_cnae', 1, false);


--
-- TOC entry 10594 (class 0 OID 0)
-- Dependencies: 468
-- Name: seq_corp_empresa_contato; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_empresa_contato', 1, false);


--
-- TOC entry 10595 (class 0 OID 0)
-- Dependencies: 469
-- Name: seq_corp_empresa_endereco; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_empresa_endereco', 1, false);


--
-- TOC entry 10596 (class 0 OID 0)
-- Dependencies: 470
-- Name: seq_corp_empresa_telefone; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_empresa_telefone', 1, false);


--
-- TOC entry 10597 (class 0 OID 0)
-- Dependencies: 471
-- Name: seq_corp_empresa_transporte; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_empresa_transporte', 1, false);


--
-- TOC entry 10598 (class 0 OID 0)
-- Dependencies: 472
-- Name: seq_corp_empresa_transporte_itinerario; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_empresa_transporte_itinerario', 1, false);


--
-- TOC entry 10599 (class 0 OID 0)
-- Dependencies: 473
-- Name: seq_corp_estado_civil; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_estado_civil', 1, false);


--
-- TOC entry 10600 (class 0 OID 0)
-- Dependencies: 474
-- Name: seq_corp_fornecedor; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_fornecedor', 1, false);


--
-- TOC entry 10601 (class 0 OID 0)
-- Dependencies: 638
-- Name: seq_corp_municipio; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_municipio', 1, false);


--
-- TOC entry 10602 (class 0 OID 0)
-- Dependencies: 475
-- Name: seq_corp_ncm; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_ncm', 1, false);


--
-- TOC entry 10603 (class 0 OID 0)
-- Dependencies: 639
-- Name: seq_corp_pais; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_pais', 1, false);


--
-- TOC entry 10604 (class 0 OID 0)
-- Dependencies: 476
-- Name: seq_corp_pessoa; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_pessoa', 1, false);


--
-- TOC entry 10605 (class 0 OID 0)
-- Dependencies: 477
-- Name: seq_corp_pessoa_alteracao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_pessoa_alteracao', 1, false);


--
-- TOC entry 10606 (class 0 OID 0)
-- Dependencies: 478
-- Name: seq_corp_pessoa_contato; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_pessoa_contato', 1, false);


--
-- TOC entry 10607 (class 0 OID 0)
-- Dependencies: 479
-- Name: seq_corp_pessoa_endereco; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_pessoa_endereco', 1, false);


--
-- TOC entry 10608 (class 0 OID 0)
-- Dependencies: 480
-- Name: seq_corp_pessoa_fisica; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_pessoa_fisica', 1, false);


--
-- TOC entry 10609 (class 0 OID 0)
-- Dependencies: 481
-- Name: seq_corp_pessoa_juridica; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_pessoa_juridica', 1, false);


--
-- TOC entry 10610 (class 0 OID 0)
-- Dependencies: 482
-- Name: seq_corp_pessoa_telefone; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_pessoa_telefone', 1, false);


--
-- TOC entry 10611 (class 0 OID 0)
-- Dependencies: 483
-- Name: seq_corp_produto; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_produto', 1, false);


--
-- TOC entry 10612 (class 0 OID 0)
-- Dependencies: 484
-- Name: seq_corp_produto_alteracao_item; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_produto_alteracao_item', 1, false);


--
-- TOC entry 10613 (class 0 OID 0)
-- Dependencies: 485
-- Name: seq_corp_produto_codigo_adicional; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_produto_codigo_adicional', 1, false);


--
-- TOC entry 10614 (class 0 OID 0)
-- Dependencies: 486
-- Name: seq_corp_produto_ficha_tecnica; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_produto_ficha_tecnica', 1, false);


--
-- TOC entry 10615 (class 0 OID 0)
-- Dependencies: 487
-- Name: seq_corp_produto_grupo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_produto_grupo', 1, false);


--
-- TOC entry 10616 (class 0 OID 0)
-- Dependencies: 488
-- Name: seq_corp_produto_marca; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_produto_marca', 1, false);


--
-- TOC entry 10617 (class 0 OID 0)
-- Dependencies: 489
-- Name: seq_corp_produto_promocao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_produto_promocao', 1, false);


--
-- TOC entry 10618 (class 0 OID 0)
-- Dependencies: 490
-- Name: seq_corp_produto_subgrupo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_produto_subgrupo', 1, false);


--
-- TOC entry 10619 (class 0 OID 0)
-- Dependencies: 491
-- Name: seq_corp_produto_unidade; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_produto_unidade', 1, false);


--
-- TOC entry 10620 (class 0 OID 0)
-- Dependencies: 492
-- Name: seq_corp_setor; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_setor', 1, false);


--
-- TOC entry 10621 (class 0 OID 0)
-- Dependencies: 493
-- Name: seq_corp_sindicato; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_sindicato', 1, false);


--
-- TOC entry 10622 (class 0 OID 0)
-- Dependencies: 494
-- Name: seq_corp_tabela_preco; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_tabela_preco', 1, false);


--
-- TOC entry 10623 (class 0 OID 0)
-- Dependencies: 495
-- Name: seq_corp_tipo_admissao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_tipo_admissao', 1, false);


--
-- TOC entry 10624 (class 0 OID 0)
-- Dependencies: 496
-- Name: seq_corp_tipo_relacionamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_tipo_relacionamento', 1, false);


--
-- TOC entry 10625 (class 0 OID 0)
-- Dependencies: 497
-- Name: seq_corp_transportadora; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_transportadora', 1, false);


--
-- TOC entry 10626 (class 0 OID 0)
-- Dependencies: 498
-- Name: seq_corp_tribut_grupo_tributario; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_tribut_grupo_tributario', 1, false);


--
-- TOC entry 10627 (class 0 OID 0)
-- Dependencies: 499
-- Name: seq_corp_tribut_icms_custom_cab; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_tribut_icms_custom_cab', 1, false);


--
-- TOC entry 10628 (class 0 OID 0)
-- Dependencies: 594
-- Name: seq_corp_uf; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_uf', 1, false);


--
-- TOC entry 10629 (class 0 OID 0)
-- Dependencies: 500
-- Name: seq_corp_vendedor; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_corp_vendedor', 1, false);


--
-- TOC entry 10630 (class 0 OID 0)
-- Dependencies: 722
-- Name: seq_ctbl_conta; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_conta', 1, false);


--
-- TOC entry 10631 (class 0 OID 0)
-- Dependencies: 723
-- Name: seq_ctbl_conta_rateio; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_conta_rateio', 1, false);


--
-- TOC entry 10632 (class 0 OID 0)
-- Dependencies: 724
-- Name: seq_ctbl_dre_cab; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_dre_cab', 1, false);


--
-- TOC entry 10633 (class 0 OID 0)
-- Dependencies: 725
-- Name: seq_ctbl_dre_det; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_dre_det', 1, false);


--
-- TOC entry 10634 (class 0 OID 0)
-- Dependencies: 726
-- Name: seq_ctbl_encerramento_exe_cab; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_encerramento_exe_cab', 1, false);


--
-- TOC entry 10635 (class 0 OID 0)
-- Dependencies: 727
-- Name: seq_ctbl_encerramento_exe_det; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_encerramento_exe_det', 1, false);


--
-- TOC entry 10636 (class 0 OID 0)
-- Dependencies: 728
-- Name: seq_ctbl_fechamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_fechamento', 1, false);


--
-- TOC entry 10637 (class 0 OID 0)
-- Dependencies: 729
-- Name: seq_ctbl_historico; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_historico', 1, false);


--
-- TOC entry 10638 (class 0 OID 0)
-- Dependencies: 730
-- Name: seq_ctbl_indice; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_indice', 1, false);


--
-- TOC entry 10639 (class 0 OID 0)
-- Dependencies: 731
-- Name: seq_ctbl_indice_valor; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_indice_valor', 1, false);


--
-- TOC entry 10640 (class 0 OID 0)
-- Dependencies: 732
-- Name: seq_ctbl_lancamento_cab; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_lancamento_cab', 1, false);


--
-- TOC entry 10641 (class 0 OID 0)
-- Dependencies: 733
-- Name: seq_ctbl_lancamento_det; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_lancamento_det', 1, false);


--
-- TOC entry 10642 (class 0 OID 0)
-- Dependencies: 734
-- Name: seq_ctbl_lancamento_orcado; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_lancamento_orcado', 1, false);


--
-- TOC entry 10643 (class 0 OID 0)
-- Dependencies: 735
-- Name: seq_ctbl_lancamento_padrao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_lancamento_padrao', 1, false);


--
-- TOC entry 10644 (class 0 OID 0)
-- Dependencies: 736
-- Name: seq_ctbl_livro; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_livro', 1, false);


--
-- TOC entry 10645 (class 0 OID 0)
-- Dependencies: 737
-- Name: seq_ctbl_lote; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_lote', 1, false);


--
-- TOC entry 10646 (class 0 OID 0)
-- Dependencies: 738
-- Name: seq_ctbl_parametro; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_parametro', 1, false);


--
-- TOC entry 10647 (class 0 OID 0)
-- Dependencies: 603
-- Name: seq_ctbl_patrim_estado_conservacao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_patrim_estado_conservacao', 1, false);


--
-- TOC entry 10648 (class 0 OID 0)
-- Dependencies: 604
-- Name: seq_ctbl_patrim_indice_atualizacao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_patrim_indice_atualizacao', 1, false);


--
-- TOC entry 10649 (class 0 OID 0)
-- Dependencies: 740
-- Name: seq_ctbl_plano_conta; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_plano_conta', 1, false);


--
-- TOC entry 10650 (class 0 OID 0)
-- Dependencies: 741
-- Name: seq_ctbl_plano_conta_ref_sped; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_plano_conta_ref_sped', 1, false);


--
-- TOC entry 10651 (class 0 OID 0)
-- Dependencies: 739
-- Name: seq_ctbl_termo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_ctbl_termo', 1, false);


--
-- TOC entry 10652 (class 0 OID 0)
-- Dependencies: 249
-- Name: seq_fina_cad_doc_origem; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cad_doc_origem', 1, false);


--
-- TOC entry 10653 (class 0 OID 0)
-- Dependencies: 247
-- Name: seq_fina_cad_nat_financeira; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cad_nat_financeira', 1, false);


--
-- TOC entry 10654 (class 0 OID 0)
-- Dependencies: 251
-- Name: seq_fina_cad_status_parcela; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cad_status_parcela', 1, false);


--
-- TOC entry 10655 (class 0 OID 0)
-- Dependencies: 253
-- Name: seq_fina_cad_tipo_pagto; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cad_tipo_pagto', 1, false);


--
-- TOC entry 10656 (class 0 OID 0)
-- Dependencies: 255
-- Name: seq_fina_cad_tipo_receb; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cad_tipo_receb', 1, false);


--
-- TOC entry 10657 (class 0 OID 0)
-- Dependencies: 263
-- Name: seq_fina_cap_lancamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cap_lancamento', 1, false);


--
-- TOC entry 10658 (class 0 OID 0)
-- Dependencies: 265
-- Name: seq_fina_cap_parcela; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cap_parcela', 1, false);


--
-- TOC entry 10659 (class 0 OID 0)
-- Dependencies: 267
-- Name: seq_fina_car_lancamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_car_lancamento', 1, false);


--
-- TOC entry 10660 (class 0 OID 0)
-- Dependencies: 269
-- Name: seq_fina_car_parcela; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_car_parcela', 1, false);


--
-- TOC entry 10661 (class 0 OID 0)
-- Dependencies: 277
-- Name: seq_fina_cbk_conc; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cbk_conc', 1, false);


--
-- TOC entry 10662 (class 0 OID 0)
-- Dependencies: 279
-- Name: seq_fina_cbk_conc_item; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cbk_conc_item', 1, false);


--
-- TOC entry 10663 (class 0 OID 0)
-- Dependencies: 257
-- Name: seq_fina_cxb_banco; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cxb_banco', 1, false);


--
-- TOC entry 10664 (class 0 OID 0)
-- Dependencies: 259
-- Name: seq_fina_cxb_banco_ag; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cxb_banco_ag', 1, false);


--
-- TOC entry 10665 (class 0 OID 0)
-- Dependencies: 261
-- Name: seq_fina_cxb_conta_caixa; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cxb_conta_caixa', 1, false);


--
-- TOC entry 10666 (class 0 OID 0)
-- Dependencies: 275
-- Name: seq_fina_cxb_extrato; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_cxb_extrato', 1, false);


--
-- TOC entry 10667 (class 0 OID 0)
-- Dependencies: 271
-- Name: seq_fina_edi_arquivo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_edi_arquivo', 1, false);


--
-- TOC entry 10668 (class 0 OID 0)
-- Dependencies: 273
-- Name: seq_fina_edi_linha; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_edi_linha', 1, false);


--
-- TOC entry 10669 (class 0 OID 0)
-- Dependencies: 289
-- Name: seq_fina_fcx_previsto; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_fcx_previsto', 1, false);


--
-- TOC entry 10670 (class 0 OID 0)
-- Dependencies: 291
-- Name: seq_fina_fcx_saldo_diario; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_fcx_saldo_diario', 1, false);


--
-- TOC entry 10671 (class 0 OID 0)
-- Dependencies: 285
-- Name: seq_fina_tes_aplicacao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_tes_aplicacao', 1, false);


--
-- TOC entry 10672 (class 0 OID 0)
-- Dependencies: 281
-- Name: seq_fina_tes_movimento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_tes_movimento', 1, false);


--
-- TOC entry 10673 (class 0 OID 0)
-- Dependencies: 287
-- Name: seq_fina_tes_resgate; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_tes_resgate', 1, false);


--
-- TOC entry 10674 (class 0 OID 0)
-- Dependencies: 283
-- Name: seq_fina_tes_transferencia; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fina_tes_transferencia', 1, false);


--
-- TOC entry 10675 (class 0 OID 0)
-- Dependencies: 232
-- Name: seq_fisc_aidf_aimdf; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_aidf_aimdf', 1, false);


--
-- TOC entry 10676 (class 0 OID 0)
-- Dependencies: 592
-- Name: seq_fisc_cfop; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cfop', 1, false);


--
-- TOC entry 10677 (class 0 OID 0)
-- Dependencies: 593
-- Name: seq_fisc_csosn; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_csosn', 1, false);


--
-- TOC entry 10678 (class 0 OID 0)
-- Dependencies: 595
-- Name: seq_fisc_cst_cofins; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cst_cofins', 1, false);


--
-- TOC entry 10679 (class 0 OID 0)
-- Dependencies: 596
-- Name: seq_fisc_cst_icms; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cst_icms', 1, false);


--
-- TOC entry 10680 (class 0 OID 0)
-- Dependencies: 597
-- Name: seq_fisc_cst_ipi; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cst_ipi', 1, false);


--
-- TOC entry 10681 (class 0 OID 0)
-- Dependencies: 598
-- Name: seq_fisc_cst_pis; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cst_pis', 1, false);


--
-- TOC entry 10682 (class 0 OID 0)
-- Dependencies: 383
-- Name: seq_fisc_cte_aereo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_aereo', 1, false);


--
-- TOC entry 10683 (class 0 OID 0)
-- Dependencies: 385
-- Name: seq_fisc_cte_aquaviario; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_aquaviario', 1, false);


--
-- TOC entry 10684 (class 0 OID 0)
-- Dependencies: 387
-- Name: seq_fisc_cte_aquaviario_balsa; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_aquaviario_balsa', 1, false);


--
-- TOC entry 10685 (class 0 OID 0)
-- Dependencies: 381
-- Name: seq_fisc_cte_cabecalho; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_cabecalho', 1, false);


--
-- TOC entry 10686 (class 0 OID 0)
-- Dependencies: 389
-- Name: seq_fisc_cte_carga; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_carga', 1, false);


--
-- TOC entry 10687 (class 0 OID 0)
-- Dependencies: 391
-- Name: seq_fisc_cte_componente; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_componente', 1, false);


--
-- TOC entry 10688 (class 0 OID 0)
-- Dependencies: 393
-- Name: seq_fisc_cte_destinatario; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_destinatario', 1, false);


--
-- TOC entry 10689 (class 0 OID 0)
-- Dependencies: 395
-- Name: seq_fisc_cte_documento_anterior; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_documento_anterior', 1, false);


--
-- TOC entry 10690 (class 0 OID 0)
-- Dependencies: 397
-- Name: seq_fisc_cte_documento_anterior_id; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_documento_anterior_id', 1, false);


--
-- TOC entry 10691 (class 0 OID 0)
-- Dependencies: 399
-- Name: seq_fisc_cte_duplicata; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_duplicata', 1, false);


--
-- TOC entry 10692 (class 0 OID 0)
-- Dependencies: 401
-- Name: seq_fisc_cte_dutoviario; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_dutoviario', 1, false);


--
-- TOC entry 10693 (class 0 OID 0)
-- Dependencies: 403
-- Name: seq_fisc_cte_emitente; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_emitente', 1, false);


--
-- TOC entry 10694 (class 0 OID 0)
-- Dependencies: 405
-- Name: seq_fisc_cte_expedidor; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_expedidor', 1, false);


--
-- TOC entry 10695 (class 0 OID 0)
-- Dependencies: 407
-- Name: seq_fisc_cte_fatura; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_fatura', 1, false);


--
-- TOC entry 10696 (class 0 OID 0)
-- Dependencies: 409
-- Name: seq_fisc_cte_ferroviario; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_ferroviario', 1, false);


--
-- TOC entry 10697 (class 0 OID 0)
-- Dependencies: 411
-- Name: seq_fisc_cte_ferroviario_ferrovia; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_ferroviario_ferrovia', 1, false);


--
-- TOC entry 10698 (class 0 OID 0)
-- Dependencies: 413
-- Name: seq_fisc_cte_ferroviario_vagao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_ferroviario_vagao', 1, false);


--
-- TOC entry 10699 (class 0 OID 0)
-- Dependencies: 421
-- Name: seq_fisc_cte_inf_nf_carga_lacre; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_inf_nf_carga_lacre', 1, false);


--
-- TOC entry 10700 (class 0 OID 0)
-- Dependencies: 423
-- Name: seq_fisc_cte_inf_nf_transporte_lacre; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_inf_nf_transporte_lacre', 1, false);


--
-- TOC entry 10701 (class 0 OID 0)
-- Dependencies: 419
-- Name: seq_fisc_cte_informacao_nf_carga; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_informacao_nf_carga', 1, false);


--
-- TOC entry 10702 (class 0 OID 0)
-- Dependencies: 415
-- Name: seq_fisc_cte_informacao_nf_outros; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_informacao_nf_outros', 1, false);


--
-- TOC entry 10703 (class 0 OID 0)
-- Dependencies: 417
-- Name: seq_fisc_cte_informacao_nf_transporte; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_informacao_nf_transporte', 1, false);


--
-- TOC entry 10704 (class 0 OID 0)
-- Dependencies: 425
-- Name: seq_fisc_cte_local_coleta; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_local_coleta', 1, false);


--
-- TOC entry 10705 (class 0 OID 0)
-- Dependencies: 427
-- Name: seq_fisc_cte_local_entrega; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_local_entrega', 1, false);


--
-- TOC entry 10706 (class 0 OID 0)
-- Dependencies: 429
-- Name: seq_fisc_cte_multimodal; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_multimodal', 1, false);


--
-- TOC entry 10707 (class 0 OID 0)
-- Dependencies: 431
-- Name: seq_fisc_cte_passagem; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_passagem', 1, false);


--
-- TOC entry 10708 (class 0 OID 0)
-- Dependencies: 433
-- Name: seq_fisc_cte_perigoso; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_perigoso', 1, false);


--
-- TOC entry 10709 (class 0 OID 0)
-- Dependencies: 435
-- Name: seq_fisc_cte_recebedor; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_recebedor', 1, false);


--
-- TOC entry 10710 (class 0 OID 0)
-- Dependencies: 437
-- Name: seq_fisc_cte_remetente; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_remetente', 1, false);


--
-- TOC entry 10711 (class 0 OID 0)
-- Dependencies: 439
-- Name: seq_fisc_cte_rodoviario; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_rodoviario', 1, false);


--
-- TOC entry 10712 (class 0 OID 0)
-- Dependencies: 441
-- Name: seq_fisc_cte_rodoviario_lacre; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_rodoviario_lacre', 1, false);


--
-- TOC entry 10713 (class 0 OID 0)
-- Dependencies: 443
-- Name: seq_fisc_cte_rodoviario_motorista; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_rodoviario_motorista', 1, false);


--
-- TOC entry 10714 (class 0 OID 0)
-- Dependencies: 445
-- Name: seq_fisc_cte_rodoviario_occ; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_rodoviario_occ', 1, false);


--
-- TOC entry 10715 (class 0 OID 0)
-- Dependencies: 447
-- Name: seq_fisc_cte_rodoviario_pedagio; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_rodoviario_pedagio', 1, false);


--
-- TOC entry 10716 (class 0 OID 0)
-- Dependencies: 449
-- Name: seq_fisc_cte_rodoviario_veiculo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_rodoviario_veiculo', 1, false);


--
-- TOC entry 10717 (class 0 OID 0)
-- Dependencies: 451
-- Name: seq_fisc_cte_seguro; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_seguro', 1, false);


--
-- TOC entry 10718 (class 0 OID 0)
-- Dependencies: 453
-- Name: seq_fisc_cte_tomador; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_tomador', 1, false);


--
-- TOC entry 10719 (class 0 OID 0)
-- Dependencies: 455
-- Name: seq_fisc_cte_veiculo_novo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_cte_veiculo_novo', 1, false);


--
-- TOC entry 10720 (class 0 OID 0)
-- Dependencies: 599
-- Name: seq_fisc_ecf_aliquotas; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_ecf_aliquotas', 1, false);


--
-- TOC entry 10721 (class 0 OID 0)
-- Dependencies: 601
-- Name: seq_fisc_municipal_regime; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_municipal_regime', 1, false);


--
-- TOC entry 10722 (class 0 OID 0)
-- Dependencies: 295
-- Name: seq_fisc_nfe; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe', 1, false);


--
-- TOC entry 10723 (class 0 OID 0)
-- Dependencies: 293
-- Name: seq_fisc_nfe_acesso_xml; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_acesso_xml', 1, false);


--
-- TOC entry 10724 (class 0 OID 0)
-- Dependencies: 297
-- Name: seq_fisc_nfe_cana; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_cana', 1, false);


--
-- TOC entry 10725 (class 0 OID 0)
-- Dependencies: 299
-- Name: seq_fisc_nfe_cana_deducoes_safra; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_cana_deducoes_safra', 1, false);


--
-- TOC entry 10726 (class 0 OID 0)
-- Dependencies: 301
-- Name: seq_fisc_nfe_cana_fornecimento_diario; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_cana_fornecimento_diario', 1, false);


--
-- TOC entry 10727 (class 0 OID 0)
-- Dependencies: 303
-- Name: seq_fisc_nfe_configuracao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_configuracao', 1, false);


--
-- TOC entry 10728 (class 0 OID 0)
-- Dependencies: 305
-- Name: seq_fisc_nfe_cte_referenciado; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_cte_referenciado', 1, false);


--
-- TOC entry 10729 (class 0 OID 0)
-- Dependencies: 307
-- Name: seq_fisc_nfe_cupom_fiscal_referenciado; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_cupom_fiscal_referenciado', 1, false);


--
-- TOC entry 10730 (class 0 OID 0)
-- Dependencies: 347
-- Name: seq_fisc_nfe_declaracao_importacao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_declaracao_importacao', 1, false);


--
-- TOC entry 10731 (class 0 OID 0)
-- Dependencies: 309
-- Name: seq_fisc_nfe_destinatario; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_destinatario', 1, false);


--
-- TOC entry 10732 (class 0 OID 0)
-- Dependencies: 311
-- Name: seq_fisc_nfe_det_especifico_armamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_det_especifico_armamento', 1, false);


--
-- TOC entry 10733 (class 0 OID 0)
-- Dependencies: 313
-- Name: seq_fisc_nfe_det_especifico_combustivel; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_det_especifico_combustivel', 1, false);


--
-- TOC entry 10734 (class 0 OID 0)
-- Dependencies: 315
-- Name: seq_fisc_nfe_det_especifico_medicamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_det_especifico_medicamento', 1, false);


--
-- TOC entry 10735 (class 0 OID 0)
-- Dependencies: 317
-- Name: seq_fisc_nfe_det_especifico_veiculo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_det_especifico_veiculo', 1, false);


--
-- TOC entry 10736 (class 0 OID 0)
-- Dependencies: 319
-- Name: seq_fisc_nfe_detalhe; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_detalhe', 1, false);


--
-- TOC entry 10737 (class 0 OID 0)
-- Dependencies: 321
-- Name: seq_fisc_nfe_detalhe_imposto_cofins; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_detalhe_imposto_cofins', 1, false);


--
-- TOC entry 10738 (class 0 OID 0)
-- Dependencies: 323
-- Name: seq_fisc_nfe_detalhe_imposto_cofins_st; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_detalhe_imposto_cofins_st', 1, false);


--
-- TOC entry 10739 (class 0 OID 0)
-- Dependencies: 325
-- Name: seq_fisc_nfe_detalhe_imposto_icms; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_detalhe_imposto_icms', 1, false);


--
-- TOC entry 10740 (class 0 OID 0)
-- Dependencies: 327
-- Name: seq_fisc_nfe_detalhe_imposto_icms_ufdest; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_detalhe_imposto_icms_ufdest', 1, false);


--
-- TOC entry 10741 (class 0 OID 0)
-- Dependencies: 329
-- Name: seq_fisc_nfe_detalhe_imposto_ii; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_detalhe_imposto_ii', 1, false);


--
-- TOC entry 10742 (class 0 OID 0)
-- Dependencies: 331
-- Name: seq_fisc_nfe_detalhe_imposto_ipi; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_detalhe_imposto_ipi', 1, false);


--
-- TOC entry 10743 (class 0 OID 0)
-- Dependencies: 333
-- Name: seq_fisc_nfe_detalhe_imposto_issqn; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_detalhe_imposto_issqn', 1, false);


--
-- TOC entry 10744 (class 0 OID 0)
-- Dependencies: 335
-- Name: seq_fisc_nfe_detalhe_imposto_pis; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_detalhe_imposto_pis', 1, false);


--
-- TOC entry 10745 (class 0 OID 0)
-- Dependencies: 337
-- Name: seq_fisc_nfe_detalhe_imposto_pis_st; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_detalhe_imposto_pis_st', 1, false);


--
-- TOC entry 10746 (class 0 OID 0)
-- Dependencies: 341
-- Name: seq_fisc_nfe_duplicata; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_duplicata', 1, false);


--
-- TOC entry 10747 (class 0 OID 0)
-- Dependencies: 343
-- Name: seq_fisc_nfe_emitente; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_emitente', 1, false);


--
-- TOC entry 10748 (class 0 OID 0)
-- Dependencies: 345
-- Name: seq_fisc_nfe_exportacao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_exportacao', 1, false);


--
-- TOC entry 10749 (class 0 OID 0)
-- Dependencies: 339
-- Name: seq_fisc_nfe_fatura; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_fatura', 1, false);


--
-- TOC entry 10750 (class 0 OID 0)
-- Dependencies: 349
-- Name: seq_fisc_nfe_importacao_detalhe; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_importacao_detalhe', 1, false);


--
-- TOC entry 10751 (class 0 OID 0)
-- Dependencies: 351
-- Name: seq_fisc_nfe_informacao_pagamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_informacao_pagamento', 1, false);


--
-- TOC entry 10752 (class 0 OID 0)
-- Dependencies: 353
-- Name: seq_fisc_nfe_item_rastreado; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_item_rastreado', 1, false);


--
-- TOC entry 10753 (class 0 OID 0)
-- Dependencies: 355
-- Name: seq_fisc_nfe_local_entrega; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_local_entrega', 1, false);


--
-- TOC entry 10754 (class 0 OID 0)
-- Dependencies: 357
-- Name: seq_fisc_nfe_local_retirada; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_local_retirada', 1, false);


--
-- TOC entry 10755 (class 0 OID 0)
-- Dependencies: 359
-- Name: seq_fisc_nfe_nf_referenciada; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_nf_referenciada', 1, false);


--
-- TOC entry 10756 (class 0 OID 0)
-- Dependencies: 361
-- Name: seq_fisc_nfe_numero; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_numero', 1, false);


--
-- TOC entry 10757 (class 0 OID 0)
-- Dependencies: 363
-- Name: seq_fisc_nfe_numero_inutilizado; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_numero_inutilizado', 1, false);


--
-- TOC entry 10758 (class 0 OID 0)
-- Dependencies: 365
-- Name: seq_fisc_nfe_processo_referenciado; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_processo_referenciado', 1, false);


--
-- TOC entry 10759 (class 0 OID 0)
-- Dependencies: 367
-- Name: seq_fisc_nfe_prod_rural_referenciada; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_prod_rural_referenciada', 1, false);


--
-- TOC entry 10760 (class 0 OID 0)
-- Dependencies: 369
-- Name: seq_fisc_nfe_referenciada; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_referenciada', 1, false);


--
-- TOC entry 10761 (class 0 OID 0)
-- Dependencies: 371
-- Name: seq_fisc_nfe_responsavel_tecnico; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_responsavel_tecnico', 1, false);


--
-- TOC entry 10762 (class 0 OID 0)
-- Dependencies: 373
-- Name: seq_fisc_nfe_transporte; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_transporte', 1, false);


--
-- TOC entry 10763 (class 0 OID 0)
-- Dependencies: 375
-- Name: seq_fisc_nfe_transporte_reboque; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_transporte_reboque', 1, false);


--
-- TOC entry 10764 (class 0 OID 0)
-- Dependencies: 377
-- Name: seq_fisc_nfe_transporte_volume; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_transporte_volume', 1, false);


--
-- TOC entry 10765 (class 0 OID 0)
-- Dependencies: 379
-- Name: seq_fisc_nfe_transporte_volume_lacre; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_nfe_transporte_volume_lacre', 1, false);


--
-- TOC entry 10766 (class 0 OID 0)
-- Dependencies: 620
-- Name: seq_fisc_trib_cfop; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_trib_cfop', 1, false);


--
-- TOC entry 10767 (class 0 OID 0)
-- Dependencies: 621
-- Name: seq_fisc_trib_csosn; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_trib_csosn', 1, false);


--
-- TOC entry 10768 (class 0 OID 0)
-- Dependencies: 622
-- Name: seq_fisc_trib_cst_cofins; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_trib_cst_cofins', 1, false);


--
-- TOC entry 10769 (class 0 OID 0)
-- Dependencies: 623
-- Name: seq_fisc_trib_cst_icms; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_trib_cst_icms', 1, false);


--
-- TOC entry 10770 (class 0 OID 0)
-- Dependencies: 624
-- Name: seq_fisc_trib_cst_ipi; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_trib_cst_ipi', 1, false);


--
-- TOC entry 10771 (class 0 OID 0)
-- Dependencies: 625
-- Name: seq_fisc_trib_cst_pis; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_trib_cst_pis', 1, false);


--
-- TOC entry 10772 (class 0 OID 0)
-- Dependencies: 626
-- Name: seq_fisc_trib_ecf_aliquotas; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_trib_ecf_aliquotas', 1, false);


--
-- TOC entry 10773 (class 0 OID 0)
-- Dependencies: 628
-- Name: seq_fisc_trib_icms_uf; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_trib_icms_uf', 1, false);


--
-- TOC entry 10774 (class 0 OID 0)
-- Dependencies: 627
-- Name: seq_fisc_trib_municipal_regime; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_trib_municipal_regime', 1, false);


--
-- TOC entry 10775 (class 0 OID 0)
-- Dependencies: 602
-- Name: seq_fisc_tribut_icms_uf; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_fisc_tribut_icms_uf', 1, false);


--
-- TOC entry 10776 (class 0 OID 0)
-- Dependencies: 694
-- Name: seq_orca_orcamento_detalhe; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_orca_orcamento_detalhe', 1, false);


--
-- TOC entry 10777 (class 0 OID 0)
-- Dependencies: 695
-- Name: seq_orca_orcamento_empresarial; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_orca_orcamento_empresarial', 1, false);


--
-- TOC entry 10778 (class 0 OID 0)
-- Dependencies: 696
-- Name: seq_orca_orcamento_fluxo_caixa; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_orca_orcamento_fluxo_caixa', 1, false);


--
-- TOC entry 10779 (class 0 OID 0)
-- Dependencies: 697
-- Name: seq_orca_orcamento_fluxo_caixa_detalhe; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_orca_orcamento_fluxo_caixa_detalhe', 1, false);


--
-- TOC entry 10780 (class 0 OID 0)
-- Dependencies: 698
-- Name: seq_orca_orcamento_fluxo_caixa_periodo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_orca_orcamento_fluxo_caixa_periodo', 1, false);


--
-- TOC entry 10781 (class 0 OID 0)
-- Dependencies: 699
-- Name: seq_orca_orcamento_periodo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_orca_orcamento_periodo', 1, false);


--
-- TOC entry 10782 (class 0 OID 0)
-- Dependencies: 706
-- Name: seq_pcp_instrucao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_pcp_instrucao', 1, false);


--
-- TOC entry 10783 (class 0 OID 0)
-- Dependencies: 707
-- Name: seq_pcp_instrucao_op; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_pcp_instrucao_op', 1, false);


--
-- TOC entry 10784 (class 0 OID 0)
-- Dependencies: 708
-- Name: seq_pcp_op_cabecalho; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_pcp_op_cabecalho', 1, false);


--
-- TOC entry 10785 (class 0 OID 0)
-- Dependencies: 709
-- Name: seq_pcp_op_detalhe; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_pcp_op_detalhe', 1, false);


--
-- TOC entry 10786 (class 0 OID 0)
-- Dependencies: 710
-- Name: seq_pcp_servico; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_pcp_servico', 1, false);


--
-- TOC entry 10787 (class 0 OID 0)
-- Dependencies: 711
-- Name: seq_pcp_servico_colaborador; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_pcp_servico_colaborador', 1, false);


--
-- TOC entry 10788 (class 0 OID 0)
-- Dependencies: 712
-- Name: seq_pcp_servico_equipamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_pcp_servico_equipamento', 1, false);


--
-- TOC entry 10789 (class 0 OID 0)
-- Dependencies: 720
-- Name: seq_prdc_produto_ficha_tecnica; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_prdc_produto_ficha_tecnica', 1, false);


--
-- TOC entry 10790 (class 0 OID 0)
-- Dependencies: 591
-- Name: seq_rhfo_cbo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_rhfo_cbo', 1, false);


--
-- TOC entry 10791 (class 0 OID 0)
-- Dependencies: 600
-- Name: seq_rhfo_estado_civil; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_rhfo_estado_civil', 1, false);


--
-- TOC entry 10792 (class 0 OID 0)
-- Dependencies: 545
-- Name: seq_supr_almoxarifado; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_almoxarifado', 1, false);


--
-- TOC entry 10793 (class 0 OID 0)
-- Dependencies: 546
-- Name: seq_supr_estq_cor; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_estq_cor', 1, false);


--
-- TOC entry 10794 (class 0 OID 0)
-- Dependencies: 547
-- Name: seq_supr_estq_grade; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_estq_grade', 1, false);


--
-- TOC entry 10795 (class 0 OID 0)
-- Dependencies: 548
-- Name: seq_supr_estq_marca; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_estq_marca', 1, false);


--
-- TOC entry 10796 (class 0 OID 0)
-- Dependencies: 549
-- Name: seq_supr_estq_reajuste_cabecalho; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_estq_reajuste_cabecalho', 1, false);


--
-- TOC entry 10797 (class 0 OID 0)
-- Dependencies: 550
-- Name: seq_supr_estq_reajuste_detalhe; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_estq_reajuste_detalhe', 1, false);


--
-- TOC entry 10798 (class 0 OID 0)
-- Dependencies: 551
-- Name: seq_supr_estq_sabor; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_estq_sabor', 1, false);


--
-- TOC entry 10799 (class 0 OID 0)
-- Dependencies: 552
-- Name: seq_supr_estq_tamanho; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_estq_tamanho', 1, false);


--
-- TOC entry 10800 (class 0 OID 0)
-- Dependencies: 553
-- Name: seq_supr_invt_contagem_cab; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_invt_contagem_cab', 1, false);


--
-- TOC entry 10801 (class 0 OID 0)
-- Dependencies: 554
-- Name: seq_supr_invt_contagem_det; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_invt_contagem_det', 1, false);


--
-- TOC entry 10802 (class 0 OID 0)
-- Dependencies: 555
-- Name: seq_supr_req_interna_cabecalho; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_req_interna_cabecalho', 1, false);


--
-- TOC entry 10803 (class 0 OID 0)
-- Dependencies: 556
-- Name: seq_supr_req_interna_detalhe; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_req_interna_detalhe', 1, false);


--
-- TOC entry 10804 (class 0 OID 0)
-- Dependencies: 557
-- Name: seq_supr_wms_agendamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_wms_agendamento', 1, false);


--
-- TOC entry 10805 (class 0 OID 0)
-- Dependencies: 558
-- Name: seq_supr_wms_armazenamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_wms_armazenamento', 1, false);


--
-- TOC entry 10806 (class 0 OID 0)
-- Dependencies: 559
-- Name: seq_supr_wms_caixa; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_wms_caixa', 1, false);


--
-- TOC entry 10807 (class 0 OID 0)
-- Dependencies: 560
-- Name: seq_supr_wms_estante; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_wms_estante', 1, false);


--
-- TOC entry 10808 (class 0 OID 0)
-- Dependencies: 561
-- Name: seq_supr_wms_expedicao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_wms_expedicao', 1, false);


--
-- TOC entry 10809 (class 0 OID 0)
-- Dependencies: 562
-- Name: seq_supr_wms_ordem_separacao_cab; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_wms_ordem_separacao_cab', 1, false);


--
-- TOC entry 10810 (class 0 OID 0)
-- Dependencies: 563
-- Name: seq_supr_wms_ordem_separacao_det; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_wms_ordem_separacao_det', 1, false);


--
-- TOC entry 10811 (class 0 OID 0)
-- Dependencies: 564
-- Name: seq_supr_wms_parametro; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_wms_parametro', 1, false);


--
-- TOC entry 10812 (class 0 OID 0)
-- Dependencies: 565
-- Name: seq_supr_wms_recebimento_cabecalho; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_wms_recebimento_cabecalho', 1, false);


--
-- TOC entry 10813 (class 0 OID 0)
-- Dependencies: 566
-- Name: seq_supr_wms_recebimento_detalhe; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_wms_recebimento_detalhe', 1, false);


--
-- TOC entry 10814 (class 0 OID 0)
-- Dependencies: 567
-- Name: seq_supr_wms_rua; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_supr_wms_rua', 1, false);


--
-- TOC entry 10815 (class 0 OID 0)
-- Dependencies: 660
-- Name: seq_vend_cab; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_cab', 1, false);


--
-- TOC entry 10816 (class 0 OID 0)
-- Dependencies: 661
-- Name: seq_vend_comissao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_comissao', 1, false);


--
-- TOC entry 10817 (class 0 OID 0)
-- Dependencies: 642
-- Name: seq_vend_comissao_objetivo; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_comissao_objetivo', 1, false);


--
-- TOC entry 10818 (class 0 OID 0)
-- Dependencies: 643
-- Name: seq_vend_comissao_perfil; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_comissao_perfil', 1, false);


--
-- TOC entry 10819 (class 0 OID 0)
-- Dependencies: 662
-- Name: seq_vend_condicoes_pagamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_condicoes_pagamento', 1, false);


--
-- TOC entry 10820 (class 0 OID 0)
-- Dependencies: 663
-- Name: seq_vend_condicoes_parcelas; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_condicoes_parcelas', 1, false);


--
-- TOC entry 10821 (class 0 OID 0)
-- Dependencies: 664
-- Name: seq_vend_det; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_det', 1, false);


--
-- TOC entry 10822 (class 0 OID 0)
-- Dependencies: 665
-- Name: seq_vend_frete; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_frete', 1, false);


--
-- TOC entry 10823 (class 0 OID 0)
-- Dependencies: 644
-- Name: seq_vend_integracao_pdv; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_integracao_pdv', 1, false);


--
-- TOC entry 10824 (class 0 OID 0)
-- Dependencies: 666
-- Name: seq_vend_orcamento_cab; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_orcamento_cab', 1, false);


--
-- TOC entry 10825 (class 0 OID 0)
-- Dependencies: 667
-- Name: seq_vend_orcamento_det; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_orcamento_det', 1, false);


--
-- TOC entry 10826 (class 0 OID 0)
-- Dependencies: 645
-- Name: seq_vend_pdv_caixa; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pdv_caixa', 1, false);


--
-- TOC entry 10827 (class 0 OID 0)
-- Dependencies: 646
-- Name: seq_vend_pdv_configuracao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pdv_configuracao', 1, false);


--
-- TOC entry 10828 (class 0 OID 0)
-- Dependencies: 647
-- Name: seq_vend_pdv_fechamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pdv_fechamento', 1, false);


--
-- TOC entry 10829 (class 0 OID 0)
-- Dependencies: 648
-- Name: seq_vend_pdv_movimento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pdv_movimento', 1, false);


--
-- TOC entry 10830 (class 0 OID 0)
-- Dependencies: 649
-- Name: seq_vend_pdv_sangria; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pdv_sangria', 1, false);


--
-- TOC entry 10831 (class 0 OID 0)
-- Dependencies: 650
-- Name: seq_vend_pdv_suprimento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pdv_suprimento', 1, false);


--
-- TOC entry 10832 (class 0 OID 0)
-- Dependencies: 651
-- Name: seq_vend_pdv_tipo_pagamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pdv_tipo_pagamento', 1, false);


--
-- TOC entry 10833 (class 0 OID 0)
-- Dependencies: 652
-- Name: seq_vend_pdv_total_tipo_pagamento; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pdv_total_tipo_pagamento', 1, false);


--
-- TOC entry 10834 (class 0 OID 0)
-- Dependencies: 653
-- Name: seq_vend_pdv_venda_cab; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pdv_venda_cab', 1, false);


--
-- TOC entry 10835 (class 0 OID 0)
-- Dependencies: 654
-- Name: seq_vend_pdv_venda_det; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pdv_venda_det', 1, false);


--
-- TOC entry 10836 (class 0 OID 0)
-- Dependencies: 655
-- Name: seq_vend_pre_venda_cab; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pre_venda_cab', 1, false);


--
-- TOC entry 10837 (class 0 OID 0)
-- Dependencies: 656
-- Name: seq_vend_pre_venda_det; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_pre_venda_det', 1, false);


--
-- TOC entry 10838 (class 0 OID 0)
-- Dependencies: 657
-- Name: seq_vend_produto_promocao; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_produto_promocao', 1, false);


--
-- TOC entry 10839 (class 0 OID 0)
-- Dependencies: 658
-- Name: seq_vend_tabela_preco; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_tabela_preco', 1, false);


--
-- TOC entry 10840 (class 0 OID 0)
-- Dependencies: 659
-- Name: seq_vend_tabela_preco_produto; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.seq_vend_tabela_preco_produto', 1, false);


--
-- TOC entry 10841 (class 0 OID 0)
-- Dependencies: 763
-- Name: supr_estq_local_id_seq; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.supr_estq_local_id_seq', 1, false);


--
-- TOC entry 10842 (class 0 OID 0)
-- Dependencies: 766
-- Name: supr_estq_movimentacao_id_seq; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.supr_estq_movimentacao_id_seq', 1, false);


--
-- TOC entry 10843 (class 0 OID 0)
-- Dependencies: 768
-- Name: supr_estq_saldo_historico_id_seq; Type: SEQUENCE SET; Schema: sagnus; Owner: postgres
--

SELECT pg_catalog.setval('sagnus.supr_estq_saldo_historico_id_seq', 1, false);


--
-- TOC entry 8281 (class 2606 OID 16884)
-- Name: adm_agen_cat_compromisso adm_agen_cat_compromisso_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.adm_agen_cat_compromisso
    ADD CONSTRAINT adm_agen_cat_compromisso_pk01 PRIMARY KEY (id);


--
-- TOC entry 8289 (class 2606 OID 16923)
-- Name: adm_agen_comp_conv adm_agen_comp_conv_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.adm_agen_comp_conv
    ADD CONSTRAINT adm_agen_comp_conv_pk01 PRIMARY KEY (id);


--
-- TOC entry 8285 (class 2606 OID 16898)
-- Name: adm_agen_compromisso adm_agen_compromisso_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.adm_agen_compromisso
    ADD CONSTRAINT adm_agen_compromisso_pk01 PRIMARY KEY (id);


--
-- TOC entry 8292 (class 2606 OID 16947)
-- Name: adm_agen_notificacao adm_agen_notificacao_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.adm_agen_notificacao
    ADD CONSTRAINT adm_agen_notificacao_pk01 PRIMARY KEY (id);


--
-- TOC entry 8276 (class 2606 OID 16861)
-- Name: adm_modulo adm_modulo_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.adm_modulo
    ADD CONSTRAINT adm_modulo_pk01 PRIMARY KEY (id);


--
-- TOC entry 8278 (class 2606 OID 16873)
-- Name: adm_parametro adm_parametro_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.adm_parametro
    ADD CONSTRAINT adm_parametro_pk01 PRIMARY KEY (id);


--
-- TOC entry 8261 (class 2606 OID 16494)
-- Name: auth_perfil auth_perfil_nome_key; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_perfil
    ADD CONSTRAINT auth_perfil_nome_key UNIQUE (nome);


--
-- TOC entry 8269 (class 2606 OID 16533)
-- Name: auth_perfil_permissao auth_perfil_permissao_pkey; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_perfil_permissao
    ADD CONSTRAINT auth_perfil_permissao_pkey PRIMARY KEY (perfil_id, permissao_id);


--
-- TOC entry 8263 (class 2606 OID 16492)
-- Name: auth_perfil auth_perfil_pkey; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_perfil
    ADD CONSTRAINT auth_perfil_pkey PRIMARY KEY (id);


--
-- TOC entry 8265 (class 2606 OID 16523)
-- Name: auth_permissao auth_permissao_codigo_key; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_permissao
    ADD CONSTRAINT auth_permissao_codigo_key UNIQUE (codigo);


--
-- TOC entry 8267 (class 2606 OID 16521)
-- Name: auth_permissao auth_permissao_pkey; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_permissao
    ADD CONSTRAINT auth_permissao_pkey PRIMARY KEY (id);


--
-- TOC entry 8257 (class 2606 OID 16480)
-- Name: auth_usuario auth_usuario_email_key; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_usuario
    ADD CONSTRAINT auth_usuario_email_key UNIQUE (email);


--
-- TOC entry 8271 (class 2606 OID 16553)
-- Name: auth_usuario_perfil auth_usuario_perfil_pkey; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_usuario_perfil
    ADD CONSTRAINT auth_usuario_perfil_pkey PRIMARY KEY (usuario_id, perfil_id);


--
-- TOC entry 8259 (class 2606 OID 16478)
-- Name: auth_usuario auth_usuario_pkey; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_usuario
    ADD CONSTRAINT auth_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 9052 (class 2606 OID 28534)
-- Name: com_vend_pedido com_vend_pedido_pkey; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pedido
    ADD CONSTRAINT com_vend_pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 8298 (class 2606 OID 16978)
-- Name: fina_cad_doc_origem fina_cad_doc_origem_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cad_doc_origem
    ADD CONSTRAINT fina_cad_doc_origem_pk01 PRIMARY KEY (id);


--
-- TOC entry 8295 (class 2606 OID 16964)
-- Name: fina_cad_nat_financeira fina_cad_nat_financeira_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cad_nat_financeira
    ADD CONSTRAINT fina_cad_nat_financeira_pk01 PRIMARY KEY (id);


--
-- TOC entry 8301 (class 2606 OID 16993)
-- Name: fina_cad_status_parcela fina_cad_status_parcela_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cad_status_parcela
    ADD CONSTRAINT fina_cad_status_parcela_pk01 PRIMARY KEY (id);


--
-- TOC entry 8304 (class 2606 OID 17005)
-- Name: fina_cad_tipo_pagto fina_cad_tipo_pagto_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cad_tipo_pagto
    ADD CONSTRAINT fina_cad_tipo_pagto_pk01 PRIMARY KEY (id);


--
-- TOC entry 8307 (class 2606 OID 17017)
-- Name: fina_cad_tipo_receb fina_cad_tipo_receb_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cad_tipo_receb
    ADD CONSTRAINT fina_cad_tipo_receb_pk01 PRIMARY KEY (id);


--
-- TOC entry 8320 (class 2606 OID 17085)
-- Name: fina_cap_lancamento fina_cap_lancamento_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cap_lancamento
    ADD CONSTRAINT fina_cap_lancamento_pk01 PRIMARY KEY (id);


--
-- TOC entry 8324 (class 2606 OID 17122)
-- Name: fina_cap_parcela fina_cap_parcela_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cap_parcela
    ADD CONSTRAINT fina_cap_parcela_pk01 PRIMARY KEY (id);


--
-- TOC entry 8328 (class 2606 OID 17156)
-- Name: fina_car_lancamento fina_car_lancamento_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_car_lancamento
    ADD CONSTRAINT fina_car_lancamento_pk01 PRIMARY KEY (id);


--
-- TOC entry 8332 (class 2606 OID 17193)
-- Name: fina_car_parcela fina_car_parcela_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_car_parcela
    ADD CONSTRAINT fina_car_parcela_pk01 PRIMARY KEY (id);


--
-- TOC entry 8356 (class 2606 OID 17338)
-- Name: fina_cbk_conc_item fina_cbk_conc_item_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cbk_conc_item
    ADD CONSTRAINT fina_cbk_conc_item_pk01 PRIMARY KEY (id);


--
-- TOC entry 8349 (class 2606 OID 17318)
-- Name: fina_cbk_conc fina_cbk_conc_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cbk_conc
    ADD CONSTRAINT fina_cbk_conc_pk01 PRIMARY KEY (id);


--
-- TOC entry 8313 (class 2606 OID 17044)
-- Name: fina_cxb_banco_agencia fina_cxb_banco_agencia_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cxb_banco_agencia
    ADD CONSTRAINT fina_cxb_banco_agencia_pk01 PRIMARY KEY (id);


--
-- TOC entry 8310 (class 2606 OID 17029)
-- Name: fina_cxb_banco fina_cxb_banco_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cxb_banco
    ADD CONSTRAINT fina_cxb_banco_pk01 PRIMARY KEY (id);


--
-- TOC entry 8316 (class 2606 OID 17061)
-- Name: fina_cxb_conta_caixa fina_cxb_conta_caixa_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cxb_conta_caixa
    ADD CONSTRAINT fina_cxb_conta_caixa_pk01 PRIMARY KEY (id);


--
-- TOC entry 8346 (class 2606 OID 17279)
-- Name: fina_cxb_extrato fina_cxb_extrato_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cxb_extrato
    ADD CONSTRAINT fina_cxb_extrato_pk01 PRIMARY KEY (id);


--
-- TOC entry 8336 (class 2606 OID 17225)
-- Name: fina_edi_arquivo fina_edi_arquivo_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_edi_arquivo
    ADD CONSTRAINT fina_edi_arquivo_pk01 PRIMARY KEY (id);


--
-- TOC entry 8341 (class 2606 OID 17246)
-- Name: fina_edi_linha fina_edi_linha_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_edi_linha
    ADD CONSTRAINT fina_edi_linha_pk01 PRIMARY KEY (id);


--
-- TOC entry 8378 (class 2606 OID 17529)
-- Name: fina_fcx_previsto fina_fcx_previsto_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_fcx_previsto
    ADD CONSTRAINT fina_fcx_previsto_pk01 PRIMARY KEY (id);


--
-- TOC entry 8381 (class 2606 OID 17570)
-- Name: fina_fcx_saldo_diario fina_fcx_saldo_diario_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_fcx_saldo_diario
    ADD CONSTRAINT fina_fcx_saldo_diario_pk01 PRIMARY KEY (id);


--
-- TOC entry 9055 (class 2606 OID 28556)
-- Name: fina_plano_contas fina_plano_contas_pkey; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_plano_contas
    ADD CONSTRAINT fina_plano_contas_pkey PRIMARY KEY (id);


--
-- TOC entry 8369 (class 2606 OID 17454)
-- Name: fina_tes_aplicacao fina_tes_aplicacao_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_aplicacao
    ADD CONSTRAINT fina_tes_aplicacao_pk01 PRIMARY KEY (id);


--
-- TOC entry 8361 (class 2606 OID 17384)
-- Name: fina_tes_movimento fina_tes_movimento_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_movimento
    ADD CONSTRAINT fina_tes_movimento_pk01 PRIMARY KEY (id);


--
-- TOC entry 8373 (class 2606 OID 17491)
-- Name: fina_tes_resgate fina_tes_resgate_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_resgate
    ADD CONSTRAINT fina_tes_resgate_pk01 PRIMARY KEY (id);


--
-- TOC entry 8365 (class 2606 OID 17417)
-- Name: fina_tes_transferencia fina_tes_transferencia_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_transferencia
    ADD CONSTRAINT fina_tes_transferencia_pk01 PRIMARY KEY (id);


--
-- TOC entry 9057 (class 2606 OID 28571)
-- Name: fina_titulo fina_titulo_pkey; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_titulo
    ADD CONSTRAINT fina_titulo_pkey PRIMARY KEY (id);


--
-- TOC entry 8273 (class 2606 OID 16630)
-- Name: fisc_aidf_aimdf fisc_aidf_aimdf_pk01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_aidf_aimdf
    ADD CONSTRAINT fisc_aidf_aimdf_pk01 PRIMARY KEY (id);


--
-- TOC entry 8768 (class 2606 OID 24822)
-- Name: supr_almoxarifado pk_almoxarifado_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_almoxarifado
    ADD CONSTRAINT pk_almoxarifado_01 PRIMARY KEY (id);


--
-- TOC entry 8639 (class 2606 OID 22854)
-- Name: corp_cargo pk_cargo_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_cargo
    ADD CONSTRAINT pk_cargo_01 PRIMARY KEY (id);


--
-- TOC entry 8641 (class 2606 OID 22870)
-- Name: corp_cep pk_cep_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_cep
    ADD CONSTRAINT pk_cep_01 PRIMARY KEY (id);


--
-- TOC entry 8822 (class 2606 OID 25374)
-- Name: fisc_cfop pk_cfop_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cfop
    ADD CONSTRAINT pk_cfop_01 PRIMARY KEY (id);


--
-- TOC entry 8645 (class 2606 OID 22884)
-- Name: corp_cliente pk_cliente_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_cliente
    ADD CONSTRAINT pk_cliente_01 PRIMARY KEY (id);


--
-- TOC entry 8647 (class 2606 OID 22897)
-- Name: corp_cnae pk_cnae_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_cnae
    ADD CONSTRAINT pk_cnae_01 PRIMARY KEY (id);


--
-- TOC entry 8656 (class 2606 OID 22918)
-- Name: corp_colaborador pk_colaborador_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador
    ADD CONSTRAINT pk_colaborador_01 PRIMARY KEY (id);


--
-- TOC entry 8660 (class 2606 OID 22940)
-- Name: corp_colaborador_relacionamento pk_colaborador_relacionamento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador_relacionamento
    ADD CONSTRAINT pk_colaborador_relacionamento_01 PRIMARY KEY (id);


--
-- TOC entry 8662 (class 2606 OID 22953)
-- Name: corp_colaborador_situacao pk_colaborador_situacao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador_situacao
    ADD CONSTRAINT pk_colaborador_situacao_01 PRIMARY KEY (id);


--
-- TOC entry 8664 (class 2606 OID 22965)
-- Name: corp_colaborador_tipo pk_colaborador_tipo_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador_tipo
    ADD CONSTRAINT pk_colaborador_tipo_01 PRIMARY KEY (id);


--
-- TOC entry 8925 (class 2606 OID 26714)
-- Name: com_vend_cab pk_com_vend_cab; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_cab
    ADD CONSTRAINT pk_com_vend_cab PRIMARY KEY (id);


--
-- TOC entry 8875 (class 2606 OID 26326)
-- Name: com_vend_comissao_perfil pk_com_vend_comissao_perfil; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_comissao_perfil
    ADD CONSTRAINT pk_com_vend_comissao_perfil PRIMARY KEY (id);


--
-- TOC entry 8909 (class 2606 OID 26657)
-- Name: com_vend_produto_promocao pk_com_vend_produto_promocao; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_produto_promocao
    ADD CONSTRAINT pk_com_vend_produto_promocao PRIMARY KEY (id);


--
-- TOC entry 8911 (class 2606 OID 26669)
-- Name: com_vend_tabela_preco pk_com_vend_tabela_preco; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_tabela_preco
    ADD CONSTRAINT pk_com_vend_tabela_preco PRIMARY KEY (id);


--
-- TOC entry 8916 (class 2606 OID 26681)
-- Name: com_vend_tabela_preco_produto pk_com_vend_tabela_preco_produto; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_tabela_preco_produto
    ADD CONSTRAINT pk_com_vend_tabela_preco_produto PRIMARY KEY (id);


--
-- TOC entry 8873 (class 2606 OID 26315)
-- Name: com_vend_comissao_objetivo pk_comissao_objetivo_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_comissao_objetivo
    ADD CONSTRAINT pk_comissao_objetivo_01 PRIMARY KEY (id);


--
-- TOC entry 8666 (class 2606 OID 22976)
-- Name: corp_comissao_perfil pk_comissao_perfil_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_comissao_perfil
    ADD CONSTRAINT pk_comissao_perfil_01 PRIMARY KEY (id);


--
-- TOC entry 8868 (class 2606 OID 25766)
-- Name: corp_municipio pk_corp_municipio; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_municipio
    ADD CONSTRAINT pk_corp_municipio PRIMARY KEY (id);


--
-- TOC entry 9041 (class 2606 OID 28455)
-- Name: corp_pessoa_papel pk_corp_pessoa_papel; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_papel
    ADD CONSTRAINT pk_corp_pessoa_papel PRIMARY KEY (id_pessoa, tipo_papel);


--
-- TOC entry 8866 (class 2606 OID 25752)
-- Name: corp_uf pk_corp_uf; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_uf
    ADD CONSTRAINT pk_corp_uf PRIMARY KEY (id);


--
-- TOC entry 8824 (class 2606 OID 25388)
-- Name: fisc_csosn pk_csosn_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_csosn
    ADD CONSTRAINT pk_csosn_01 PRIMARY KEY (id);


--
-- TOC entry 8826 (class 2606 OID 25402)
-- Name: fisc_cst_cofins pk_cst_cofins_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cst_cofins
    ADD CONSTRAINT pk_cst_cofins_01 PRIMARY KEY (id);


--
-- TOC entry 8828 (class 2606 OID 25416)
-- Name: fisc_cst_icms pk_cst_icms_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cst_icms
    ADD CONSTRAINT pk_cst_icms_01 PRIMARY KEY (id);


--
-- TOC entry 8830 (class 2606 OID 25430)
-- Name: fisc_cst_ipi pk_cst_ipi_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cst_ipi
    ADD CONSTRAINT pk_cst_ipi_01 PRIMARY KEY (id);


--
-- TOC entry 8832 (class 2606 OID 25444)
-- Name: fisc_cst_pis pk_cst_pis_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cst_pis
    ADD CONSTRAINT pk_cst_pis_01 PRIMARY KEY (id);


--
-- TOC entry 9001 (class 2606 OID 27311)
-- Name: ctbl_conta pk_ctbl_conta; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_conta
    ADD CONSTRAINT pk_ctbl_conta PRIMARY KEY (id);


--
-- TOC entry 9003 (class 2606 OID 27323)
-- Name: ctbl_conta_rateio pk_ctbl_conta_rateio; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_conta_rateio
    ADD CONSTRAINT pk_ctbl_conta_rateio PRIMARY KEY (id);


--
-- TOC entry 9005 (class 2606 OID 27336)
-- Name: ctbl_dre_cab pk_ctbl_dre_cab; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_dre_cab
    ADD CONSTRAINT pk_ctbl_dre_cab PRIMARY KEY (id);


--
-- TOC entry 9007 (class 2606 OID 27352)
-- Name: ctbl_dre_det pk_ctbl_dre_det; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_dre_det
    ADD CONSTRAINT pk_ctbl_dre_det PRIMARY KEY (id);


--
-- TOC entry 9009 (class 2606 OID 27362)
-- Name: ctbl_encerramento_exe_cab pk_ctbl_encerramento_exe_cab; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_encerramento_exe_cab
    ADD CONSTRAINT pk_ctbl_encerramento_exe_cab PRIMARY KEY (id);


--
-- TOC entry 9011 (class 2606 OID 27377)
-- Name: ctbl_encerramento_exe_det pk_ctbl_encerramento_exe_det; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_encerramento_exe_det
    ADD CONSTRAINT pk_ctbl_encerramento_exe_det PRIMARY KEY (id);


--
-- TOC entry 9013 (class 2606 OID 27387)
-- Name: ctbl_fechamento pk_ctbl_fechamento; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_fechamento
    ADD CONSTRAINT pk_ctbl_fechamento PRIMARY KEY (id);


--
-- TOC entry 9015 (class 2606 OID 27399)
-- Name: ctbl_historico pk_ctbl_historico; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_historico
    ADD CONSTRAINT pk_ctbl_historico PRIMARY KEY (id);


--
-- TOC entry 9017 (class 2606 OID 27411)
-- Name: ctbl_indice pk_ctbl_indice; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_indice
    ADD CONSTRAINT pk_ctbl_indice PRIMARY KEY (id);


--
-- TOC entry 9019 (class 2606 OID 27422)
-- Name: ctbl_indice_valor pk_ctbl_indice_valor; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_indice_valor
    ADD CONSTRAINT pk_ctbl_indice_valor PRIMARY KEY (id);


--
-- TOC entry 9021 (class 2606 OID 27435)
-- Name: ctbl_lancamento_cab pk_ctbl_lancamento_cab; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_lancamento_cab
    ADD CONSTRAINT pk_ctbl_lancamento_cab PRIMARY KEY (id);


--
-- TOC entry 9023 (class 2606 OID 27450)
-- Name: ctbl_lancamento_det pk_ctbl_lancamento_det; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_lancamento_det
    ADD CONSTRAINT pk_ctbl_lancamento_det PRIMARY KEY (id);


--
-- TOC entry 9025 (class 2606 OID 27473)
-- Name: ctbl_lancamento_orcado pk_ctbl_lancamento_orcado; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_lancamento_orcado
    ADD CONSTRAINT pk_ctbl_lancamento_orcado PRIMARY KEY (id);


--
-- TOC entry 9027 (class 2606 OID 27486)
-- Name: ctbl_lancamento_padrao pk_ctbl_lancamento_padrao; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_lancamento_padrao
    ADD CONSTRAINT pk_ctbl_lancamento_padrao PRIMARY KEY (id);


--
-- TOC entry 9029 (class 2606 OID 27498)
-- Name: ctbl_livro pk_ctbl_livro; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_livro
    ADD CONSTRAINT pk_ctbl_livro PRIMARY KEY (id);


--
-- TOC entry 9031 (class 2606 OID 27511)
-- Name: ctbl_lote pk_ctbl_lote; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_lote
    ADD CONSTRAINT pk_ctbl_lote PRIMARY KEY (id);


--
-- TOC entry 9033 (class 2606 OID 27556)
-- Name: ctbl_parametro pk_ctbl_parametro; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_parametro
    ADD CONSTRAINT pk_ctbl_parametro PRIMARY KEY (id);


--
-- TOC entry 9039 (class 2606 OID 27599)
-- Name: ctbl_plano_conta_ref_sped pk_ctbl_plano_conta_ref_sped; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_plano_conta_ref_sped
    ADD CONSTRAINT pk_ctbl_plano_conta_ref_sped PRIMARY KEY (id);


--
-- TOC entry 9035 (class 2606 OID 27574)
-- Name: ctbl_termo pk_ctbl_termo; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_termo
    ADD CONSTRAINT pk_ctbl_termo PRIMARY KEY (id);


--
-- TOC entry 8522 (class 2606 OID 21417)
-- Name: fisc_cte_aereo pk_cte_aereo_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_aereo
    ADD CONSTRAINT pk_cte_aereo_01 PRIMARY KEY (id);


--
-- TOC entry 8525 (class 2606 OID 21439)
-- Name: fisc_cte_aquaviario pk_cte_aquaviario_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_aquaviario
    ADD CONSTRAINT pk_cte_aquaviario_01 PRIMARY KEY (id);


--
-- TOC entry 8528 (class 2606 OID 21464)
-- Name: fisc_cte_aquaviario_balsa pk_cte_aquaviario_balsa_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_aquaviario_balsa
    ADD CONSTRAINT pk_cte_aquaviario_balsa_01 PRIMARY KEY (id);


--
-- TOC entry 8519 (class 2606 OID 21396)
-- Name: fisc_cte_cabecalho pk_cte_cabecalho_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_cabecalho
    ADD CONSTRAINT pk_cte_cabecalho_01 PRIMARY KEY (id);


--
-- TOC entry 8531 (class 2606 OID 21484)
-- Name: fisc_cte_carga pk_cte_carga_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_carga
    ADD CONSTRAINT pk_cte_carga_01 PRIMARY KEY (id);


--
-- TOC entry 8534 (class 2606 OID 21503)
-- Name: fisc_cte_componente pk_cte_componente_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_componente
    ADD CONSTRAINT pk_cte_componente_01 PRIMARY KEY (id);


--
-- TOC entry 8538 (class 2606 OID 21539)
-- Name: fisc_cte_destinatario pk_cte_destinatario_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_destinatario
    ADD CONSTRAINT pk_cte_destinatario_01 PRIMARY KEY (id);


--
-- TOC entry 8541 (class 2606 OID 21561)
-- Name: fisc_cte_documento_anterior pk_cte_documento_anterior_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_documento_anterior
    ADD CONSTRAINT pk_cte_documento_anterior_01 PRIMARY KEY (id);


--
-- TOC entry 8543 (class 2606 OID 21579)
-- Name: fisc_cte_documento_anterior_id pk_cte_documento_anterior_id_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_documento_anterior_id
    ADD CONSTRAINT pk_cte_documento_anterior_id_01 PRIMARY KEY (id);


--
-- TOC entry 8546 (class 2606 OID 21592)
-- Name: fisc_cte_duplicata pk_cte_duplicata_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_duplicata
    ADD CONSTRAINT pk_cte_duplicata_01 PRIMARY KEY (id);


--
-- TOC entry 8549 (class 2606 OID 21610)
-- Name: fisc_cte_dutoviario pk_cte_dutoviario_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_dutoviario
    ADD CONSTRAINT pk_cte_dutoviario_01 PRIMARY KEY (id);


--
-- TOC entry 8553 (class 2606 OID 21642)
-- Name: fisc_cte_emitente pk_cte_emitente_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_emitente
    ADD CONSTRAINT pk_cte_emitente_01 PRIMARY KEY (id);


--
-- TOC entry 8557 (class 2606 OID 21678)
-- Name: fisc_cte_expedidor pk_cte_expedidor_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_expedidor
    ADD CONSTRAINT pk_cte_expedidor_01 PRIMARY KEY (id);


--
-- TOC entry 8560 (class 2606 OID 21699)
-- Name: fisc_cte_fatura pk_cte_fatura_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_fatura
    ADD CONSTRAINT pk_cte_fatura_01 PRIMARY KEY (id);


--
-- TOC entry 8563 (class 2606 OID 21722)
-- Name: fisc_cte_ferroviario pk_cte_ferroviario_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_ferroviario
    ADD CONSTRAINT pk_cte_ferroviario_01 PRIMARY KEY (id);


--
-- TOC entry 8566 (class 2606 OID 21753)
-- Name: fisc_cte_ferroviario_ferrovia pk_cte_ferroviario_ferrovia_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_ferroviario_ferrovia
    ADD CONSTRAINT pk_cte_ferroviario_ferrovia_01 PRIMARY KEY (id);


--
-- TOC entry 8569 (class 2606 OID 21775)
-- Name: fisc_cte_ferroviario_vagao pk_cte_ferroviario_vagao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_ferroviario_vagao
    ADD CONSTRAINT pk_cte_ferroviario_vagao_01 PRIMARY KEY (id);


--
-- TOC entry 8581 (class 2606 OID 21868)
-- Name: fisc_cte_inf_nf_carga_lacre pk_cte_inf_nf_carga_lacre_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_inf_nf_carga_lacre
    ADD CONSTRAINT pk_cte_inf_nf_carga_lacre_01 PRIMARY KEY (id);


--
-- TOC entry 8584 (class 2606 OID 21886)
-- Name: fisc_cte_inf_nf_transporte_lacre pk_cte_inf_nf_transporte_lacre_0; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_inf_nf_transporte_lacre
    ADD CONSTRAINT pk_cte_inf_nf_transporte_lacre_0 PRIMARY KEY (id);


--
-- TOC entry 8578 (class 2606 OID 21849)
-- Name: fisc_cte_informacao_nf_carga pk_cte_informacao_nf_carga_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_informacao_nf_carga
    ADD CONSTRAINT pk_cte_informacao_nf_carga_01 PRIMARY KEY (id);


--
-- TOC entry 8572 (class 2606 OID 21811)
-- Name: fisc_cte_informacao_nf_outros pk_cte_informacao_nf_outros_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_informacao_nf_outros
    ADD CONSTRAINT pk_cte_informacao_nf_outros_01 PRIMARY KEY (id);


--
-- TOC entry 8575 (class 2606 OID 21830)
-- Name: fisc_cte_informacao_nf_transporte pk_cte_informacao_nf_transporte_; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_informacao_nf_transporte
    ADD CONSTRAINT pk_cte_informacao_nf_transporte_ PRIMARY KEY (id);


--
-- TOC entry 8588 (class 2606 OID 21915)
-- Name: fisc_cte_local_coleta pk_cte_local_coleta_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_local_coleta
    ADD CONSTRAINT pk_cte_local_coleta_01 PRIMARY KEY (id);


--
-- TOC entry 8592 (class 2606 OID 21944)
-- Name: fisc_cte_local_entrega pk_cte_local_entrega_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_local_entrega
    ADD CONSTRAINT pk_cte_local_entrega_01 PRIMARY KEY (id);


--
-- TOC entry 8595 (class 2606 OID 21963)
-- Name: fisc_cte_multimodal pk_cte_multimodal_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_multimodal
    ADD CONSTRAINT pk_cte_multimodal_01 PRIMARY KEY (id);


--
-- TOC entry 8598 (class 2606 OID 21983)
-- Name: fisc_cte_passagem pk_cte_passagem_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_passagem
    ADD CONSTRAINT pk_cte_passagem_01 PRIMARY KEY (id);


--
-- TOC entry 8601 (class 2606 OID 22007)
-- Name: fisc_cte_perigoso pk_cte_perigoso_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_perigoso
    ADD CONSTRAINT pk_cte_perigoso_01 PRIMARY KEY (id);


--
-- TOC entry 8605 (class 2606 OID 22043)
-- Name: fisc_cte_recebedor pk_cte_recebedor_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_recebedor
    ADD CONSTRAINT pk_cte_recebedor_01 PRIMARY KEY (id);


--
-- TOC entry 8609 (class 2606 OID 22079)
-- Name: fisc_cte_remetente pk_cte_remetente_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_remetente
    ADD CONSTRAINT pk_cte_remetente_01 PRIMARY KEY (id);


--
-- TOC entry 8612 (class 2606 OID 22099)
-- Name: fisc_cte_rodoviario pk_cte_rodoviario_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario
    ADD CONSTRAINT pk_cte_rodoviario_01 PRIMARY KEY (id);


--
-- TOC entry 8615 (class 2606 OID 22117)
-- Name: fisc_cte_rodoviario_lacre pk_cte_rodoviario_lacre_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario_lacre
    ADD CONSTRAINT pk_cte_rodoviario_lacre_01 PRIMARY KEY (id);


--
-- TOC entry 8618 (class 2606 OID 22136)
-- Name: fisc_cte_rodoviario_motorista pk_cte_rodoviario_motorista_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario_motorista
    ADD CONSTRAINT pk_cte_rodoviario_motorista_01 PRIMARY KEY (id);


--
-- TOC entry 8621 (class 2606 OID 22160)
-- Name: fisc_cte_rodoviario_occ pk_cte_rodoviario_occ_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario_occ
    ADD CONSTRAINT pk_cte_rodoviario_occ_01 PRIMARY KEY (id);


--
-- TOC entry 8624 (class 2606 OID 22181)
-- Name: fisc_cte_rodoviario_pedagio pk_cte_rodoviario_pedagio_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario_pedagio
    ADD CONSTRAINT pk_cte_rodoviario_pedagio_01 PRIMARY KEY (id);


--
-- TOC entry 8627 (class 2606 OID 22216)
-- Name: fisc_cte_rodoviario_veiculo pk_cte_rodoviario_veiculo_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario_veiculo
    ADD CONSTRAINT pk_cte_rodoviario_veiculo_01 PRIMARY KEY (id);


--
-- TOC entry 8630 (class 2606 OID 22238)
-- Name: fisc_cte_seguro pk_cte_seguro_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_seguro
    ADD CONSTRAINT pk_cte_seguro_01 PRIMARY KEY (id);


--
-- TOC entry 8634 (class 2606 OID 22274)
-- Name: fisc_cte_tomador pk_cte_tomador_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_tomador
    ADD CONSTRAINT pk_cte_tomador_01 PRIMARY KEY (id);


--
-- TOC entry 8637 (class 2606 OID 22297)
-- Name: fisc_cte_veiculo_novo pk_cte_veiculo_novo_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_veiculo_novo
    ADD CONSTRAINT pk_cte_veiculo_novo_01 PRIMARY KEY (id);


--
-- TOC entry 9037 (class 2606 OID 27586)
-- Name: ctbl_plano_conta pk_ctlb_plano_conta; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_plano_conta
    ADD CONSTRAINT pk_ctlb_plano_conta PRIMARY KEY (id);


--
-- TOC entry 8846 (class 2606 OID 25554)
-- Name: ctrs_tipo_servico pk_ctrs_tipo_servico; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctrs_tipo_servico
    ADD CONSTRAINT pk_ctrs_tipo_servico PRIMARY KEY (id);


--
-- TOC entry 8834 (class 2606 OID 25456)
-- Name: fisc_ecf_aliquotas pk_ecf_aliquotas_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_ecf_aliquotas
    ADD CONSTRAINT pk_ecf_aliquotas_01 PRIMARY KEY (id);


--
-- TOC entry 8668 (class 2606 OID 23003)
-- Name: corp_empresa pk_empresa_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa
    ADD CONSTRAINT pk_empresa_01 PRIMARY KEY (id);


--
-- TOC entry 8672 (class 2606 OID 23018)
-- Name: corp_empresa_cnae pk_empresa_cnae_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_cnae
    ADD CONSTRAINT pk_empresa_cnae_01 PRIMARY KEY (id);


--
-- TOC entry 8675 (class 2606 OID 23033)
-- Name: corp_empresa_contato pk_empresa_contato_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_contato
    ADD CONSTRAINT pk_empresa_contato_01 PRIMARY KEY (id);


--
-- TOC entry 8678 (class 2606 OID 23057)
-- Name: corp_empresa_endereco pk_empresa_endereco_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_endereco
    ADD CONSTRAINT pk_empresa_endereco_01 PRIMARY KEY (id);


--
-- TOC entry 8681 (class 2606 OID 23069)
-- Name: corp_empresa_telefone pk_empresa_telefone_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_telefone
    ADD CONSTRAINT pk_empresa_telefone_01 PRIMARY KEY (id);


--
-- TOC entry 8683 (class 2606 OID 23081)
-- Name: corp_empresa_transporte pk_empresa_transporte_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_transporte
    ADD CONSTRAINT pk_empresa_transporte_01 PRIMARY KEY (id);


--
-- TOC entry 8686 (class 2606 OID 23095)
-- Name: corp_empresa_transporte_itinerario pk_empresa_transporte_itinerario; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_transporte_itinerario
    ADD CONSTRAINT pk_empresa_transporte_itinerario PRIMARY KEY (id);


--
-- TOC entry 8688 (class 2606 OID 23106)
-- Name: corp_estado_civil pk_estado_civil_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_estado_civil
    ADD CONSTRAINT pk_estado_civil_01 PRIMARY KEY (id);


--
-- TOC entry 8770 (class 2606 OID 24833)
-- Name: supr_estq_cor pk_estq_cor_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_cor
    ADD CONSTRAINT pk_estq_cor_01 PRIMARY KEY (id);


--
-- TOC entry 8773 (class 2606 OID 24849)
-- Name: supr_estq_grade pk_estq_grade_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_grade
    ADD CONSTRAINT pk_estq_grade_01 PRIMARY KEY (id);


--
-- TOC entry 8775 (class 2606 OID 24860)
-- Name: supr_estq_marca pk_estq_marca_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_marca
    ADD CONSTRAINT pk_estq_marca_01 PRIMARY KEY (id);


--
-- TOC entry 8781 (class 2606 OID 24897)
-- Name: supr_estq_sabor pk_estq_sabor_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_sabor
    ADD CONSTRAINT pk_estq_sabor_01 PRIMARY KEY (id);


--
-- TOC entry 9045 (class 2606 OID 28479)
-- Name: supr_estq_saldo pk_estq_saldo; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_saldo
    ADD CONSTRAINT pk_estq_saldo PRIMARY KEY (id_produto, id_local);


--
-- TOC entry 8783 (class 2606 OID 24911)
-- Name: supr_estq_tamanho pk_estq_tamanho_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_tamanho
    ADD CONSTRAINT pk_estq_tamanho_01 PRIMARY KEY (id);


--
-- TOC entry 8392 (class 2606 OID 19645)
-- Name: fisc_nfe pk_fisc_nfe; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe
    ADD CONSTRAINT pk_fisc_nfe PRIMARY KEY (id);


--
-- TOC entry 8848 (class 2606 OID 25599)
-- Name: fisc_trib_cfop pk_fisc_trib_cfop; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_trib_cfop
    ADD CONSTRAINT pk_fisc_trib_cfop PRIMARY KEY (id);


--
-- TOC entry 8850 (class 2606 OID 25613)
-- Name: fisc_trib_csosn pk_fisc_trib_csosn; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_trib_csosn
    ADD CONSTRAINT pk_fisc_trib_csosn PRIMARY KEY (id);


--
-- TOC entry 8852 (class 2606 OID 25627)
-- Name: fisc_trib_cst_cofins pk_fisc_trib_cst_cofins; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_trib_cst_cofins
    ADD CONSTRAINT pk_fisc_trib_cst_cofins PRIMARY KEY (id);


--
-- TOC entry 8854 (class 2606 OID 25641)
-- Name: fisc_trib_cst_icms pk_fisc_trib_cst_icms; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_trib_cst_icms
    ADD CONSTRAINT pk_fisc_trib_cst_icms PRIMARY KEY (id);


--
-- TOC entry 8856 (class 2606 OID 25655)
-- Name: fisc_trib_cst_ipi pk_fisc_trib_cst_ipi; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_trib_cst_ipi
    ADD CONSTRAINT pk_fisc_trib_cst_ipi PRIMARY KEY (id);


--
-- TOC entry 8858 (class 2606 OID 25669)
-- Name: fisc_trib_cst_pis pk_fisc_trib_cst_pis; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_trib_cst_pis
    ADD CONSTRAINT pk_fisc_trib_cst_pis PRIMARY KEY (id);


--
-- TOC entry 8860 (class 2606 OID 25681)
-- Name: fisc_trib_ecf_aliquotas pk_fisc_trib_ecf_aliquotas; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_trib_ecf_aliquotas
    ADD CONSTRAINT pk_fisc_trib_ecf_aliquotas PRIMARY KEY (id);


--
-- TOC entry 8760 (class 2606 OID 23491)
-- Name: fisc_trib_grupo_tributario pk_fisc_trib_grupo_tributario; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_trib_grupo_tributario
    ADD CONSTRAINT pk_fisc_trib_grupo_tributario PRIMARY KEY (id);


--
-- TOC entry 8762 (class 2606 OID 23502)
-- Name: fisc_trib_icms_custom_cab pk_fisc_trib_icms_custom_cab; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_trib_icms_custom_cab
    ADD CONSTRAINT pk_fisc_trib_icms_custom_cab PRIMARY KEY (id);


--
-- TOC entry 8864 (class 2606 OID 25708)
-- Name: fisc_trib_icms_uf pk_fisc_trib_icms_uf; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_trib_icms_uf
    ADD CONSTRAINT pk_fisc_trib_icms_uf PRIMARY KEY (id);


--
-- TOC entry 8862 (class 2606 OID 25693)
-- Name: fisc_trib_municipal_regime pk_fisc_trib_municipal_regime; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_trib_municipal_regime
    ADD CONSTRAINT pk_fisc_trib_municipal_regime PRIMARY KEY (id);


--
-- TOC entry 8838 (class 2606 OID 25479)
-- Name: fisc_municipal_regime pk_fiscal_municipal_regime_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_municipal_regime
    ADD CONSTRAINT pk_fiscal_municipal_regime_01 PRIMARY KEY (id);


--
-- TOC entry 8691 (class 2606 OID 23117)
-- Name: corp_fornecedor pk_fornecedor_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_fornecedor
    ADD CONSTRAINT pk_fornecedor_01 PRIMARY KEY (id);


--
-- TOC entry 8877 (class 2606 OID 26337)
-- Name: com_vend_integracao_pdv pk_integracao_pdv_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_integracao_pdv
    ADD CONSTRAINT pk_integracao_pdv_01 PRIMARY KEY (id);


--
-- TOC entry 8785 (class 2606 OID 24922)
-- Name: supr_invt_contagem_cab pk_inventario_contagem_cab_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_invt_contagem_cab
    ADD CONSTRAINT pk_inventario_contagem_cab_01 PRIMARY KEY (id);


--
-- TOC entry 8788 (class 2606 OID 24940)
-- Name: supr_invt_contagem_det pk_inventario_contagem_det_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_invt_contagem_det
    ADD CONSTRAINT pk_inventario_contagem_det_01 PRIMARY KEY (id);


--
-- TOC entry 8693 (class 2606 OID 23131)
-- Name: corp_ncm pk_ncm_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_ncm
    ADD CONSTRAINT pk_ncm_01 PRIMARY KEY (id);


--
-- TOC entry 8384 (class 2606 OID 19552)
-- Name: fisc_nfe_acesso_xml pk_nfe_acesso_xml_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_acesso_xml
    ADD CONSTRAINT pk_nfe_acesso_xml_01 PRIMARY KEY (id);


--
-- TOC entry 8395 (class 2606 OID 19664)
-- Name: fisc_nfe_cana pk_nfe_cana_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_cana
    ADD CONSTRAINT pk_nfe_cana_01 PRIMARY KEY (id);


--
-- TOC entry 8398 (class 2606 OID 19686)
-- Name: fisc_nfe_cana_deducoes_safra pk_nfe_cana_deducoes_safra_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_cana_deducoes_safra
    ADD CONSTRAINT pk_nfe_cana_deducoes_safra_01 PRIMARY KEY (id);


--
-- TOC entry 8401 (class 2606 OID 19708)
-- Name: fisc_nfe_cana_fornecimento_diario pk_nfe_cana_fornecimento_diario_; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_cana_fornecimento_diario
    ADD CONSTRAINT pk_nfe_cana_fornecimento_diario_ PRIMARY KEY (id);


--
-- TOC entry 8403 (class 2606 OID 19746)
-- Name: fisc_nfe_configuracao pk_nfe_configuracao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_configuracao
    ADD CONSTRAINT pk_nfe_configuracao_01 PRIMARY KEY (id);


--
-- TOC entry 8406 (class 2606 OID 19758)
-- Name: fisc_nfe_cte_referenciado pk_nfe_cte_referenciado_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_cte_referenciado
    ADD CONSTRAINT pk_nfe_cte_referenciado_01 PRIMARY KEY (id);


--
-- TOC entry 8409 (class 2606 OID 19780)
-- Name: fisc_nfe_cupom_fiscal_referenciado pk_nfe_cupom_fiscal_referenciado; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_cupom_fiscal_referenciado
    ADD CONSTRAINT pk_nfe_cupom_fiscal_referenciado PRIMARY KEY (id);


--
-- TOC entry 8470 (class 2606 OID 20372)
-- Name: fisc_nfe_declaracao_importacao pk_nfe_declaracao_importacao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_declaracao_importacao
    ADD CONSTRAINT pk_nfe_declaracao_importacao_01 PRIMARY KEY (id);


--
-- TOC entry 8412 (class 2606 OID 19819)
-- Name: fisc_nfe_destinatario pk_nfe_destinatario_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_destinatario
    ADD CONSTRAINT pk_nfe_destinatario_01 PRIMARY KEY (id);


--
-- TOC entry 8415 (class 2606 OID 19840)
-- Name: fisc_nfe_det_especifico_armamento pk_nfe_det_especifico_armamento_; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_det_especifico_armamento
    ADD CONSTRAINT pk_nfe_det_especifico_armamento_ PRIMARY KEY (id);


--
-- TOC entry 8418 (class 2606 OID 19874)
-- Name: fisc_nfe_det_especifico_combustivel pk_nfe_det_especifico_combustive; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_det_especifico_combustivel
    ADD CONSTRAINT pk_nfe_det_especifico_combustive PRIMARY KEY (id);


--
-- TOC entry 8421 (class 2606 OID 19894)
-- Name: fisc_nfe_det_especifico_medicamento pk_nfe_det_especifico_medicament; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_det_especifico_medicamento
    ADD CONSTRAINT pk_nfe_det_especifico_medicament PRIMARY KEY (id);


--
-- TOC entry 8424 (class 2606 OID 19935)
-- Name: fisc_nfe_det_especifico_veiculo pk_nfe_det_especifico_veiculo_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_det_especifico_veiculo
    ADD CONSTRAINT pk_nfe_det_especifico_veiculo_01 PRIMARY KEY (id);


--
-- TOC entry 8428 (class 2606 OID 19989)
-- Name: fisc_nfe_detalhe pk_nfe_detalhe_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe
    ADD CONSTRAINT pk_nfe_detalhe_01 PRIMARY KEY (id);


--
-- TOC entry 8431 (class 2606 OID 20013)
-- Name: fisc_nfe_detalhe_imposto_cofins pk_nfe_detalhe_imposto_cofins_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_cofins
    ADD CONSTRAINT pk_nfe_detalhe_imposto_cofins_01 PRIMARY KEY (id);


--
-- TOC entry 8434 (class 2606 OID 20035)
-- Name: fisc_nfe_detalhe_imposto_cofins_st pk_nfe_detalhe_imposto_cofins_st; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_cofins_st
    ADD CONSTRAINT pk_nfe_detalhe_imposto_cofins_st PRIMARY KEY (id);


--
-- TOC entry 8437 (class 2606 OID 20094)
-- Name: fisc_nfe_detalhe_imposto_icms pk_nfe_detalhe_imposto_icms_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_icms
    ADD CONSTRAINT pk_nfe_detalhe_imposto_icms_01 PRIMARY KEY (id);


--
-- TOC entry 8440 (class 2606 OID 20120)
-- Name: fisc_nfe_detalhe_imposto_icms_ufdest pk_nfe_detalhe_imposto_icms_ufde; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_icms_ufdest
    ADD CONSTRAINT pk_nfe_detalhe_imposto_icms_ufde PRIMARY KEY (id);


--
-- TOC entry 8443 (class 2606 OID 20141)
-- Name: fisc_nfe_detalhe_imposto_ii pk_nfe_detalhe_imposto_ii_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_ii
    ADD CONSTRAINT pk_nfe_detalhe_imposto_ii_01 PRIMARY KEY (id);


--
-- TOC entry 8446 (class 2606 OID 20168)
-- Name: fisc_nfe_detalhe_imposto_ipi pk_nfe_detalhe_imposto_ipi_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_ipi
    ADD CONSTRAINT pk_nfe_detalhe_imposto_ipi_01 PRIMARY KEY (id);


--
-- TOC entry 8449 (class 2606 OID 20201)
-- Name: fisc_nfe_detalhe_imposto_issqn pk_nfe_detalhe_imposto_issqn_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_issqn
    ADD CONSTRAINT pk_nfe_detalhe_imposto_issqn_01 PRIMARY KEY (id);


--
-- TOC entry 8452 (class 2606 OID 20224)
-- Name: fisc_nfe_detalhe_imposto_pis pk_nfe_detalhe_imposto_pis_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_pis
    ADD CONSTRAINT pk_nfe_detalhe_imposto_pis_01 PRIMARY KEY (id);


--
-- TOC entry 8455 (class 2606 OID 20246)
-- Name: fisc_nfe_detalhe_imposto_pis_st pk_nfe_detalhe_imposto_pis_st_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_pis_st
    ADD CONSTRAINT pk_nfe_detalhe_imposto_pis_st_01 PRIMARY KEY (id);


--
-- TOC entry 8461 (class 2606 OID 20286)
-- Name: fisc_nfe_duplicata pk_nfe_duplicata_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_duplicata
    ADD CONSTRAINT pk_nfe_duplicata_01 PRIMARY KEY (id);


--
-- TOC entry 8464 (class 2606 OID 20325)
-- Name: fisc_nfe_emitente pk_nfe_emitente_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_emitente
    ADD CONSTRAINT pk_nfe_emitente_01 PRIMARY KEY (id);


--
-- TOC entry 8467 (class 2606 OID 20346)
-- Name: fisc_nfe_exportacao pk_nfe_exportacao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_exportacao
    ADD CONSTRAINT pk_nfe_exportacao_01 PRIMARY KEY (id);


--
-- TOC entry 8458 (class 2606 OID 20267)
-- Name: fisc_nfe_fatura pk_nfe_fatura_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_fatura
    ADD CONSTRAINT pk_nfe_fatura_01 PRIMARY KEY (id);


--
-- TOC entry 8473 (class 2606 OID 20394)
-- Name: fisc_nfe_importacao_det pk_nfe_importacao_det; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_importacao_det
    ADD CONSTRAINT pk_nfe_importacao_det PRIMARY KEY (id);


--
-- TOC entry 8476 (class 2606 OID 20419)
-- Name: fisc_nfe_informacao_pagamento pk_nfe_informacao_pagamento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_informacao_pagamento
    ADD CONSTRAINT pk_nfe_informacao_pagamento_01 PRIMARY KEY (id);


--
-- TOC entry 8479 (class 2606 OID 20439)
-- Name: fisc_nfe_item_rastreado pk_nfe_item_rastreado_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_item_rastreado
    ADD CONSTRAINT pk_nfe_item_rastreado_01 PRIMARY KEY (id);


--
-- TOC entry 8482 (class 2606 OID 20474)
-- Name: fisc_nfe_local_entrega pk_nfe_local_entrega_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_local_entrega
    ADD CONSTRAINT pk_nfe_local_entrega_01 PRIMARY KEY (id);


--
-- TOC entry 8485 (class 2606 OID 20509)
-- Name: fisc_nfe_local_retirada pk_nfe_local_retirada_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_local_retirada
    ADD CONSTRAINT pk_nfe_local_retirada_01 PRIMARY KEY (id);


--
-- TOC entry 8488 (class 2606 OID 20532)
-- Name: fisc_nfe_nf_referenciada pk_nfe_nf_referenciada_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_nf_referenciada
    ADD CONSTRAINT pk_nfe_nf_referenciada_01 PRIMARY KEY (id);


--
-- TOC entry 8490 (class 2606 OID 20550)
-- Name: fisc_nfe_numero pk_nfe_numero_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_numero
    ADD CONSTRAINT pk_nfe_numero_01 PRIMARY KEY (id);


--
-- TOC entry 8492 (class 2606 OID 20564)
-- Name: fisc_nfe_numero_inutilizado pk_nfe_numero_inutilizado_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_numero_inutilizado
    ADD CONSTRAINT pk_nfe_numero_inutilizado_01 PRIMARY KEY (id);


--
-- TOC entry 8495 (class 2606 OID 20577)
-- Name: fisc_nfe_processo_referenciado pk_nfe_processo_referenciado_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_processo_referenciado
    ADD CONSTRAINT pk_nfe_processo_referenciado_01 PRIMARY KEY (id);


--
-- TOC entry 8498 (class 2606 OID 20602)
-- Name: fisc_nfe_prod_rural_referenciada pk_nfe_prod_rural_referenciada_0; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_prod_rural_referenciada
    ADD CONSTRAINT pk_nfe_prod_rural_referenciada_0 PRIMARY KEY (id);


--
-- TOC entry 8501 (class 2606 OID 20620)
-- Name: fisc_nfe_referenciada pk_nfe_referenciada_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_referenciada
    ADD CONSTRAINT pk_nfe_referenciada_01 PRIMARY KEY (id);


--
-- TOC entry 8504 (class 2606 OID 20643)
-- Name: fisc_nfe_responsavel_tecnico pk_nfe_responsavel_tecnico_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_responsavel_tecnico
    ADD CONSTRAINT pk_nfe_responsavel_tecnico_01 PRIMARY KEY (id);


--
-- TOC entry 8508 (class 2606 OID 20678)
-- Name: fisc_nfe_transporte pk_nfe_transporte_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_transporte
    ADD CONSTRAINT pk_nfe_transporte_01 PRIMARY KEY (id);


--
-- TOC entry 8511 (class 2606 OID 20701)
-- Name: fisc_nfe_transporte_reboque pk_nfe_transporte_reboque_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_transporte_reboque
    ADD CONSTRAINT pk_nfe_transporte_reboque_01 PRIMARY KEY (id);


--
-- TOC entry 8514 (class 2606 OID 20724)
-- Name: fisc_nfe_transporte_volume pk_nfe_transporte_volume_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_transporte_volume
    ADD CONSTRAINT pk_nfe_transporte_volume_01 PRIMARY KEY (id);


--
-- TOC entry 8517 (class 2606 OID 20742)
-- Name: fisc_nfe_transporte_volume_lacre pk_nfe_transporte_volume_lacre_0; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_transporte_volume_lacre
    ADD CONSTRAINT pk_nfe_transporte_volume_lacre_0 PRIMARY KEY (id);


--
-- TOC entry 8958 (class 2606 OID 27088)
-- Name: orca_orcamento_detalhe pk_orcamento_detalhe_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.orca_orcamento_detalhe
    ADD CONSTRAINT pk_orcamento_detalhe_01 PRIMARY KEY (id);


--
-- TOC entry 8961 (class 2606 OID 27102)
-- Name: orca_orcamento_empresarial pk_orcamento_empresarial_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.orca_orcamento_empresarial
    ADD CONSTRAINT pk_orcamento_empresarial_01 PRIMARY KEY (id);


--
-- TOC entry 8964 (class 2606 OID 27116)
-- Name: orca_orcamento_fluxo_caixa pk_orcamento_fluxo_caixa_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.orca_orcamento_fluxo_caixa
    ADD CONSTRAINT pk_orcamento_fluxo_caixa_01 PRIMARY KEY (id);


--
-- TOC entry 8968 (class 2606 OID 27132)
-- Name: orca_orcamento_fluxo_caixa_detalhe pk_orcamento_fluxo_caixa_detalhe; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.orca_orcamento_fluxo_caixa_detalhe
    ADD CONSTRAINT pk_orcamento_fluxo_caixa_detalhe PRIMARY KEY (id);


--
-- TOC entry 8971 (class 2606 OID 27144)
-- Name: orca_orcamento_fluxo_caixa_periodo pk_orcamento_fluxo_caixa_periodo; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.orca_orcamento_fluxo_caixa_periodo
    ADD CONSTRAINT pk_orcamento_fluxo_caixa_periodo PRIMARY KEY (id);


--
-- TOC entry 8973 (class 2606 OID 27155)
-- Name: orca_orcamento_periodo pk_orcamento_periodo_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.orca_orcamento_periodo
    ADD CONSTRAINT pk_orcamento_periodo_01 PRIMARY KEY (id);


--
-- TOC entry 8842 (class 2606 OID 25530)
-- Name: ctbl_patrim_estado_conservacao pk_patrim_estado_conservacao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_patrim_estado_conservacao
    ADD CONSTRAINT pk_patrim_estado_conservacao_01 PRIMARY KEY (id);


--
-- TOC entry 8844 (class 2606 OID 25542)
-- Name: ctbl_patrim_indice_atualizacao pk_patrim_indice_atualizacao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_patrim_indice_atualizacao
    ADD CONSTRAINT pk_patrim_indice_atualizacao_01 PRIMARY KEY (id);


--
-- TOC entry 8975 (class 2606 OID 27173)
-- Name: pcp_instrucao pk_pcp_instrucao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_instrucao
    ADD CONSTRAINT pk_pcp_instrucao_01 PRIMARY KEY (id);


--
-- TOC entry 8979 (class 2606 OID 27184)
-- Name: pcp_instrucao_op pk_pcp_instrucao_op_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_instrucao_op
    ADD CONSTRAINT pk_pcp_instrucao_op_01 PRIMARY KEY (id);


--
-- TOC entry 8981 (class 2606 OID 27197)
-- Name: pcp_op_cabecalho pk_pcp_op_cabecalho_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_op_cabecalho
    ADD CONSTRAINT pk_pcp_op_cabecalho_01 PRIMARY KEY (id);


--
-- TOC entry 8985 (class 2606 OID 27213)
-- Name: pcp_op_detalhe pk_pcp_op_detalhe_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_op_detalhe
    ADD CONSTRAINT pk_pcp_op_detalhe_01 PRIMARY KEY (id);


--
-- TOC entry 8988 (class 2606 OID 27231)
-- Name: pcp_servico pk_pcp_servico_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_servico
    ADD CONSTRAINT pk_pcp_servico_01 PRIMARY KEY (id);


--
-- TOC entry 8992 (class 2606 OID 27242)
-- Name: pcp_servico_colaborador pk_pcp_servico_colaborador_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_servico_colaborador
    ADD CONSTRAINT pk_pcp_servico_colaborador_01 PRIMARY KEY (id);


--
-- TOC entry 8996 (class 2606 OID 27253)
-- Name: pcp_servico_equipamento pk_pcp_servico_equipamento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_servico_equipamento
    ADD CONSTRAINT pk_pcp_servico_equipamento_01 PRIMARY KEY (id);


--
-- TOC entry 8879 (class 2606 OID 26347)
-- Name: com_vend_pdv_caixa pk_pdv_caixa_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pdv_caixa
    ADD CONSTRAINT pk_pdv_caixa_01 PRIMARY KEY (id);


--
-- TOC entry 8881 (class 2606 OID 26393)
-- Name: com_vend_pdv_configuracao pk_pdv_configuracao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pdv_configuracao
    ADD CONSTRAINT pk_pdv_configuracao_01 PRIMARY KEY (id);


--
-- TOC entry 8883 (class 2606 OID 26409)
-- Name: com_vend_pdv_fechamento pk_pdv_fechamento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pdv_fechamento
    ADD CONSTRAINT pk_pdv_fechamento_01 PRIMARY KEY (id);


--
-- TOC entry 8885 (class 2606 OID 26439)
-- Name: com_vend_pdv_movimento pk_pdv_movimento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pdv_movimento
    ADD CONSTRAINT pk_pdv_movimento_01 PRIMARY KEY (id);


--
-- TOC entry 8887 (class 2606 OID 26454)
-- Name: com_vend_pdv_sangria pk_pdv_sangria_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pdv_sangria
    ADD CONSTRAINT pk_pdv_sangria_01 PRIMARY KEY (id);


--
-- TOC entry 8889 (class 2606 OID 26469)
-- Name: com_vend_pdv_suprimento pk_pdv_suprimento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pdv_suprimento
    ADD CONSTRAINT pk_pdv_suprimento_01 PRIMARY KEY (id);


--
-- TOC entry 8891 (class 2606 OID 26485)
-- Name: com_vend_pdv_tipo_pagamento pk_pdv_tipo_pagamento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pdv_tipo_pagamento
    ADD CONSTRAINT pk_pdv_tipo_pagamento_01 PRIMARY KEY (id);


--
-- TOC entry 8893 (class 2606 OID 26510)
-- Name: com_vend_pdv_total_tipo_pagamento pk_pdv_total_tipo_pagamento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pdv_total_tipo_pagamento
    ADD CONSTRAINT pk_pdv_total_tipo_pagamento_01 PRIMARY KEY (id);


--
-- TOC entry 8895 (class 2606 OID 26557)
-- Name: com_vend_pdv_venda_cab pk_pdv_venda_cab_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pdv_venda_cab
    ADD CONSTRAINT pk_pdv_venda_cab_01 PRIMARY KEY (id);


--
-- TOC entry 8897 (class 2606 OID 26603)
-- Name: com_vend_pdv_venda_det pk_pdv_venda_det_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pdv_venda_det
    ADD CONSTRAINT pk_pdv_venda_det_01 PRIMARY KEY (id);


--
-- TOC entry 8695 (class 2606 OID 23166)
-- Name: corp_pessoa pk_pessoa_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa
    ADD CONSTRAINT pk_pessoa_01 PRIMARY KEY (id);


--
-- TOC entry 8698 (class 2606 OID 23178)
-- Name: corp_pessoa_alteracao pk_pessoa_alteracao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_alteracao
    ADD CONSTRAINT pk_pessoa_alteracao_01 PRIMARY KEY (id);


--
-- TOC entry 8701 (class 2606 OID 23193)
-- Name: corp_pessoa_contato pk_pessoa_contato_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_contato
    ADD CONSTRAINT pk_pessoa_contato_01 PRIMARY KEY (id);


--
-- TOC entry 8704 (class 2606 OID 23217)
-- Name: corp_pessoa_endereco pk_pessoa_endereco_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_endereco
    ADD CONSTRAINT pk_pessoa_endereco_01 PRIMARY KEY (id);


--
-- TOC entry 8710 (class 2606 OID 23240)
-- Name: corp_pessoa_fisica pk_pessoa_fisica_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_fisica
    ADD CONSTRAINT pk_pessoa_fisica_01 PRIMARY KEY (id);


--
-- TOC entry 8714 (class 2606 OID 23256)
-- Name: corp_pessoa_juridica pk_pessoa_juridica_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_juridica
    ADD CONSTRAINT pk_pessoa_juridica_01 PRIMARY KEY (id);


--
-- TOC entry 8717 (class 2606 OID 23268)
-- Name: corp_pessoa_telefone pk_pessoa_telefone_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_telefone
    ADD CONSTRAINT pk_pessoa_telefone_01 PRIMARY KEY (id);


--
-- TOC entry 8999 (class 2606 OID 27268)
-- Name: prdc_produto_ficha_tecnica pk_prdc_produto_ficha_tecnica; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.prdc_produto_ficha_tecnica
    ADD CONSTRAINT pk_prdc_produto_ficha_tecnica PRIMARY KEY (id);


--
-- TOC entry 8901 (class 2606 OID 26624)
-- Name: com_vend_pre_venda_cab pk_pre_venda_cab_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pre_venda_cab
    ADD CONSTRAINT pk_pre_venda_cab_01 PRIMARY KEY (id);


--
-- TOC entry 8906 (class 2606 OID 26644)
-- Name: com_vend_pre_venda_det pk_pre_venda_det_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pre_venda_det
    ADD CONSTRAINT pk_pre_venda_det_01 PRIMARY KEY (id);


--
-- TOC entry 8724 (class 2606 OID 23294)
-- Name: corp_produto pk_produto_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto
    ADD CONSTRAINT pk_produto_01 PRIMARY KEY (id);


--
-- TOC entry 8727 (class 2606 OID 23306)
-- Name: corp_produto_alteracao_item pk_produto_alteracao_item_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_alteracao_item
    ADD CONSTRAINT pk_produto_alteracao_item_01 PRIMARY KEY (id);


--
-- TOC entry 8730 (class 2606 OID 23317)
-- Name: corp_produto_codigo_adicional pk_produto_codigo_adicional_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_codigo_adicional
    ADD CONSTRAINT pk_produto_codigo_adicional_01 PRIMARY KEY (id);


--
-- TOC entry 8733 (class 2606 OID 23331)
-- Name: corp_produto_ficha_tecnica pk_produto_ficha_tecnica_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_ficha_tecnica
    ADD CONSTRAINT pk_produto_ficha_tecnica_01 PRIMARY KEY (id);


--
-- TOC entry 8735 (class 2606 OID 23342)
-- Name: corp_produto_grupo pk_produto_grupo_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_grupo
    ADD CONSTRAINT pk_produto_grupo_01 PRIMARY KEY (id);


--
-- TOC entry 8737 (class 2606 OID 23353)
-- Name: corp_produto_marca pk_produto_marca_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_marca
    ADD CONSTRAINT pk_produto_marca_01 PRIMARY KEY (id);


--
-- TOC entry 8740 (class 2606 OID 23366)
-- Name: corp_produto_promocao pk_produto_promocao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_promocao
    ADD CONSTRAINT pk_produto_promocao_01 PRIMARY KEY (id);


--
-- TOC entry 8743 (class 2606 OID 23378)
-- Name: corp_produto_subgrupo pk_produto_subgrupo_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_subgrupo
    ADD CONSTRAINT pk_produto_subgrupo_01 PRIMARY KEY (id);


--
-- TOC entry 8745 (class 2606 OID 23390)
-- Name: corp_produto_unidade pk_produto_unidade_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_unidade
    ADD CONSTRAINT pk_produto_unidade_01 PRIMARY KEY (id);


--
-- TOC entry 8820 (class 2606 OID 25360)
-- Name: rhfo_cbo pk_rhfo_cbo; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.rhfo_cbo
    ADD CONSTRAINT pk_rhfo_cbo PRIMARY KEY (id);


--
-- TOC entry 8836 (class 2606 OID 25467)
-- Name: rhfo_estado_civil pk_rhfo_estado_civil; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.rhfo_estado_civil
    ADD CONSTRAINT pk_rhfo_estado_civil PRIMARY KEY (id);


--
-- TOC entry 8747 (class 2606 OID 23401)
-- Name: corp_setor pk_setor_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_setor
    ADD CONSTRAINT pk_setor_01 PRIMARY KEY (id);


--
-- TOC entry 8749 (class 2606 OID 23429)
-- Name: corp_sindicato pk_sindicato_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_sindicato
    ADD CONSTRAINT pk_sindicato_01 PRIMARY KEY (id);


--
-- TOC entry 8777 (class 2606 OID 24873)
-- Name: supr_estq_reajuste_cab pk_supr_estq_reajuste_cab; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_reajuste_cab
    ADD CONSTRAINT pk_supr_estq_reajuste_cab PRIMARY KEY (id);


--
-- TOC entry 8779 (class 2606 OID 24886)
-- Name: supr_estq_reajuste_det pk_supr_estq_reajuste_det; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_reajuste_det
    ADD CONSTRAINT pk_supr_estq_reajuste_det PRIMARY KEY (id);


--
-- TOC entry 8791 (class 2606 OID 24951)
-- Name: supr_req_interna_cab pk_supr_req_interna_cab; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_req_interna_cab
    ADD CONSTRAINT pk_supr_req_interna_cab PRIMARY KEY (id);


--
-- TOC entry 8794 (class 2606 OID 24963)
-- Name: supr_req_interna_det pk_supr_req_interna_det; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_req_interna_det
    ADD CONSTRAINT pk_supr_req_interna_det PRIMARY KEY (id);


--
-- TOC entry 8751 (class 2606 OID 23441)
-- Name: corp_tabela_preco pk_tabela_preco_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_tabela_preco
    ADD CONSTRAINT pk_tabela_preco_01 PRIMARY KEY (id);


--
-- TOC entry 8753 (class 2606 OID 23454)
-- Name: corp_tipo_admissao pk_tipo_admissao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_tipo_admissao
    ADD CONSTRAINT pk_tipo_admissao_01 PRIMARY KEY (id);


--
-- TOC entry 8755 (class 2606 OID 23467)
-- Name: corp_tipo_relacionamento pk_tipo_relacionamento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_tipo_relacionamento
    ADD CONSTRAINT pk_tipo_relacionamento_01 PRIMARY KEY (id);


--
-- TOC entry 8758 (class 2606 OID 23478)
-- Name: corp_transportadora pk_transportadora_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_transportadora
    ADD CONSTRAINT pk_transportadora_01 PRIMARY KEY (id);


--
-- TOC entry 8840 (class 2606 OID 25494)
-- Name: fisc_tribut_icms_uf pk_tribut_icms_uf_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_tribut_icms_uf
    ADD CONSTRAINT pk_tribut_icms_uf_01 PRIMARY KEY (id);


--
-- TOC entry 8930 (class 2606 OID 26729)
-- Name: com_vend_comissao pk_venda_comissao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_comissao
    ADD CONSTRAINT pk_venda_comissao_01 PRIMARY KEY (id);


--
-- TOC entry 8932 (class 2606 OID 26748)
-- Name: com_vend_condicoes_pagamento pk_venda_condicoes_pagamento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_condicoes_pagamento
    ADD CONSTRAINT pk_venda_condicoes_pagamento_01 PRIMARY KEY (id);


--
-- TOC entry 8935 (class 2606 OID 26761)
-- Name: com_vend_condicoes_parcelas pk_venda_condicoes_parcelas_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_condicoes_parcelas
    ADD CONSTRAINT pk_venda_condicoes_parcelas_01 PRIMARY KEY (id);


--
-- TOC entry 8939 (class 2606 OID 26778)
-- Name: com_vend_det pk_venda_det_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_det
    ADD CONSTRAINT pk_venda_det_01 PRIMARY KEY (id);


--
-- TOC entry 8943 (class 2606 OID 26799)
-- Name: com_vend_frete pk_venda_frete_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_frete
    ADD CONSTRAINT pk_venda_frete_01 PRIMARY KEY (id);


--
-- TOC entry 8949 (class 2606 OID 26823)
-- Name: com_vend_orcamento_cab pk_venda_orcamento_cab_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_orcamento_cab
    ADD CONSTRAINT pk_venda_orcamento_cab_01 PRIMARY KEY (id);


--
-- TOC entry 8954 (class 2606 OID 26840)
-- Name: com_vend_orcamento_det pk_venda_orcamento_det_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_orcamento_det
    ADD CONSTRAINT pk_venda_orcamento_det_01 PRIMARY KEY (id);


--
-- TOC entry 8766 (class 2606 OID 23515)
-- Name: corp_vendedor pk_vendedor_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_vendedor
    ADD CONSTRAINT pk_vendedor_01 PRIMARY KEY (id);


--
-- TOC entry 8796 (class 2606 OID 24978)
-- Name: supr_wms_agendamento pk_wms_agendamento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_agendamento
    ADD CONSTRAINT pk_wms_agendamento_01 PRIMARY KEY (id);


--
-- TOC entry 8798 (class 2606 OID 24990)
-- Name: supr_wms_armazenamento pk_wms_armazenamento_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_armazenamento
    ADD CONSTRAINT pk_wms_armazenamento_01 PRIMARY KEY (id);


--
-- TOC entry 8800 (class 2606 OID 25004)
-- Name: supr_wms_caixa pk_wms_caixa_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_caixa
    ADD CONSTRAINT pk_wms_caixa_01 PRIMARY KEY (id);


--
-- TOC entry 8802 (class 2606 OID 25016)
-- Name: supr_wms_estante pk_wms_estante_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_estante
    ADD CONSTRAINT pk_wms_estante_01 PRIMARY KEY (id);


--
-- TOC entry 8804 (class 2606 OID 25028)
-- Name: supr_wms_expedicao pk_wms_expedicao_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_expedicao
    ADD CONSTRAINT pk_wms_expedicao_01 PRIMARY KEY (id);


--
-- TOC entry 8806 (class 2606 OID 25038)
-- Name: supr_wms_ordem_separacao_cab pk_wms_ordem_separacao_cab_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_ordem_separacao_cab
    ADD CONSTRAINT pk_wms_ordem_separacao_cab_01 PRIMARY KEY (id);


--
-- TOC entry 8809 (class 2606 OID 25050)
-- Name: supr_wms_ordem_separacao_det pk_wms_ordem_separacao_det_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_ordem_separacao_det
    ADD CONSTRAINT pk_wms_ordem_separacao_det_01 PRIMARY KEY (id);


--
-- TOC entry 8811 (class 2606 OID 25064)
-- Name: supr_wms_parametro pk_wms_parametro_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_parametro
    ADD CONSTRAINT pk_wms_parametro_01 PRIMARY KEY (id);


--
-- TOC entry 8813 (class 2606 OID 25081)
-- Name: supr_wms_recebimento_cab pk_wms_recebimento_cab; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_recebimento_cab
    ADD CONSTRAINT pk_wms_recebimento_cab PRIMARY KEY (id);


--
-- TOC entry 8816 (class 2606 OID 25096)
-- Name: supr_wms_recebimento_det pk_wms_recebimento_det; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_recebimento_det
    ADD CONSTRAINT pk_wms_recebimento_det PRIMARY KEY (id);


--
-- TOC entry 8818 (class 2606 OID 25108)
-- Name: supr_wms_rua pk_wms_rua_01; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_rua
    ADD CONSTRAINT pk_wms_rua_01 PRIMARY KEY (id);


--
-- TOC entry 9043 (class 2606 OID 28470)
-- Name: supr_estq_local supr_estq_local_pkey; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_local
    ADD CONSTRAINT supr_estq_local_pkey PRIMARY KEY (id);


--
-- TOC entry 9047 (class 2606 OID 28497)
-- Name: supr_estq_movimentacao supr_estq_movimentacao_pkey; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_movimentacao
    ADD CONSTRAINT supr_estq_movimentacao_pkey PRIMARY KEY (id);


--
-- TOC entry 9050 (class 2606 OID 28512)
-- Name: supr_estq_saldo_historico supr_estq_saldo_historico_pkey; Type: CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_saldo_historico
    ADD CONSTRAINT supr_estq_saldo_historico_pkey PRIMARY KEY (id);


--
-- TOC entry 8279 (class 1259 OID 16885)
-- Name: adm_agen_cat_comp_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX adm_agen_cat_comp_ix01 ON sagnus.adm_agen_cat_compromisso USING btree (nome);


--
-- TOC entry 8286 (class 1259 OID 16934)
-- Name: adm_agen_comp_conv_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX adm_agen_comp_conv_ix01 ON sagnus.adm_agen_comp_conv USING btree (id_compromisso);


--
-- TOC entry 8287 (class 1259 OID 16935)
-- Name: adm_agen_comp_conv_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX adm_agen_comp_conv_ix02 ON sagnus.adm_agen_comp_conv USING btree (id_colaborador);


--
-- TOC entry 8282 (class 1259 OID 16909)
-- Name: adm_agen_compromisso_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX adm_agen_compromisso_ix01 ON sagnus.adm_agen_compromisso USING btree (id_categoria);


--
-- TOC entry 8283 (class 1259 OID 16910)
-- Name: adm_agen_compromisso_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX adm_agen_compromisso_ix02 ON sagnus.adm_agen_compromisso USING btree (id_colaborador);


--
-- TOC entry 8290 (class 1259 OID 16953)
-- Name: adm_agen_notificacao_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX adm_agen_notificacao_ix01 ON sagnus.adm_agen_notificacao USING btree (id_compromisso);


--
-- TOC entry 8274 (class 1259 OID 16862)
-- Name: adm_modulo_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX adm_modulo_ix01 ON sagnus.adm_modulo USING btree (codigo);


--
-- TOC entry 8296 (class 1259 OID 16979)
-- Name: fina_cad_doc_orig_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cad_doc_orig_ix01 ON sagnus.fina_cad_doc_origem USING btree (codigo);


--
-- TOC entry 8293 (class 1259 OID 16965)
-- Name: fina_cad_nat_fin_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cad_nat_fin_ix01 ON sagnus.fina_cad_nat_financeira USING btree (codigo);


--
-- TOC entry 8299 (class 1259 OID 16994)
-- Name: fina_cad_status_parc_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cad_status_parc_ix01 ON sagnus.fina_cad_status_parcela USING btree (situacao);


--
-- TOC entry 8302 (class 1259 OID 17006)
-- Name: fina_cad_tipo_pagto_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cad_tipo_pagto_ix01 ON sagnus.fina_cad_tipo_pagto USING btree (codigo);


--
-- TOC entry 8305 (class 1259 OID 17018)
-- Name: fina_cad_tipo_receb_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cad_tipo_receb_ix01 ON sagnus.fina_cad_tipo_receb USING btree (codigo);


--
-- TOC entry 8317 (class 1259 OID 17106)
-- Name: fina_cap_lancamento_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cap_lancamento_ix01 ON sagnus.fina_cap_lancamento USING btree (id_fornecedor);


--
-- TOC entry 8318 (class 1259 OID 17107)
-- Name: fina_cap_lancamento_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cap_lancamento_ix02 ON sagnus.fina_cap_lancamento USING btree (id_nat_financeira);


--
-- TOC entry 8321 (class 1259 OID 17138)
-- Name: fina_cap_parcela_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cap_parcela_ix01 ON sagnus.fina_cap_parcela USING btree (id_lancamento);


--
-- TOC entry 8322 (class 1259 OID 17139)
-- Name: fina_cap_parcela_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cap_parcela_ix02 ON sagnus.fina_cap_parcela USING btree (id_status_parcela);


--
-- TOC entry 8325 (class 1259 OID 17177)
-- Name: fina_car_lancamento_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_car_lancamento_ix01 ON sagnus.fina_car_lancamento USING btree (id_cliente);


--
-- TOC entry 8326 (class 1259 OID 17178)
-- Name: fina_car_lancamento_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_car_lancamento_ix02 ON sagnus.fina_car_lancamento USING btree (id_nat_financeira);


--
-- TOC entry 8329 (class 1259 OID 17209)
-- Name: fina_car_parcela_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_car_parcela_ix01 ON sagnus.fina_car_parcela USING btree (id_lancamento);


--
-- TOC entry 8330 (class 1259 OID 17210)
-- Name: fina_car_parcela_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_car_parcela_ix02 ON sagnus.fina_car_parcela USING btree (id_status_parcela);


--
-- TOC entry 8350 (class 1259 OID 17364)
-- Name: fina_cbk_conc_item_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cbk_conc_item_ix01 ON sagnus.fina_cbk_conc_item USING btree (id_conciliacao);


--
-- TOC entry 8351 (class 1259 OID 17365)
-- Name: fina_cbk_conc_item_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cbk_conc_item_ix02 ON sagnus.fina_cbk_conc_item USING btree (id_extrato);


--
-- TOC entry 8352 (class 1259 OID 17366)
-- Name: fina_cbk_conc_item_ix03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cbk_conc_item_ix03 ON sagnus.fina_cbk_conc_item USING btree (id_cap_parcela);


--
-- TOC entry 8353 (class 1259 OID 17367)
-- Name: fina_cbk_conc_item_ix04; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cbk_conc_item_ix04 ON sagnus.fina_cbk_conc_item USING btree (id_car_parcela);


--
-- TOC entry 8354 (class 1259 OID 17368)
-- Name: fina_cbk_conc_item_ix05; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cbk_conc_item_ix05 ON sagnus.fina_cbk_conc_item USING btree (id_edi_linha);


--
-- TOC entry 8347 (class 1259 OID 17324)
-- Name: fina_cbk_conc_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cbk_conc_ix01 ON sagnus.fina_cbk_conc USING btree (id_conta_caixa, periodo_inicio, periodo_fim);


--
-- TOC entry 8311 (class 1259 OID 17050)
-- Name: fina_cxb_banco_ag_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cxb_banco_ag_ix01 ON sagnus.fina_cxb_banco_agencia USING btree (id_banco);


--
-- TOC entry 8308 (class 1259 OID 17030)
-- Name: fina_cxb_banco_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cxb_banco_ix01 ON sagnus.fina_cxb_banco USING btree (codigo);


--
-- TOC entry 8314 (class 1259 OID 17067)
-- Name: fina_cxb_conta_caixa_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cxb_conta_caixa_ix01 ON sagnus.fina_cxb_conta_caixa USING btree (id_banco_agencia);


--
-- TOC entry 8342 (class 1259 OID 17300)
-- Name: fina_cxb_extrato_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cxb_extrato_ix01 ON sagnus.fina_cxb_extrato USING btree (id_conta_caixa, data_movimento);


--
-- TOC entry 8343 (class 1259 OID 17301)
-- Name: fina_cxb_extrato_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cxb_extrato_ix02 ON sagnus.fina_cxb_extrato USING btree (id_cap_parcela);


--
-- TOC entry 8344 (class 1259 OID 17302)
-- Name: fina_cxb_extrato_ix03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_cxb_extrato_ix03 ON sagnus.fina_cxb_extrato USING btree (id_car_parcela);


--
-- TOC entry 8333 (class 1259 OID 17231)
-- Name: fina_edi_arquivo_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_edi_arquivo_ix01 ON sagnus.fina_edi_arquivo USING btree (id_conta_caixa);


--
-- TOC entry 8334 (class 1259 OID 17232)
-- Name: fina_edi_arquivo_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_edi_arquivo_ix02 ON sagnus.fina_edi_arquivo USING btree (data_geracao);


--
-- TOC entry 8337 (class 1259 OID 17262)
-- Name: fina_edi_linha_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_edi_linha_ix01 ON sagnus.fina_edi_linha USING btree (id_arquivo);


--
-- TOC entry 8338 (class 1259 OID 17263)
-- Name: fina_edi_linha_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_edi_linha_ix02 ON sagnus.fina_edi_linha USING btree (id_cap_parcela);


--
-- TOC entry 8339 (class 1259 OID 17264)
-- Name: fina_edi_linha_ix03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_edi_linha_ix03 ON sagnus.fina_edi_linha USING btree (id_car_parcela);


--
-- TOC entry 8374 (class 1259 OID 17555)
-- Name: fina_fcx_previsto_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_fcx_previsto_ix01 ON sagnus.fina_fcx_previsto USING btree (id_conta_caixa, data_prevista);


--
-- TOC entry 8375 (class 1259 OID 17556)
-- Name: fina_fcx_previsto_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_fcx_previsto_ix02 ON sagnus.fina_fcx_previsto USING btree (id_cap_parcela);


--
-- TOC entry 8376 (class 1259 OID 17557)
-- Name: fina_fcx_previsto_ix03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_fcx_previsto_ix03 ON sagnus.fina_fcx_previsto USING btree (id_car_parcela);


--
-- TOC entry 8379 (class 1259 OID 17576)
-- Name: fina_fcx_saldo_diario_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_fcx_saldo_diario_ix01 ON sagnus.fina_fcx_saldo_diario USING btree (id_conta_caixa, data_referencia);


--
-- TOC entry 8366 (class 1259 OID 17475)
-- Name: fina_tes_aplicacao_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_tes_aplicacao_ix01 ON sagnus.fina_tes_aplicacao USING btree (id_conta_origem, id_conta_aplicacao);


--
-- TOC entry 8367 (class 1259 OID 17476)
-- Name: fina_tes_aplicacao_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_tes_aplicacao_ix02 ON sagnus.fina_tes_aplicacao USING btree (data_aplicacao);


--
-- TOC entry 8357 (class 1259 OID 17400)
-- Name: fina_tes_mov_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_tes_mov_ix01 ON sagnus.fina_tes_movimento USING btree (id_conta_caixa, data_movimento);


--
-- TOC entry 8358 (class 1259 OID 17401)
-- Name: fina_tes_mov_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_tes_mov_ix02 ON sagnus.fina_tes_movimento USING btree (id_cap_parcela);


--
-- TOC entry 8359 (class 1259 OID 17402)
-- Name: fina_tes_mov_ix03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_tes_mov_ix03 ON sagnus.fina_tes_movimento USING btree (id_car_parcela);


--
-- TOC entry 8370 (class 1259 OID 17512)
-- Name: fina_tes_resgate_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_tes_resgate_ix01 ON sagnus.fina_tes_resgate USING btree (id_aplicacao);


--
-- TOC entry 8371 (class 1259 OID 17513)
-- Name: fina_tes_resgate_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_tes_resgate_ix02 ON sagnus.fina_tes_resgate USING btree (data_resgate);


--
-- TOC entry 8362 (class 1259 OID 17438)
-- Name: fina_tes_transf_ix01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_tes_transf_ix01 ON sagnus.fina_tes_transferencia USING btree (id_conta_origem, id_conta_destino);


--
-- TOC entry 8363 (class 1259 OID 17439)
-- Name: fina_tes_transf_ix02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX fina_tes_transf_ix02 ON sagnus.fina_tes_transferencia USING btree (data_movimento);


--
-- TOC entry 9048 (class 1259 OID 28523)
-- Name: idx_snapshot_data; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX idx_snapshot_data ON sagnus.supr_estq_saldo_historico USING btree (data_snapshot);


--
-- TOC entry 9053 (class 1259 OID 28545)
-- Name: idx_vend_pedido_faturamento; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX idx_vend_pedido_faturamento ON sagnus.com_vend_pedido USING btree (data_faturamento);


--
-- TOC entry 8642 (class 1259 OID 23706)
-- Name: ix_cliente_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cliente_01 ON sagnus.corp_cliente USING btree (id_pessoa);


--
-- TOC entry 8643 (class 1259 OID 23707)
-- Name: ix_cliente_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cliente_02 ON sagnus.corp_cliente USING btree (id_tabela_preco);


--
-- TOC entry 8648 (class 1259 OID 23708)
-- Name: ix_colaborador_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_colaborador_01 ON sagnus.corp_colaborador USING btree (id_pessoa);


--
-- TOC entry 8649 (class 1259 OID 23709)
-- Name: ix_colaborador_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_colaborador_02 ON sagnus.corp_colaborador USING btree (id_cargo);


--
-- TOC entry 8650 (class 1259 OID 23710)
-- Name: ix_colaborador_03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_colaborador_03 ON sagnus.corp_colaborador USING btree (id_setor);


--
-- TOC entry 8651 (class 1259 OID 23711)
-- Name: ix_colaborador_04; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_colaborador_04 ON sagnus.corp_colaborador USING btree (id_colaborador_situacao);


--
-- TOC entry 8652 (class 1259 OID 23712)
-- Name: ix_colaborador_05; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_colaborador_05 ON sagnus.corp_colaborador USING btree (id_tipo_admissao);


--
-- TOC entry 8653 (class 1259 OID 23713)
-- Name: ix_colaborador_06; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_colaborador_06 ON sagnus.corp_colaborador USING btree (id_colaborador_tipo);


--
-- TOC entry 8654 (class 1259 OID 23714)
-- Name: ix_colaborador_07; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_colaborador_07 ON sagnus.corp_colaborador USING btree (id_sindicato);


--
-- TOC entry 8657 (class 1259 OID 23715)
-- Name: ix_colaborador_relacionamento_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_colaborador_relacionamento_01 ON sagnus.corp_colaborador_relacionamento USING btree (id_tipo_relacionamento);


--
-- TOC entry 8658 (class 1259 OID 23716)
-- Name: ix_colaborador_relacionamento_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_colaborador_relacionamento_02 ON sagnus.corp_colaborador_relacionamento USING btree (id_colaborador);


--
-- TOC entry 8869 (class 1259 OID 26989)
-- Name: ix_comissao_objetivo; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_comissao_objetivo ON sagnus.com_vend_comissao_objetivo USING btree (id_produto);


--
-- TOC entry 8870 (class 1259 OID 26958)
-- Name: ix_comissao_objetivo_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_comissao_objetivo_01 ON sagnus.com_vend_comissao_objetivo USING btree (id_comissao_perfil);


--
-- TOC entry 8871 (class 1259 OID 26959)
-- Name: ix_comissao_objetivo_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_comissao_objetivo_02 ON sagnus.com_vend_comissao_objetivo USING btree (id_produto);


--
-- TOC entry 8705 (class 1259 OID 23773)
-- Name: ix_corp_pessoa_fisica_cpf; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_corp_pessoa_fisica_cpf ON sagnus.corp_pessoa_fisica USING btree (cpf);


--
-- TOC entry 8711 (class 1259 OID 23772)
-- Name: ix_corp_pessoa_juridica_cnpj; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_corp_pessoa_juridica_cnpj ON sagnus.corp_pessoa_juridica USING btree (cnpj);


--
-- TOC entry 8520 (class 1259 OID 21423)
-- Name: ix_cte_aereo_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_aereo_01 ON sagnus.fisc_cte_aereo USING btree (id_cte_cabecalho);


--
-- TOC entry 8523 (class 1259 OID 21445)
-- Name: ix_cte_aquaviario_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_aquaviario_01 ON sagnus.fisc_cte_aquaviario USING btree (id_cte_cabecalho);


--
-- TOC entry 8526 (class 1259 OID 21470)
-- Name: ix_cte_aquaviario_balsa_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_aquaviario_balsa_01 ON sagnus.fisc_cte_aquaviario_balsa USING btree (id_cte_aquaviario);


--
-- TOC entry 8529 (class 1259 OID 21490)
-- Name: ix_cte_carga_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_carga_01 ON sagnus.fisc_cte_carga USING btree (id_cte_cabecalho);


--
-- TOC entry 8532 (class 1259 OID 21509)
-- Name: ix_cte_componente_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_componente_01 ON sagnus.fisc_cte_componente USING btree (id_cte_cabecalho);


--
-- TOC entry 8535 (class 1259 OID 23776)
-- Name: ix_cte_destinat_id_pessoa; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_destinat_id_pessoa ON sagnus.fisc_cte_destinatario USING btree (id_pessoa);


--
-- TOC entry 8536 (class 1259 OID 21545)
-- Name: ix_cte_destinatario_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_destinatario_01 ON sagnus.fisc_cte_destinatario USING btree (id_cte_cabecalho);


--
-- TOC entry 8539 (class 1259 OID 21567)
-- Name: ix_cte_documento_anterior_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_documento_anterior_01 ON sagnus.fisc_cte_documento_anterior USING btree (id_cte_cabecalho);


--
-- TOC entry 8544 (class 1259 OID 21598)
-- Name: ix_cte_duplicata_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_duplicata_01 ON sagnus.fisc_cte_duplicata USING btree (id_cte_cabecalho);


--
-- TOC entry 8547 (class 1259 OID 21616)
-- Name: ix_cte_dutoviario_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_dutoviario_01 ON sagnus.fisc_cte_dutoviario USING btree (id_cte_cabecalho);


--
-- TOC entry 8550 (class 1259 OID 21648)
-- Name: ix_cte_emitente_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_emitente_01 ON sagnus.fisc_cte_emitente USING btree (id_cte_cabecalho);


--
-- TOC entry 8551 (class 1259 OID 23774)
-- Name: ix_cte_emitente_id_pessoa; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_emitente_id_pessoa ON sagnus.fisc_cte_emitente USING btree (id_pessoa);


--
-- TOC entry 8554 (class 1259 OID 21684)
-- Name: ix_cte_expedidor_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_expedidor_01 ON sagnus.fisc_cte_expedidor USING btree (id_cte_cabecalho);


--
-- TOC entry 8555 (class 1259 OID 23777)
-- Name: ix_cte_expedidor_id_pessoa; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_expedidor_id_pessoa ON sagnus.fisc_cte_expedidor USING btree (id_pessoa);


--
-- TOC entry 8558 (class 1259 OID 21705)
-- Name: ix_cte_fatura_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_fatura_01 ON sagnus.fisc_cte_fatura USING btree (id_cte_cabecalho);


--
-- TOC entry 8561 (class 1259 OID 21728)
-- Name: ix_cte_ferroviario_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_ferroviario_01 ON sagnus.fisc_cte_ferroviario USING btree (id_cte_cabecalho);


--
-- TOC entry 8564 (class 1259 OID 21759)
-- Name: ix_cte_ferroviario_ferrovia_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_ferroviario_ferrovia_01 ON sagnus.fisc_cte_ferroviario_ferrovia USING btree (id_cte_ferroviario);


--
-- TOC entry 8567 (class 1259 OID 21781)
-- Name: ix_cte_ferroviario_vagao_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_ferroviario_vagao_01 ON sagnus.fisc_cte_ferroviario_vagao USING btree (id_cte_ferroviario);


--
-- TOC entry 8579 (class 1259 OID 21874)
-- Name: ix_cte_inf_nf_carga_lacre_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_inf_nf_carga_lacre_01 ON sagnus.fisc_cte_inf_nf_carga_lacre USING btree (id_cte_informacao_nf_carga);


--
-- TOC entry 8582 (class 1259 OID 21892)
-- Name: ix_cte_inf_nf_transporte_lacre_0; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_inf_nf_transporte_lacre_0 ON sagnus.fisc_cte_inf_nf_transporte_lacre USING btree (id_cte_informacao_nf_transporte);


--
-- TOC entry 8576 (class 1259 OID 21855)
-- Name: ix_cte_informacao_nf_carga_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_informacao_nf_carga_01 ON sagnus.fisc_cte_informacao_nf_carga USING btree (id_cte_informacao_nf);


--
-- TOC entry 8570 (class 1259 OID 21817)
-- Name: ix_cte_informacao_nf_outros_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_informacao_nf_outros_01 ON sagnus.fisc_cte_informacao_nf_outros USING btree (id_cte_cabecalho);


--
-- TOC entry 8573 (class 1259 OID 21836)
-- Name: ix_cte_informacao_nf_transporte_; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_informacao_nf_transporte_ ON sagnus.fisc_cte_informacao_nf_transporte USING btree (id_cte_informacao_nf);


--
-- TOC entry 8585 (class 1259 OID 21921)
-- Name: ix_cte_local_coleta_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_local_coleta_01 ON sagnus.fisc_cte_local_coleta USING btree (id_cte_cabecalho);


--
-- TOC entry 8586 (class 1259 OID 23780)
-- Name: ix_cte_local_coleta_id_pessoa; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_local_coleta_id_pessoa ON sagnus.fisc_cte_local_coleta USING btree (id_pessoa);


--
-- TOC entry 8589 (class 1259 OID 21950)
-- Name: ix_cte_local_entrega_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_local_entrega_01 ON sagnus.fisc_cte_local_entrega USING btree (id_cte_cabecalho);


--
-- TOC entry 8590 (class 1259 OID 23781)
-- Name: ix_cte_local_entrega_id_pessoa; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_local_entrega_id_pessoa ON sagnus.fisc_cte_local_entrega USING btree (id_pessoa);


--
-- TOC entry 8593 (class 1259 OID 21969)
-- Name: ix_cte_multimodal_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_multimodal_01 ON sagnus.fisc_cte_multimodal USING btree (id_cte_cabecalho);


--
-- TOC entry 8596 (class 1259 OID 21989)
-- Name: ix_cte_passagem_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_passagem_01 ON sagnus.fisc_cte_passagem USING btree (id_cte_cabecalho);


--
-- TOC entry 8599 (class 1259 OID 22013)
-- Name: ix_cte_perigoso_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_perigoso_01 ON sagnus.fisc_cte_perigoso USING btree (id_cte_cabecalho);


--
-- TOC entry 8602 (class 1259 OID 22049)
-- Name: ix_cte_recebedor_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_recebedor_01 ON sagnus.fisc_cte_recebedor USING btree (id_cte_cabecalho);


--
-- TOC entry 8603 (class 1259 OID 23778)
-- Name: ix_cte_recebedor_id_pessoa; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_recebedor_id_pessoa ON sagnus.fisc_cte_recebedor USING btree (id_pessoa);


--
-- TOC entry 8606 (class 1259 OID 22085)
-- Name: ix_cte_remetente_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_remetente_01 ON sagnus.fisc_cte_remetente USING btree (id_cte_cabecalho);


--
-- TOC entry 8607 (class 1259 OID 23775)
-- Name: ix_cte_remetente_id_pessoa; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_remetente_id_pessoa ON sagnus.fisc_cte_remetente USING btree (id_pessoa);


--
-- TOC entry 8610 (class 1259 OID 22105)
-- Name: ix_cte_rodoviario_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_rodoviario_01 ON sagnus.fisc_cte_rodoviario USING btree (id_cte_cabecalho);


--
-- TOC entry 8613 (class 1259 OID 22123)
-- Name: ix_cte_rodoviario_lacre_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_rodoviario_lacre_01 ON sagnus.fisc_cte_rodoviario_lacre USING btree (id_cte_rodoviario);


--
-- TOC entry 8616 (class 1259 OID 22142)
-- Name: ix_cte_rodoviario_motorista_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_rodoviario_motorista_01 ON sagnus.fisc_cte_rodoviario_motorista USING btree (id_cte_rodoviario);


--
-- TOC entry 8619 (class 1259 OID 22166)
-- Name: ix_cte_rodoviario_occ_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_rodoviario_occ_01 ON sagnus.fisc_cte_rodoviario_occ USING btree (id_cte_rodoviario);


--
-- TOC entry 8622 (class 1259 OID 22187)
-- Name: ix_cte_rodoviario_pedagio_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_rodoviario_pedagio_01 ON sagnus.fisc_cte_rodoviario_pedagio USING btree (id_cte_rodoviario);


--
-- TOC entry 8625 (class 1259 OID 22222)
-- Name: ix_cte_rodoviario_veiculo_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_rodoviario_veiculo_01 ON sagnus.fisc_cte_rodoviario_veiculo USING btree (id_cte_rodoviario);


--
-- TOC entry 8628 (class 1259 OID 22244)
-- Name: ix_cte_seguro_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_seguro_01 ON sagnus.fisc_cte_seguro USING btree (id_cte_cabecalho);


--
-- TOC entry 8631 (class 1259 OID 22280)
-- Name: ix_cte_tomador_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_tomador_01 ON sagnus.fisc_cte_tomador USING btree (id_cte_cabecalho);


--
-- TOC entry 8632 (class 1259 OID 23779)
-- Name: ix_cte_tomador_id_pessoa; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_tomador_id_pessoa ON sagnus.fisc_cte_tomador USING btree (id_pessoa);


--
-- TOC entry 8635 (class 1259 OID 22303)
-- Name: ix_cte_veiculo_novo_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_cte_veiculo_novo_01 ON sagnus.fisc_cte_veiculo_novo USING btree (id_cte_cabecalho);


--
-- TOC entry 8669 (class 1259 OID 23717)
-- Name: ix_empresa_cnae_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_empresa_cnae_01 ON sagnus.corp_empresa_cnae USING btree (id_empresa);


--
-- TOC entry 8670 (class 1259 OID 23718)
-- Name: ix_empresa_cnae_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_empresa_cnae_02 ON sagnus.corp_empresa_cnae USING btree (id_cnae);


--
-- TOC entry 8673 (class 1259 OID 23719)
-- Name: ix_empresa_contato_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_empresa_contato_01 ON sagnus.corp_empresa_contato USING btree (id_empresa);


--
-- TOC entry 8676 (class 1259 OID 23720)
-- Name: ix_empresa_endereco_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_empresa_endereco_01 ON sagnus.corp_empresa_endereco USING btree (id_empresa);


--
-- TOC entry 8679 (class 1259 OID 23721)
-- Name: ix_empresa_telefone_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_empresa_telefone_01 ON sagnus.corp_empresa_telefone USING btree (id_empresa);


--
-- TOC entry 8684 (class 1259 OID 23722)
-- Name: ix_empresa_transporte_itinerario; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_empresa_transporte_itinerario ON sagnus.corp_empresa_transporte_itinerario USING btree (id_empresa_transporte);


--
-- TOC entry 8771 (class 1259 OID 25778)
-- Name: ix_estq_grade_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_estq_grade_01 ON sagnus.supr_estq_grade USING btree (id_produto);


--
-- TOC entry 8689 (class 1259 OID 23723)
-- Name: ix_fornecedor_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_fornecedor_01 ON sagnus.corp_fornecedor USING btree (id_pessoa);


--
-- TOC entry 8786 (class 1259 OID 25804)
-- Name: ix_invt_contagem_det_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_invt_contagem_det_02 ON sagnus.supr_invt_contagem_det USING btree (id_produto);


--
-- TOC entry 8382 (class 1259 OID 19558)
-- Name: ix_nfe_acesso_xml_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_acesso_xml_01 ON sagnus.fisc_nfe_acesso_xml USING btree (id_nfe_cabecalho);


--
-- TOC entry 8385 (class 1259 OID 19646)
-- Name: ix_nfe_cabecalho_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_cabecalho_01 ON sagnus.fisc_nfe USING btree (id_vendedor);


--
-- TOC entry 8386 (class 1259 OID 19647)
-- Name: ix_nfe_cabecalho_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_cabecalho_02 ON sagnus.fisc_nfe USING btree (id_fornecedor);


--
-- TOC entry 8387 (class 1259 OID 19648)
-- Name: ix_nfe_cabecalho_03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_cabecalho_03 ON sagnus.fisc_nfe USING btree (id_cliente);


--
-- TOC entry 8388 (class 1259 OID 19649)
-- Name: ix_nfe_cabecalho_04; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_cabecalho_04 ON sagnus.fisc_nfe USING btree (id_tribut_operacao_fiscal);


--
-- TOC entry 8389 (class 1259 OID 19650)
-- Name: ix_nfe_cabecalho_05; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_cabecalho_05 ON sagnus.fisc_nfe USING btree (id_venda_cabecalho);


--
-- TOC entry 8390 (class 1259 OID 19651)
-- Name: ix_nfe_cabecalho_06; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_cabecalho_06 ON sagnus.fisc_nfe USING btree (id_nfce_movimento);


--
-- TOC entry 8393 (class 1259 OID 19670)
-- Name: ix_nfe_cana_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_cana_01 ON sagnus.fisc_nfe_cana USING btree (id_nfe_cabecalho);


--
-- TOC entry 8396 (class 1259 OID 19692)
-- Name: ix_nfe_cana_deducoes_safra_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_cana_deducoes_safra_01 ON sagnus.fisc_nfe_cana_deducoes_safra USING btree (id_nfe_cana);


--
-- TOC entry 8399 (class 1259 OID 19714)
-- Name: ix_nfe_cana_fornecimento_diario_; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_cana_fornecimento_diario_ ON sagnus.fisc_nfe_cana_fornecimento_diario USING btree (id_nfe_cana);


--
-- TOC entry 8404 (class 1259 OID 19764)
-- Name: ix_nfe_cte_referenciado_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_cte_referenciado_01 ON sagnus.fisc_nfe_cte_referenciado USING btree (id_nfe_cabecalho);


--
-- TOC entry 8407 (class 1259 OID 19786)
-- Name: ix_nfe_cupom_fiscal_referenciado; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_cupom_fiscal_referenciado ON sagnus.fisc_nfe_cupom_fiscal_referenciado USING btree (id_nfe_cabecalho);


--
-- TOC entry 8468 (class 1259 OID 20378)
-- Name: ix_nfe_declaracao_importacao_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_declaracao_importacao_01 ON sagnus.fisc_nfe_declaracao_importacao USING btree (id_nfe_detalhe);


--
-- TOC entry 8410 (class 1259 OID 19825)
-- Name: ix_nfe_destinatario_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_destinatario_01 ON sagnus.fisc_nfe_destinatario USING btree (id_nfe_cabecalho);


--
-- TOC entry 8413 (class 1259 OID 19846)
-- Name: ix_nfe_det_especifico_armamento_; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_det_especifico_armamento_ ON sagnus.fisc_nfe_det_especifico_armamento USING btree (id_nfe_detalhe);


--
-- TOC entry 8416 (class 1259 OID 19880)
-- Name: ix_nfe_det_especifico_combustive; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_det_especifico_combustive ON sagnus.fisc_nfe_det_especifico_combustivel USING btree (id_nfe_detalhe);


--
-- TOC entry 8419 (class 1259 OID 19900)
-- Name: ix_nfe_det_especifico_medicament; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_det_especifico_medicament ON sagnus.fisc_nfe_det_especifico_medicamento USING btree (id_nfe_detalhe);


--
-- TOC entry 8422 (class 1259 OID 19941)
-- Name: ix_nfe_det_especifico_veiculo_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_det_especifico_veiculo_01 ON sagnus.fisc_nfe_det_especifico_veiculo USING btree (id_nfe_detalhe);


--
-- TOC entry 8425 (class 1259 OID 19995)
-- Name: ix_nfe_detalhe_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_detalhe_01 ON sagnus.fisc_nfe_detalhe USING btree (id_nfe_cabecalho);


--
-- TOC entry 8426 (class 1259 OID 19996)
-- Name: ix_nfe_detalhe_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_detalhe_02 ON sagnus.fisc_nfe_detalhe USING btree (id_produto);


--
-- TOC entry 8429 (class 1259 OID 20019)
-- Name: ix_nfe_detalhe_imposto_cofins_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_detalhe_imposto_cofins_01 ON sagnus.fisc_nfe_detalhe_imposto_cofins USING btree (id_nfe_detalhe);


--
-- TOC entry 8432 (class 1259 OID 20041)
-- Name: ix_nfe_detalhe_imposto_cofins_st; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_detalhe_imposto_cofins_st ON sagnus.fisc_nfe_detalhe_imposto_cofins_st USING btree (id_nfe_detalhe);


--
-- TOC entry 8435 (class 1259 OID 20100)
-- Name: ix_nfe_detalhe_imposto_icms_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_detalhe_imposto_icms_01 ON sagnus.fisc_nfe_detalhe_imposto_icms USING btree (id_nfe_detalhe);


--
-- TOC entry 8438 (class 1259 OID 20126)
-- Name: ix_nfe_detalhe_imposto_icms_ufde; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_detalhe_imposto_icms_ufde ON sagnus.fisc_nfe_detalhe_imposto_icms_ufdest USING btree (id_nfe_detalhe);


--
-- TOC entry 8441 (class 1259 OID 20147)
-- Name: ix_nfe_detalhe_imposto_ii_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_detalhe_imposto_ii_01 ON sagnus.fisc_nfe_detalhe_imposto_ii USING btree (id_nfe_detalhe);


--
-- TOC entry 8444 (class 1259 OID 20174)
-- Name: ix_nfe_detalhe_imposto_ipi_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_detalhe_imposto_ipi_01 ON sagnus.fisc_nfe_detalhe_imposto_ipi USING btree (id_nfe_detalhe);


--
-- TOC entry 8447 (class 1259 OID 20207)
-- Name: ix_nfe_detalhe_imposto_issqn_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_detalhe_imposto_issqn_01 ON sagnus.fisc_nfe_detalhe_imposto_issqn USING btree (id_nfe_detalhe);


--
-- TOC entry 8450 (class 1259 OID 20230)
-- Name: ix_nfe_detalhe_imposto_pis_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_detalhe_imposto_pis_01 ON sagnus.fisc_nfe_detalhe_imposto_pis USING btree (id_nfe_detalhe);


--
-- TOC entry 8453 (class 1259 OID 20252)
-- Name: ix_nfe_detalhe_imposto_pis_st_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_detalhe_imposto_pis_st_01 ON sagnus.fisc_nfe_detalhe_imposto_pis_st USING btree (id_nfe_detalhe);


--
-- TOC entry 8459 (class 1259 OID 20292)
-- Name: ix_nfe_duplicata_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_duplicata_01 ON sagnus.fisc_nfe_duplicata USING btree (id_nfe_fatura);


--
-- TOC entry 8462 (class 1259 OID 20331)
-- Name: ix_nfe_emitente_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_emitente_01 ON sagnus.fisc_nfe_emitente USING btree (id_nfe_cabecalho);


--
-- TOC entry 8465 (class 1259 OID 20352)
-- Name: ix_nfe_exportacao_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_exportacao_01 ON sagnus.fisc_nfe_exportacao USING btree (id_nfe_detalhe);


--
-- TOC entry 8456 (class 1259 OID 20273)
-- Name: ix_nfe_fatura_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_fatura_01 ON sagnus.fisc_nfe_fatura USING btree (id_nfe_cabecalho);


--
-- TOC entry 8471 (class 1259 OID 20400)
-- Name: ix_nfe_importacao_detalhe_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_importacao_detalhe_01 ON sagnus.fisc_nfe_importacao_det USING btree (id_nfe_declaracao_importacao);


--
-- TOC entry 8474 (class 1259 OID 20425)
-- Name: ix_nfe_informacao_pagamento_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_informacao_pagamento_01 ON sagnus.fisc_nfe_informacao_pagamento USING btree (id_nfe_cabecalho);


--
-- TOC entry 8477 (class 1259 OID 20445)
-- Name: ix_nfe_item_rastreado_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_item_rastreado_01 ON sagnus.fisc_nfe_item_rastreado USING btree (id_nfe_detalhe);


--
-- TOC entry 8480 (class 1259 OID 20480)
-- Name: ix_nfe_local_entrega_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_local_entrega_01 ON sagnus.fisc_nfe_local_entrega USING btree (id_nfe_cabecalho);


--
-- TOC entry 8483 (class 1259 OID 20515)
-- Name: ix_nfe_local_retirada_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_local_retirada_01 ON sagnus.fisc_nfe_local_retirada USING btree (id_nfe_cabecalho);


--
-- TOC entry 8486 (class 1259 OID 20538)
-- Name: ix_nfe_nf_referenciada_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_nf_referenciada_01 ON sagnus.fisc_nfe_nf_referenciada USING btree (id_nfe_cabecalho);


--
-- TOC entry 8493 (class 1259 OID 20583)
-- Name: ix_nfe_processo_referenciado_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_processo_referenciado_01 ON sagnus.fisc_nfe_processo_referenciado USING btree (id_nfe_cabecalho);


--
-- TOC entry 8496 (class 1259 OID 20608)
-- Name: ix_nfe_prod_rural_referenciada_0; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_prod_rural_referenciada_0 ON sagnus.fisc_nfe_prod_rural_referenciada USING btree (id_nfe_cabecalho);


--
-- TOC entry 8499 (class 1259 OID 20626)
-- Name: ix_nfe_referenciada_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_referenciada_01 ON sagnus.fisc_nfe_referenciada USING btree (id_nfe_cabecalho);


--
-- TOC entry 8502 (class 1259 OID 20649)
-- Name: ix_nfe_responsavel_tecnico_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_responsavel_tecnico_01 ON sagnus.fisc_nfe_responsavel_tecnico USING btree (id_nfe_cabecalho);


--
-- TOC entry 8505 (class 1259 OID 20684)
-- Name: ix_nfe_transporte_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_transporte_01 ON sagnus.fisc_nfe_transporte USING btree (id_nfe_cabecalho);


--
-- TOC entry 8506 (class 1259 OID 20685)
-- Name: ix_nfe_transporte_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_transporte_02 ON sagnus.fisc_nfe_transporte USING btree (id_transportadora);


--
-- TOC entry 8509 (class 1259 OID 20707)
-- Name: ix_nfe_transporte_reboque_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_transporte_reboque_01 ON sagnus.fisc_nfe_transporte_reboque USING btree (id_nfe_transporte);


--
-- TOC entry 8512 (class 1259 OID 20730)
-- Name: ix_nfe_transporte_volume_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_transporte_volume_01 ON sagnus.fisc_nfe_transporte_volume USING btree (id_nfe_transporte);


--
-- TOC entry 8515 (class 1259 OID 20748)
-- Name: ix_nfe_transporte_volume_lacre_0; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_nfe_transporte_volume_lacre_0 ON sagnus.fisc_nfe_transporte_volume_lacre USING btree (id_nfe_transporte_volume);


--
-- TOC entry 8955 (class 1259 OID 27621)
-- Name: ix_orcamento_detalhe_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_orcamento_detalhe_01 ON sagnus.orca_orcamento_detalhe USING btree (id_orcamento_empresarial);


--
-- TOC entry 8956 (class 1259 OID 27622)
-- Name: ix_orcamento_detalhe_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_orcamento_detalhe_02 ON sagnus.orca_orcamento_detalhe USING btree (id_fin_natureza_financeira);


--
-- TOC entry 8959 (class 1259 OID 27623)
-- Name: ix_orcamento_empresarial_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_orcamento_empresarial_01 ON sagnus.orca_orcamento_empresarial USING btree (id_orcamento_periodo);


--
-- TOC entry 8962 (class 1259 OID 27624)
-- Name: ix_orcamento_fluxo_caixa_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_orcamento_fluxo_caixa_01 ON sagnus.orca_orcamento_fluxo_caixa USING btree (id_orc_fluxo_caixa_periodo);


--
-- TOC entry 8965 (class 1259 OID 27625)
-- Name: ix_orcamento_fluxo_caixa_detalhe_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_orcamento_fluxo_caixa_detalhe_01 ON sagnus.orca_orcamento_fluxo_caixa_detalhe USING btree (id_orcamento_fluxo_caixa);


--
-- TOC entry 8966 (class 1259 OID 27626)
-- Name: ix_orcamento_fluxo_caixa_detalhe_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_orcamento_fluxo_caixa_detalhe_02 ON sagnus.orca_orcamento_fluxo_caixa_detalhe USING btree (id_fin_natureza_financeira);


--
-- TOC entry 8969 (class 1259 OID 27627)
-- Name: ix_orcamento_fluxo_caixa_periodo_03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_orcamento_fluxo_caixa_periodo_03 ON sagnus.orca_orcamento_fluxo_caixa_periodo USING btree (id_banco_conta_caixa);


--
-- TOC entry 8976 (class 1259 OID 27658)
-- Name: ix_pcp_instrucao_op_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pcp_instrucao_op_01 ON sagnus.pcp_instrucao_op USING btree (id_pcp_op_cabecalho);


--
-- TOC entry 8977 (class 1259 OID 27659)
-- Name: ix_pcp_instrucao_op_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pcp_instrucao_op_02 ON sagnus.pcp_instrucao_op USING btree (id_pcp_instrucao);


--
-- TOC entry 8982 (class 1259 OID 27660)
-- Name: ix_pcp_op_detalhe_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pcp_op_detalhe_01 ON sagnus.pcp_op_detalhe USING btree (id_pcp_op_cabecalho);


--
-- TOC entry 8983 (class 1259 OID 27661)
-- Name: ix_pcp_op_detalhe_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pcp_op_detalhe_02 ON sagnus.pcp_op_detalhe USING btree (id_produto);


--
-- TOC entry 8986 (class 1259 OID 27662)
-- Name: ix_pcp_servico_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pcp_servico_01 ON sagnus.pcp_servico USING btree (id_pcp_op_detalhe);


--
-- TOC entry 8989 (class 1259 OID 27663)
-- Name: ix_pcp_servico_colaborador_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pcp_servico_colaborador_01 ON sagnus.pcp_servico_colaborador USING btree (id_pcp_servico);


--
-- TOC entry 8990 (class 1259 OID 27664)
-- Name: ix_pcp_servico_colaborador_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pcp_servico_colaborador_02 ON sagnus.pcp_servico_colaborador USING btree (id_colaborador);


--
-- TOC entry 8993 (class 1259 OID 27665)
-- Name: ix_pcp_servico_equipamento_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pcp_servico_equipamento_01 ON sagnus.pcp_servico_equipamento USING btree (id_pcp_servico);


--
-- TOC entry 8994 (class 1259 OID 27666)
-- Name: ix_pcp_servico_equipamento_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pcp_servico_equipamento_02 ON sagnus.pcp_servico_equipamento USING btree (id_patrim_bem);


--
-- TOC entry 8696 (class 1259 OID 23724)
-- Name: ix_pessoa_alteracao_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pessoa_alteracao_01 ON sagnus.corp_pessoa_alteracao USING btree (id_pessoa);


--
-- TOC entry 8699 (class 1259 OID 23725)
-- Name: ix_pessoa_contato_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pessoa_contato_01 ON sagnus.corp_pessoa_contato USING btree (id_pessoa);


--
-- TOC entry 8702 (class 1259 OID 23726)
-- Name: ix_pessoa_endereco_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pessoa_endereco_01 ON sagnus.corp_pessoa_endereco USING btree (id_pessoa);


--
-- TOC entry 8706 (class 1259 OID 23727)
-- Name: ix_pessoa_fisica_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pessoa_fisica_01 ON sagnus.corp_pessoa_fisica USING btree (id_pessoa);


--
-- TOC entry 8707 (class 1259 OID 23728)
-- Name: ix_pessoa_fisica_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pessoa_fisica_02 ON sagnus.corp_pessoa_fisica USING btree (id_nivel_formacao);


--
-- TOC entry 8708 (class 1259 OID 23729)
-- Name: ix_pessoa_fisica_03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pessoa_fisica_03 ON sagnus.corp_pessoa_fisica USING btree (id_estado_civil);


--
-- TOC entry 8712 (class 1259 OID 23730)
-- Name: ix_pessoa_juridica_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pessoa_juridica_01 ON sagnus.corp_pessoa_juridica USING btree (id_pessoa);


--
-- TOC entry 8715 (class 1259 OID 23731)
-- Name: ix_pessoa_telefone_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pessoa_telefone_01 ON sagnus.corp_pessoa_telefone USING btree (id_pessoa);


--
-- TOC entry 8997 (class 1259 OID 27667)
-- Name: ix_prdc_produto_ficha_tecnica_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_prdc_produto_ficha_tecnica_01 ON sagnus.prdc_produto_ficha_tecnica USING btree (id_produto);


--
-- TOC entry 8898 (class 1259 OID 26995)
-- Name: ix_pre_venda_cab; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pre_venda_cab ON sagnus.com_vend_pre_venda_cab USING btree (id_pessoa);


--
-- TOC entry 8899 (class 1259 OID 26960)
-- Name: ix_pre_venda_cab_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pre_venda_cab_01 ON sagnus.com_vend_pre_venda_cab USING btree (id_pessoa);


--
-- TOC entry 8902 (class 1259 OID 27001)
-- Name: ix_pre_venda_det; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pre_venda_det ON sagnus.com_vend_pre_venda_det USING btree (id_produto);


--
-- TOC entry 8903 (class 1259 OID 26961)
-- Name: ix_pre_venda_det_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pre_venda_det_01 ON sagnus.com_vend_pre_venda_det USING btree (id_pre_venda_cab);


--
-- TOC entry 8904 (class 1259 OID 26962)
-- Name: ix_pre_venda_det_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_pre_venda_det_02 ON sagnus.com_vend_pre_venda_det USING btree (id_produto);


--
-- TOC entry 8718 (class 1259 OID 23732)
-- Name: ix_produto_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_produto_01 ON sagnus.corp_produto USING btree (id_produto_subgrupo);


--
-- TOC entry 8719 (class 1259 OID 23733)
-- Name: ix_produto_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_produto_02 ON sagnus.corp_produto USING btree (id_produto_marca);


--
-- TOC entry 8720 (class 1259 OID 23734)
-- Name: ix_produto_03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_produto_03 ON sagnus.corp_produto USING btree (id_produto_unidade);


--
-- TOC entry 8721 (class 1259 OID 23735)
-- Name: ix_produto_04; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_produto_04 ON sagnus.corp_produto USING btree (id_tribut_icms_custom_cab);


--
-- TOC entry 8722 (class 1259 OID 23736)
-- Name: ix_produto_05; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_produto_05 ON sagnus.corp_produto USING btree (id_tribut_grupo_tributario);


--
-- TOC entry 8725 (class 1259 OID 23737)
-- Name: ix_produto_alteracao_item_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_produto_alteracao_item_01 ON sagnus.corp_produto_alteracao_item USING btree (id_produto);


--
-- TOC entry 8728 (class 1259 OID 23738)
-- Name: ix_produto_codigo_adicional_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_produto_codigo_adicional_01 ON sagnus.corp_produto_codigo_adicional USING btree (id_produto);


--
-- TOC entry 8731 (class 1259 OID 23739)
-- Name: ix_produto_ficha_tecnica_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_produto_ficha_tecnica_01 ON sagnus.corp_produto_ficha_tecnica USING btree (id_produto);


--
-- TOC entry 8907 (class 1259 OID 27007)
-- Name: ix_produto_promocao; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_produto_promocao ON sagnus.com_vend_produto_promocao USING btree (id_produto);


--
-- TOC entry 8738 (class 1259 OID 23740)
-- Name: ix_produto_promocao_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_produto_promocao_01 ON sagnus.corp_produto_promocao USING btree (id_produto);


--
-- TOC entry 8741 (class 1259 OID 23741)
-- Name: ix_produto_subgrupo_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_produto_subgrupo_01 ON sagnus.corp_produto_subgrupo USING btree (id_produto_grupo);


--
-- TOC entry 8789 (class 1259 OID 25810)
-- Name: ix_req_interna_cab; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_req_interna_cab ON sagnus.supr_req_interna_cab USING btree (id_colaborador);


--
-- TOC entry 8792 (class 1259 OID 25816)
-- Name: ix_req_interna_det_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_req_interna_det_01 ON sagnus.supr_req_interna_det USING btree (id_produto);


--
-- TOC entry 8912 (class 1259 OID 27013)
-- Name: ix_tabela_preco_produto; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_tabela_preco_produto ON sagnus.com_vend_tabela_preco_produto USING btree (id_produto);


--
-- TOC entry 8913 (class 1259 OID 26963)
-- Name: ix_tabela_preco_produto_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_tabela_preco_produto_01 ON sagnus.com_vend_tabela_preco_produto USING btree (id_tabela_preco);


--
-- TOC entry 8914 (class 1259 OID 26964)
-- Name: ix_tabela_preco_produto_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_tabela_preco_produto_02 ON sagnus.com_vend_tabela_preco_produto USING btree (id_produto);


--
-- TOC entry 8756 (class 1259 OID 23742)
-- Name: ix_transportadora_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_transportadora_01 ON sagnus.corp_transportadora USING btree (id_pessoa);


--
-- TOC entry 8917 (class 1259 OID 27019)
-- Name: ix_venda_cab; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_cab ON sagnus.com_vend_cab USING btree (id_cliente);


--
-- TOC entry 8918 (class 1259 OID 26965)
-- Name: ix_venda_cab_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_cab_01 ON sagnus.com_vend_cab USING btree (id_venda_orcamento_cab);


--
-- TOC entry 8919 (class 1259 OID 26966)
-- Name: ix_venda_cab_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_cab_02 ON sagnus.com_vend_cab USING btree (id_venda_condicoes_pagamento);


--
-- TOC entry 8920 (class 1259 OID 26967)
-- Name: ix_venda_cab_03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_cab_03 ON sagnus.com_vend_cab USING btree (id_nota_fiscal_tipo);


--
-- TOC entry 8921 (class 1259 OID 26968)
-- Name: ix_venda_cab_04; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_cab_04 ON sagnus.com_vend_cab USING btree (id_cliente);


--
-- TOC entry 8922 (class 1259 OID 26969)
-- Name: ix_venda_cab_05; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_cab_05 ON sagnus.com_vend_cab USING btree (id_transportadora);


--
-- TOC entry 8923 (class 1259 OID 26970)
-- Name: ix_venda_cab_06; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_cab_06 ON sagnus.com_vend_cab USING btree (id_vendedor);


--
-- TOC entry 8926 (class 1259 OID 27035)
-- Name: ix_venda_comissao; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_comissao ON sagnus.com_vend_comissao USING btree (id_vendedor);


--
-- TOC entry 8927 (class 1259 OID 26971)
-- Name: ix_venda_comissao_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_comissao_01 ON sagnus.com_vend_comissao USING btree (id_venda_cab);


--
-- TOC entry 8928 (class 1259 OID 26972)
-- Name: ix_venda_comissao_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_comissao_02 ON sagnus.com_vend_comissao USING btree (id_vendedor);


--
-- TOC entry 8933 (class 1259 OID 26973)
-- Name: ix_venda_condicoes_parcelas_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_condicoes_parcelas_01 ON sagnus.com_vend_condicoes_parcelas USING btree (id_venda_condicoes_pagamento);


--
-- TOC entry 8936 (class 1259 OID 26974)
-- Name: ix_venda_det_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_det_01 ON sagnus.com_vend_det USING btree (id_venda_cab);


--
-- TOC entry 8937 (class 1259 OID 26975)
-- Name: ix_venda_det_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_det_02 ON sagnus.com_vend_det USING btree (id_produto);


--
-- TOC entry 8940 (class 1259 OID 26976)
-- Name: ix_venda_frete_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_frete_01 ON sagnus.com_vend_frete USING btree (id_venda_cab);


--
-- TOC entry 8941 (class 1259 OID 26977)
-- Name: ix_venda_frete_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_frete_02 ON sagnus.com_vend_frete USING btree (id_transportadora);


--
-- TOC entry 8944 (class 1259 OID 26978)
-- Name: ix_venda_orcamento_cab_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_orcamento_cab_01 ON sagnus.com_vend_orcamento_cab USING btree (id_venda_condicoes_pagamento);


--
-- TOC entry 8945 (class 1259 OID 26979)
-- Name: ix_venda_orcamento_cab_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_orcamento_cab_02 ON sagnus.com_vend_orcamento_cab USING btree (id_vendedor);


--
-- TOC entry 8946 (class 1259 OID 26980)
-- Name: ix_venda_orcamento_cab_03; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_orcamento_cab_03 ON sagnus.com_vend_orcamento_cab USING btree (id_cliente);


--
-- TOC entry 8947 (class 1259 OID 26981)
-- Name: ix_venda_orcamento_cab_04; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_orcamento_cab_04 ON sagnus.com_vend_orcamento_cab USING btree (id_transportadora);


--
-- TOC entry 8950 (class 1259 OID 26982)
-- Name: ix_venda_orcamento_det_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_orcamento_det_01 ON sagnus.com_vend_orcamento_det USING btree (id_venda_orcamento_cab);


--
-- TOC entry 8951 (class 1259 OID 26983)
-- Name: ix_venda_orcamento_det_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_orcamento_det_02 ON sagnus.com_vend_orcamento_det USING btree (id_produto);


--
-- TOC entry 8952 (class 1259 OID 27066)
-- Name: ix_venda_orcamento_det_04; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_venda_orcamento_det_04 ON sagnus.com_vend_orcamento_det USING btree (id_produto);


--
-- TOC entry 8763 (class 1259 OID 23743)
-- Name: ix_vendedor_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_vendedor_01 ON sagnus.corp_vendedor USING btree (id_colaborador);


--
-- TOC entry 8764 (class 1259 OID 23744)
-- Name: ix_vendedor_02; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_vendedor_02 ON sagnus.corp_vendedor USING btree (id_comissao_perfil);


--
-- TOC entry 8807 (class 1259 OID 25822)
-- Name: ix_wms_ordem_separacao_det_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_wms_ordem_separacao_det_01 ON sagnus.supr_wms_ordem_separacao_det USING btree (id_produto);


--
-- TOC entry 8814 (class 1259 OID 25828)
-- Name: ix_wms_recebimento_det_01; Type: INDEX; Schema: sagnus; Owner: postgres
--

CREATE INDEX ix_wms_recebimento_det_01 ON sagnus.supr_wms_recebimento_det USING btree (id_produto);


--
-- TOC entry 9280 (class 2606 OID 27713)
-- Name: ctbl_conta FK_CTBL_CONTA_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_conta
    ADD CONSTRAINT "FK_CTBL_CONTA_01" FOREIGN KEY (id_plano_conta) REFERENCES sagnus.ctbl_plano_conta(id);


--
-- TOC entry 9281 (class 2606 OID 27718)
-- Name: ctbl_conta FK_CTBL_CONTA_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_conta
    ADD CONSTRAINT "FK_CTBL_CONTA_02" FOREIGN KEY (id_ctbl_conta) REFERENCES sagnus.ctbl_conta(id);


--
-- TOC entry 9282 (class 2606 OID 27733)
-- Name: ctbl_conta FK_CTBL_CONTA_03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_conta
    ADD CONSTRAINT "FK_CTBL_CONTA_03" FOREIGN KEY (id_plano_conta_ref_sped) REFERENCES sagnus.ctbl_plano_conta_ref_sped(id);


--
-- TOC entry 9286 (class 2606 OID 27738)
-- Name: ctbl_conta_rateio FK_CTBL_CONTA_RATEIO_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_conta_rateio
    ADD CONSTRAINT "FK_CTBL_CONTA_RATEIO_01" FOREIGN KEY (id_ctbl_conta) REFERENCES sagnus.ctbl_conta(id);


--
-- TOC entry 9287 (class 2606 OID 27743)
-- Name: ctbl_dre_det FK_CTBL_DRE_DET_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_dre_det
    ADD CONSTRAINT "FK_CTBL_DRE_DET_01" FOREIGN KEY (id_ctbl_dre_cab) REFERENCES sagnus.ctbl_dre_cab(id);


--
-- TOC entry 9288 (class 2606 OID 27748)
-- Name: ctbl_encerramento_exe_det FK_CTBL_ENCERRAMENTO_EXE_DET; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_encerramento_exe_det
    ADD CONSTRAINT "FK_CTBL_ENCERRAMENTO_EXE_DET" FOREIGN KEY (id_ctbl_conta) REFERENCES sagnus.ctbl_conta(id);


--
-- TOC entry 9289 (class 2606 OID 27753)
-- Name: ctbl_encerramento_exe_det FK_CTBL_ENCERRAMENTO_EXE_DET_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_encerramento_exe_det
    ADD CONSTRAINT "FK_CTBL_ENCERRAMENTO_EXE_DET_02" FOREIGN KEY (id_ctbl_encerramento_exe) REFERENCES sagnus.ctbl_encerramento_exe_cab(id);


--
-- TOC entry 9290 (class 2606 OID 27758)
-- Name: ctbl_indice_valor FK_CTBL_INDICE_VALOR_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_indice_valor
    ADD CONSTRAINT "FK_CTBL_INDICE_VALOR_01" FOREIGN KEY (id_ctbl_indice) REFERENCES sagnus.ctbl_indice(id);


--
-- TOC entry 9291 (class 2606 OID 27763)
-- Name: ctbl_lancamento_cab FK_CTBL_LANCAMENTO_CAB; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_lancamento_cab
    ADD CONSTRAINT "FK_CTBL_LANCAMENTO_CAB" FOREIGN KEY (id_ctbl_lote) REFERENCES sagnus.ctbl_lote(id);


--
-- TOC entry 9292 (class 2606 OID 27768)
-- Name: ctbl_lancamento_det FK_CTBL_LANCAMENTO_DET_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_lancamento_det
    ADD CONSTRAINT "FK_CTBL_LANCAMENTO_DET_01" FOREIGN KEY (id_ctbl_historico) REFERENCES sagnus.ctbl_historico(id);


--
-- TOC entry 9293 (class 2606 OID 27773)
-- Name: ctbl_lancamento_det FK_CTBL_LANCAMENTO_DET_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_lancamento_det
    ADD CONSTRAINT "FK_CTBL_LANCAMENTO_DET_02" FOREIGN KEY (id_ctbl_lancamento_cab) REFERENCES sagnus.ctbl_lancamento_cab(id);


--
-- TOC entry 9294 (class 2606 OID 27778)
-- Name: ctbl_lancamento_det FK_CTBL_LANCAMENTO_DET_03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_lancamento_det
    ADD CONSTRAINT "FK_CTBL_LANCAMENTO_DET_03" FOREIGN KEY (id_ctbl_conta) REFERENCES sagnus.ctbl_conta(id);


--
-- TOC entry 9295 (class 2606 OID 27783)
-- Name: ctbl_lancamento_orcado FK_CTBL_LANCAMENTO_ORCADO_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_lancamento_orcado
    ADD CONSTRAINT "FK_CTBL_LANCAMENTO_ORCADO_01" FOREIGN KEY (id_ctbl_conta) REFERENCES sagnus.ctbl_conta(id);


--
-- TOC entry 9063 (class 2606 OID 16924)
-- Name: adm_agen_comp_conv adm_agen_comp_conv_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.adm_agen_comp_conv
    ADD CONSTRAINT adm_agen_comp_conv_fk01 FOREIGN KEY (id_compromisso) REFERENCES sagnus.adm_agen_compromisso(id);


--
-- TOC entry 9062 (class 2606 OID 16899)
-- Name: adm_agen_compromisso adm_agen_compromisso_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.adm_agen_compromisso
    ADD CONSTRAINT adm_agen_compromisso_fk01 FOREIGN KEY (id_categoria) REFERENCES sagnus.adm_agen_cat_compromisso(id);


--
-- TOC entry 9064 (class 2606 OID 16948)
-- Name: adm_agen_notificacao adm_agen_notificacao_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.adm_agen_notificacao
    ADD CONSTRAINT adm_agen_notificacao_fk01 FOREIGN KEY (id_compromisso) REFERENCES sagnus.adm_agen_compromisso(id);


--
-- TOC entry 9058 (class 2606 OID 16534)
-- Name: auth_perfil_permissao auth_perfil_permissao_perfil_id_fkey; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_perfil_permissao
    ADD CONSTRAINT auth_perfil_permissao_perfil_id_fkey FOREIGN KEY (perfil_id) REFERENCES sagnus.auth_perfil(id) ON DELETE CASCADE;


--
-- TOC entry 9059 (class 2606 OID 16539)
-- Name: auth_perfil_permissao auth_perfil_permissao_permissao_id_fkey; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_perfil_permissao
    ADD CONSTRAINT auth_perfil_permissao_permissao_id_fkey FOREIGN KEY (permissao_id) REFERENCES sagnus.auth_permissao(id) ON DELETE CASCADE;


--
-- TOC entry 9060 (class 2606 OID 16559)
-- Name: auth_usuario_perfil auth_usuario_perfil_perfil_id_fkey; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_usuario_perfil
    ADD CONSTRAINT auth_usuario_perfil_perfil_id_fkey FOREIGN KEY (perfil_id) REFERENCES sagnus.auth_perfil(id) ON DELETE CASCADE;


--
-- TOC entry 9061 (class 2606 OID 16554)
-- Name: auth_usuario_perfil auth_usuario_perfil_usuario_id_fkey; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.auth_usuario_perfil
    ADD CONSTRAINT auth_usuario_perfil_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES sagnus.auth_usuario(id) ON DELETE CASCADE;


--
-- TOC entry 9067 (class 2606 OID 17086)
-- Name: fina_cap_lancamento fina_cap_lancamento_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cap_lancamento
    ADD CONSTRAINT fina_cap_lancamento_fk01 FOREIGN KEY (id_doc_origem) REFERENCES sagnus.fina_cad_doc_origem(id);


--
-- TOC entry 9068 (class 2606 OID 17091)
-- Name: fina_cap_lancamento fina_cap_lancamento_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cap_lancamento
    ADD CONSTRAINT fina_cap_lancamento_fk02 FOREIGN KEY (id_nat_financeira) REFERENCES sagnus.fina_cad_nat_financeira(id);


--
-- TOC entry 9069 (class 2606 OID 17101)
-- Name: fina_cap_lancamento fina_cap_lancamento_fk04; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cap_lancamento
    ADD CONSTRAINT fina_cap_lancamento_fk04 FOREIGN KEY (id_conta_caixa) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9070 (class 2606 OID 17123)
-- Name: fina_cap_parcela fina_cap_parcela_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cap_parcela
    ADD CONSTRAINT fina_cap_parcela_fk01 FOREIGN KEY (id_lancamento) REFERENCES sagnus.fina_cap_lancamento(id);


--
-- TOC entry 9071 (class 2606 OID 17128)
-- Name: fina_cap_parcela fina_cap_parcela_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cap_parcela
    ADD CONSTRAINT fina_cap_parcela_fk02 FOREIGN KEY (id_status_parcela) REFERENCES sagnus.fina_cad_status_parcela(id);


--
-- TOC entry 9072 (class 2606 OID 17133)
-- Name: fina_cap_parcela fina_cap_parcela_fk03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cap_parcela
    ADD CONSTRAINT fina_cap_parcela_fk03 FOREIGN KEY (id_tipo_pagto) REFERENCES sagnus.fina_cad_tipo_pagto(id);


--
-- TOC entry 9073 (class 2606 OID 17157)
-- Name: fina_car_lancamento fina_car_lancamento_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_car_lancamento
    ADD CONSTRAINT fina_car_lancamento_fk01 FOREIGN KEY (id_doc_origem) REFERENCES sagnus.fina_cad_doc_origem(id);


--
-- TOC entry 9074 (class 2606 OID 17162)
-- Name: fina_car_lancamento fina_car_lancamento_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_car_lancamento
    ADD CONSTRAINT fina_car_lancamento_fk02 FOREIGN KEY (id_nat_financeira) REFERENCES sagnus.fina_cad_nat_financeira(id);


--
-- TOC entry 9075 (class 2606 OID 17172)
-- Name: fina_car_lancamento fina_car_lancamento_fk04; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_car_lancamento
    ADD CONSTRAINT fina_car_lancamento_fk04 FOREIGN KEY (id_conta_caixa) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9076 (class 2606 OID 17194)
-- Name: fina_car_parcela fina_car_parcela_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_car_parcela
    ADD CONSTRAINT fina_car_parcela_fk01 FOREIGN KEY (id_lancamento) REFERENCES sagnus.fina_car_lancamento(id);


--
-- TOC entry 9077 (class 2606 OID 17199)
-- Name: fina_car_parcela fina_car_parcela_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_car_parcela
    ADD CONSTRAINT fina_car_parcela_fk02 FOREIGN KEY (id_status_parcela) REFERENCES sagnus.fina_cad_status_parcela(id);


--
-- TOC entry 9078 (class 2606 OID 17204)
-- Name: fina_car_parcela fina_car_parcela_fk03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_car_parcela
    ADD CONSTRAINT fina_car_parcela_fk03 FOREIGN KEY (id_tipo_receb) REFERENCES sagnus.fina_cad_tipo_receb(id);


--
-- TOC entry 9087 (class 2606 OID 17319)
-- Name: fina_cbk_conc fina_cbk_conc_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cbk_conc
    ADD CONSTRAINT fina_cbk_conc_fk01 FOREIGN KEY (id_conta_caixa) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9088 (class 2606 OID 17339)
-- Name: fina_cbk_conc_item fina_cbk_conc_item_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cbk_conc_item
    ADD CONSTRAINT fina_cbk_conc_item_fk01 FOREIGN KEY (id_conciliacao) REFERENCES sagnus.fina_cbk_conc(id);


--
-- TOC entry 9089 (class 2606 OID 17344)
-- Name: fina_cbk_conc_item fina_cbk_conc_item_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cbk_conc_item
    ADD CONSTRAINT fina_cbk_conc_item_fk02 FOREIGN KEY (id_extrato) REFERENCES sagnus.fina_cxb_extrato(id);


--
-- TOC entry 9090 (class 2606 OID 17349)
-- Name: fina_cbk_conc_item fina_cbk_conc_item_fk03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cbk_conc_item
    ADD CONSTRAINT fina_cbk_conc_item_fk03 FOREIGN KEY (id_cap_parcela) REFERENCES sagnus.fina_cap_parcela(id);


--
-- TOC entry 9091 (class 2606 OID 17354)
-- Name: fina_cbk_conc_item fina_cbk_conc_item_fk04; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cbk_conc_item
    ADD CONSTRAINT fina_cbk_conc_item_fk04 FOREIGN KEY (id_car_parcela) REFERENCES sagnus.fina_car_parcela(id);


--
-- TOC entry 9092 (class 2606 OID 17359)
-- Name: fina_cbk_conc_item fina_cbk_conc_item_fk05; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cbk_conc_item
    ADD CONSTRAINT fina_cbk_conc_item_fk05 FOREIGN KEY (id_edi_linha) REFERENCES sagnus.fina_edi_linha(id);


--
-- TOC entry 9065 (class 2606 OID 17045)
-- Name: fina_cxb_banco_agencia fina_cxb_banco_agencia_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cxb_banco_agencia
    ADD CONSTRAINT fina_cxb_banco_agencia_fk01 FOREIGN KEY (id_banco) REFERENCES sagnus.fina_cxb_banco(id);


--
-- TOC entry 9066 (class 2606 OID 17062)
-- Name: fina_cxb_conta_caixa fina_cxb_conta_caixa_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cxb_conta_caixa
    ADD CONSTRAINT fina_cxb_conta_caixa_fk01 FOREIGN KEY (id_banco_agencia) REFERENCES sagnus.fina_cxb_banco_agencia(id);


--
-- TOC entry 9083 (class 2606 OID 17280)
-- Name: fina_cxb_extrato fina_cxb_extrato_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cxb_extrato
    ADD CONSTRAINT fina_cxb_extrato_fk01 FOREIGN KEY (id_conta_caixa) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9084 (class 2606 OID 17285)
-- Name: fina_cxb_extrato fina_cxb_extrato_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cxb_extrato
    ADD CONSTRAINT fina_cxb_extrato_fk02 FOREIGN KEY (id_cap_parcela) REFERENCES sagnus.fina_cap_parcela(id);


--
-- TOC entry 9085 (class 2606 OID 17290)
-- Name: fina_cxb_extrato fina_cxb_extrato_fk03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cxb_extrato
    ADD CONSTRAINT fina_cxb_extrato_fk03 FOREIGN KEY (id_car_parcela) REFERENCES sagnus.fina_car_parcela(id);


--
-- TOC entry 9086 (class 2606 OID 17295)
-- Name: fina_cxb_extrato fina_cxb_extrato_fk04; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_cxb_extrato
    ADD CONSTRAINT fina_cxb_extrato_fk04 FOREIGN KEY (id_edi_linha) REFERENCES sagnus.fina_edi_linha(id);


--
-- TOC entry 9079 (class 2606 OID 17226)
-- Name: fina_edi_arquivo fina_edi_arquivo_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_edi_arquivo
    ADD CONSTRAINT fina_edi_arquivo_fk01 FOREIGN KEY (id_conta_caixa) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9080 (class 2606 OID 17247)
-- Name: fina_edi_linha fina_edi_linha_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_edi_linha
    ADD CONSTRAINT fina_edi_linha_fk01 FOREIGN KEY (id_arquivo) REFERENCES sagnus.fina_edi_arquivo(id);


--
-- TOC entry 9081 (class 2606 OID 17252)
-- Name: fina_edi_linha fina_edi_linha_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_edi_linha
    ADD CONSTRAINT fina_edi_linha_fk02 FOREIGN KEY (id_cap_parcela) REFERENCES sagnus.fina_cap_parcela(id);


--
-- TOC entry 9082 (class 2606 OID 17257)
-- Name: fina_edi_linha fina_edi_linha_fk03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_edi_linha
    ADD CONSTRAINT fina_edi_linha_fk03 FOREIGN KEY (id_car_parcela) REFERENCES sagnus.fina_car_parcela(id);


--
-- TOC entry 9108 (class 2606 OID 17530)
-- Name: fina_fcx_previsto fina_fcx_previsto_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_fcx_previsto
    ADD CONSTRAINT fina_fcx_previsto_fk01 FOREIGN KEY (id_conta_caixa) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9109 (class 2606 OID 17535)
-- Name: fina_fcx_previsto fina_fcx_previsto_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_fcx_previsto
    ADD CONSTRAINT fina_fcx_previsto_fk02 FOREIGN KEY (id_cap_parcela) REFERENCES sagnus.fina_cap_parcela(id);


--
-- TOC entry 9110 (class 2606 OID 17540)
-- Name: fina_fcx_previsto fina_fcx_previsto_fk03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_fcx_previsto
    ADD CONSTRAINT fina_fcx_previsto_fk03 FOREIGN KEY (id_car_parcela) REFERENCES sagnus.fina_car_parcela(id);


--
-- TOC entry 9111 (class 2606 OID 17545)
-- Name: fina_fcx_previsto fina_fcx_previsto_fk04; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_fcx_previsto
    ADD CONSTRAINT fina_fcx_previsto_fk04 FOREIGN KEY (id_tes_movimento) REFERENCES sagnus.fina_tes_movimento(id);


--
-- TOC entry 9112 (class 2606 OID 17550)
-- Name: fina_fcx_previsto fina_fcx_previsto_fk05; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_fcx_previsto
    ADD CONSTRAINT fina_fcx_previsto_fk05 FOREIGN KEY (id_extrato) REFERENCES sagnus.fina_cxb_extrato(id);


--
-- TOC entry 9113 (class 2606 OID 17571)
-- Name: fina_fcx_saldo_diario fina_fcx_saldo_diario_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_fcx_saldo_diario
    ADD CONSTRAINT fina_fcx_saldo_diario_fk01 FOREIGN KEY (id_conta_caixa) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9100 (class 2606 OID 17455)
-- Name: fina_tes_aplicacao fina_tes_aplicacao_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_aplicacao
    ADD CONSTRAINT fina_tes_aplicacao_fk01 FOREIGN KEY (id_conta_origem) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9101 (class 2606 OID 17460)
-- Name: fina_tes_aplicacao fina_tes_aplicacao_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_aplicacao
    ADD CONSTRAINT fina_tes_aplicacao_fk02 FOREIGN KEY (id_conta_aplicacao) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9102 (class 2606 OID 17465)
-- Name: fina_tes_aplicacao fina_tes_aplicacao_fk03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_aplicacao
    ADD CONSTRAINT fina_tes_aplicacao_fk03 FOREIGN KEY (id_mov_origem) REFERENCES sagnus.fina_tes_movimento(id);


--
-- TOC entry 9103 (class 2606 OID 17470)
-- Name: fina_tes_aplicacao fina_tes_aplicacao_fk04; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_aplicacao
    ADD CONSTRAINT fina_tes_aplicacao_fk04 FOREIGN KEY (id_mov_destino) REFERENCES sagnus.fina_tes_movimento(id);


--
-- TOC entry 9093 (class 2606 OID 17385)
-- Name: fina_tes_movimento fina_tes_movimento_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_movimento
    ADD CONSTRAINT fina_tes_movimento_fk01 FOREIGN KEY (id_conta_caixa) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9094 (class 2606 OID 17390)
-- Name: fina_tes_movimento fina_tes_movimento_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_movimento
    ADD CONSTRAINT fina_tes_movimento_fk02 FOREIGN KEY (id_cap_parcela) REFERENCES sagnus.fina_cap_parcela(id);


--
-- TOC entry 9095 (class 2606 OID 17395)
-- Name: fina_tes_movimento fina_tes_movimento_fk03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_movimento
    ADD CONSTRAINT fina_tes_movimento_fk03 FOREIGN KEY (id_car_parcela) REFERENCES sagnus.fina_car_parcela(id);


--
-- TOC entry 9104 (class 2606 OID 17492)
-- Name: fina_tes_resgate fina_tes_resgate_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_resgate
    ADD CONSTRAINT fina_tes_resgate_fk01 FOREIGN KEY (id_aplicacao) REFERENCES sagnus.fina_tes_aplicacao(id);


--
-- TOC entry 9105 (class 2606 OID 17497)
-- Name: fina_tes_resgate fina_tes_resgate_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_resgate
    ADD CONSTRAINT fina_tes_resgate_fk02 FOREIGN KEY (id_conta_destino) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9106 (class 2606 OID 17502)
-- Name: fina_tes_resgate fina_tes_resgate_fk03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_resgate
    ADD CONSTRAINT fina_tes_resgate_fk03 FOREIGN KEY (id_mov_origem) REFERENCES sagnus.fina_tes_movimento(id);


--
-- TOC entry 9107 (class 2606 OID 17507)
-- Name: fina_tes_resgate fina_tes_resgate_fk04; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_resgate
    ADD CONSTRAINT fina_tes_resgate_fk04 FOREIGN KEY (id_mov_destino) REFERENCES sagnus.fina_tes_movimento(id);


--
-- TOC entry 9096 (class 2606 OID 17418)
-- Name: fina_tes_transferencia fina_tes_transferencia_fk01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_transferencia
    ADD CONSTRAINT fina_tes_transferencia_fk01 FOREIGN KEY (id_conta_origem) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9097 (class 2606 OID 17423)
-- Name: fina_tes_transferencia fina_tes_transferencia_fk02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_transferencia
    ADD CONSTRAINT fina_tes_transferencia_fk02 FOREIGN KEY (id_conta_destino) REFERENCES sagnus.fina_cxb_conta_caixa(id);


--
-- TOC entry 9098 (class 2606 OID 17428)
-- Name: fina_tes_transferencia fina_tes_transferencia_fk03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_transferencia
    ADD CONSTRAINT fina_tes_transferencia_fk03 FOREIGN KEY (id_mov_origem) REFERENCES sagnus.fina_tes_movimento(id);


--
-- TOC entry 9099 (class 2606 OID 17433)
-- Name: fina_tes_transferencia fina_tes_transferencia_fk04; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_tes_transferencia
    ADD CONSTRAINT fina_tes_transferencia_fk04 FOREIGN KEY (id_mov_destino) REFERENCES sagnus.fina_tes_movimento(id);


--
-- TOC entry 9198 (class 2606 OID 23516)
-- Name: corp_cliente fk_cliente_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_cliente
    ADD CONSTRAINT fk_cliente_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9199 (class 2606 OID 23521)
-- Name: corp_cliente fk_cliente_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_cliente
    ADD CONSTRAINT fk_cliente_02 FOREIGN KEY (id_tabela_preco) REFERENCES sagnus.corp_tabela_preco(id);


--
-- TOC entry 9200 (class 2606 OID 23526)
-- Name: corp_colaborador fk_colaborador_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador
    ADD CONSTRAINT fk_colaborador_01 FOREIGN KEY (id_cargo) REFERENCES sagnus.corp_cargo(id);


--
-- TOC entry 9201 (class 2606 OID 23531)
-- Name: corp_colaborador fk_colaborador_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador
    ADD CONSTRAINT fk_colaborador_02 FOREIGN KEY (id_colaborador_situacao) REFERENCES sagnus.corp_colaborador_situacao(id);


--
-- TOC entry 9202 (class 2606 OID 23536)
-- Name: corp_colaborador fk_colaborador_03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador
    ADD CONSTRAINT fk_colaborador_03 FOREIGN KEY (id_colaborador_tipo) REFERENCES sagnus.corp_colaborador_tipo(id);


--
-- TOC entry 9203 (class 2606 OID 23541)
-- Name: corp_colaborador fk_colaborador_04; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador
    ADD CONSTRAINT fk_colaborador_04 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9204 (class 2606 OID 23546)
-- Name: corp_colaborador fk_colaborador_05; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador
    ADD CONSTRAINT fk_colaborador_05 FOREIGN KEY (id_setor) REFERENCES sagnus.corp_setor(id);


--
-- TOC entry 9205 (class 2606 OID 23551)
-- Name: corp_colaborador fk_colaborador_06; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador
    ADD CONSTRAINT fk_colaborador_06 FOREIGN KEY (id_sindicato) REFERENCES sagnus.corp_sindicato(id);


--
-- TOC entry 9206 (class 2606 OID 23556)
-- Name: corp_colaborador fk_colaborador_07; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador
    ADD CONSTRAINT fk_colaborador_07 FOREIGN KEY (id_tipo_admissao) REFERENCES sagnus.corp_tipo_admissao(id);


--
-- TOC entry 9207 (class 2606 OID 23561)
-- Name: corp_colaborador_relacionamento fk_colaborador_relacionamento_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador_relacionamento
    ADD CONSTRAINT fk_colaborador_relacionamento_01 FOREIGN KEY (id_colaborador) REFERENCES sagnus.corp_colaborador(id);


--
-- TOC entry 9208 (class 2606 OID 23566)
-- Name: corp_colaborador_relacionamento fk_colaborador_relacionamento_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_colaborador_relacionamento
    ADD CONSTRAINT fk_colaborador_relacionamento_02 FOREIGN KEY (id_tipo_relacionamento) REFERENCES sagnus.corp_tipo_relacionamento(id);


--
-- TOC entry 9245 (class 2606 OID 26903)
-- Name: com_vend_comissao_objetivo fk_comissao_objetivo_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_comissao_objetivo
    ADD CONSTRAINT fk_comissao_objetivo_01 FOREIGN KEY (id_comissao_perfil) REFERENCES sagnus.com_vend_comissao_perfil(id);


--
-- TOC entry 9246 (class 2606 OID 26984)
-- Name: com_vend_comissao_objetivo fk_comissao_objetivo_produto; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_comissao_objetivo
    ADD CONSTRAINT fk_comissao_objetivo_produto FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9296 (class 2606 OID 28456)
-- Name: corp_pessoa_papel fk_corp_pessoa_papel_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_papel
    ADD CONSTRAINT fk_corp_pessoa_papel_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9283 (class 2606 OID 27683)
-- Name: ctbl_conta fk_ctbl_conta_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_conta
    ADD CONSTRAINT fk_ctbl_conta_01 FOREIGN KEY (id_plano_conta) REFERENCES sagnus.ctbl_plano_conta(id);


--
-- TOC entry 9284 (class 2606 OID 27688)
-- Name: ctbl_conta fk_ctbl_conta_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_conta
    ADD CONSTRAINT fk_ctbl_conta_02 FOREIGN KEY (id_ctbl_conta) REFERENCES sagnus.ctbl_conta(id);


--
-- TOC entry 9285 (class 2606 OID 27693)
-- Name: ctbl_conta fk_ctbl_conta_03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.ctbl_conta
    ADD CONSTRAINT fk_ctbl_conta_03 FOREIGN KEY (id_plano_conta_ref_sped) REFERENCES sagnus.ctbl_plano_conta_ref_sped(id);


--
-- TOC entry 9154 (class 2606 OID 21418)
-- Name: fisc_cte_aereo fk_cte_aereo_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_aereo
    ADD CONSTRAINT fk_cte_aereo_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9155 (class 2606 OID 21440)
-- Name: fisc_cte_aquaviario fk_cte_aquaviario_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_aquaviario
    ADD CONSTRAINT fk_cte_aquaviario_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9156 (class 2606 OID 21465)
-- Name: fisc_cte_aquaviario_balsa fk_cte_aquaviario_balsa_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_aquaviario_balsa
    ADD CONSTRAINT fk_cte_aquaviario_balsa_01 FOREIGN KEY (id_cte_aquaviario) REFERENCES sagnus.fisc_cte_aquaviario(id);


--
-- TOC entry 9157 (class 2606 OID 21485)
-- Name: fisc_cte_carga fk_cte_carga_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_carga
    ADD CONSTRAINT fk_cte_carga_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9158 (class 2606 OID 21504)
-- Name: fisc_cte_componente fk_cte_componente_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_componente
    ADD CONSTRAINT fk_cte_componente_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9159 (class 2606 OID 23792)
-- Name: fisc_cte_destinatario fk_cte_destinat_pessoa_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_destinatario
    ADD CONSTRAINT fk_cte_destinat_pessoa_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9160 (class 2606 OID 21540)
-- Name: fisc_cte_destinatario fk_cte_destinatario_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_destinatario
    ADD CONSTRAINT fk_cte_destinatario_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9161 (class 2606 OID 21562)
-- Name: fisc_cte_documento_anterior fk_cte_documento_anterior_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_documento_anterior
    ADD CONSTRAINT fk_cte_documento_anterior_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9162 (class 2606 OID 21593)
-- Name: fisc_cte_duplicata fk_cte_duplicata_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_duplicata
    ADD CONSTRAINT fk_cte_duplicata_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9163 (class 2606 OID 21611)
-- Name: fisc_cte_dutoviario fk_cte_dutoviario_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_dutoviario
    ADD CONSTRAINT fk_cte_dutoviario_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9164 (class 2606 OID 21643)
-- Name: fisc_cte_emitente fk_cte_emitente_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_emitente
    ADD CONSTRAINT fk_cte_emitente_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9165 (class 2606 OID 23782)
-- Name: fisc_cte_emitente fk_cte_emitente_pessoa_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_emitente
    ADD CONSTRAINT fk_cte_emitente_pessoa_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9166 (class 2606 OID 21679)
-- Name: fisc_cte_expedidor fk_cte_expedidor_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_expedidor
    ADD CONSTRAINT fk_cte_expedidor_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9167 (class 2606 OID 23797)
-- Name: fisc_cte_expedidor fk_cte_expedidor_pessoa_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_expedidor
    ADD CONSTRAINT fk_cte_expedidor_pessoa_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9168 (class 2606 OID 21700)
-- Name: fisc_cte_fatura fk_cte_fatura_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_fatura
    ADD CONSTRAINT fk_cte_fatura_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9169 (class 2606 OID 21723)
-- Name: fisc_cte_ferroviario fk_cte_ferroviario_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_ferroviario
    ADD CONSTRAINT fk_cte_ferroviario_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9170 (class 2606 OID 21754)
-- Name: fisc_cte_ferroviario_ferrovia fk_cte_ferroviario_ferrovia_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_ferroviario_ferrovia
    ADD CONSTRAINT fk_cte_ferroviario_ferrovia_01 FOREIGN KEY (id_cte_ferroviario) REFERENCES sagnus.fisc_cte_ferroviario(id);


--
-- TOC entry 9171 (class 2606 OID 21776)
-- Name: fisc_cte_ferroviario_vagao fk_cte_ferroviario_vagao_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_ferroviario_vagao
    ADD CONSTRAINT fk_cte_ferroviario_vagao_01 FOREIGN KEY (id_cte_ferroviario) REFERENCES sagnus.fisc_cte_ferroviario(id);


--
-- TOC entry 9175 (class 2606 OID 21869)
-- Name: fisc_cte_inf_nf_carga_lacre fk_cte_inf_nf_carga_lacre_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_inf_nf_carga_lacre
    ADD CONSTRAINT fk_cte_inf_nf_carga_lacre_01 FOREIGN KEY (id_cte_informacao_nf_carga) REFERENCES sagnus.fisc_cte_informacao_nf_carga(id);


--
-- TOC entry 9176 (class 2606 OID 21887)
-- Name: fisc_cte_inf_nf_transporte_lacre fk_cte_inf_nf_transporte_lacre_0; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_inf_nf_transporte_lacre
    ADD CONSTRAINT fk_cte_inf_nf_transporte_lacre_0 FOREIGN KEY (id_cte_informacao_nf_transporte) REFERENCES sagnus.fisc_cte_informacao_nf_transporte(id);


--
-- TOC entry 9174 (class 2606 OID 21850)
-- Name: fisc_cte_informacao_nf_carga fk_cte_informacao_nf_carga_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_informacao_nf_carga
    ADD CONSTRAINT fk_cte_informacao_nf_carga_01 FOREIGN KEY (id_cte_informacao_nf) REFERENCES sagnus.fisc_cte_informacao_nf_outros(id);


--
-- TOC entry 9172 (class 2606 OID 21812)
-- Name: fisc_cte_informacao_nf_outros fk_cte_informacao_nf_outros_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_informacao_nf_outros
    ADD CONSTRAINT fk_cte_informacao_nf_outros_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9173 (class 2606 OID 21831)
-- Name: fisc_cte_informacao_nf_transporte fk_cte_informacao_nf_transporte_; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_informacao_nf_transporte
    ADD CONSTRAINT fk_cte_informacao_nf_transporte_ FOREIGN KEY (id_cte_informacao_nf) REFERENCES sagnus.fisc_cte_informacao_nf_outros(id);


--
-- TOC entry 9177 (class 2606 OID 21916)
-- Name: fisc_cte_local_coleta fk_cte_local_coleta_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_local_coleta
    ADD CONSTRAINT fk_cte_local_coleta_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9179 (class 2606 OID 21945)
-- Name: fisc_cte_local_entrega fk_cte_local_entrega_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_local_entrega
    ADD CONSTRAINT fk_cte_local_entrega_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9178 (class 2606 OID 23812)
-- Name: fisc_cte_local_coleta fk_cte_localcoleta_pessoa01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_local_coleta
    ADD CONSTRAINT fk_cte_localcoleta_pessoa01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9180 (class 2606 OID 23817)
-- Name: fisc_cte_local_entrega fk_cte_localentrega_pessoa01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_local_entrega
    ADD CONSTRAINT fk_cte_localentrega_pessoa01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9181 (class 2606 OID 21964)
-- Name: fisc_cte_multimodal fk_cte_multimodal_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_multimodal
    ADD CONSTRAINT fk_cte_multimodal_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9182 (class 2606 OID 21984)
-- Name: fisc_cte_passagem fk_cte_passagem_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_passagem
    ADD CONSTRAINT fk_cte_passagem_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9183 (class 2606 OID 22008)
-- Name: fisc_cte_perigoso fk_cte_perigoso_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_perigoso
    ADD CONSTRAINT fk_cte_perigoso_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9184 (class 2606 OID 22044)
-- Name: fisc_cte_recebedor fk_cte_recebedor_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_recebedor
    ADD CONSTRAINT fk_cte_recebedor_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9185 (class 2606 OID 23802)
-- Name: fisc_cte_recebedor fk_cte_recebedor_pessoa_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_recebedor
    ADD CONSTRAINT fk_cte_recebedor_pessoa_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9186 (class 2606 OID 22080)
-- Name: fisc_cte_remetente fk_cte_remetente_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_remetente
    ADD CONSTRAINT fk_cte_remetente_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9187 (class 2606 OID 23787)
-- Name: fisc_cte_remetente fk_cte_remetente_pessoa_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_remetente
    ADD CONSTRAINT fk_cte_remetente_pessoa_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9188 (class 2606 OID 22100)
-- Name: fisc_cte_rodoviario fk_cte_rodoviario_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario
    ADD CONSTRAINT fk_cte_rodoviario_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9189 (class 2606 OID 22118)
-- Name: fisc_cte_rodoviario_lacre fk_cte_rodoviario_lacre_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario_lacre
    ADD CONSTRAINT fk_cte_rodoviario_lacre_01 FOREIGN KEY (id_cte_rodoviario) REFERENCES sagnus.fisc_cte_rodoviario(id);


--
-- TOC entry 9190 (class 2606 OID 22137)
-- Name: fisc_cte_rodoviario_motorista fk_cte_rodoviario_motorista_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario_motorista
    ADD CONSTRAINT fk_cte_rodoviario_motorista_01 FOREIGN KEY (id_cte_rodoviario) REFERENCES sagnus.fisc_cte_rodoviario(id);


--
-- TOC entry 9191 (class 2606 OID 22161)
-- Name: fisc_cte_rodoviario_occ fk_cte_rodoviario_occ_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario_occ
    ADD CONSTRAINT fk_cte_rodoviario_occ_01 FOREIGN KEY (id_cte_rodoviario) REFERENCES sagnus.fisc_cte_rodoviario(id);


--
-- TOC entry 9192 (class 2606 OID 22182)
-- Name: fisc_cte_rodoviario_pedagio fk_cte_rodoviario_pedagio_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario_pedagio
    ADD CONSTRAINT fk_cte_rodoviario_pedagio_01 FOREIGN KEY (id_cte_rodoviario) REFERENCES sagnus.fisc_cte_rodoviario(id);


--
-- TOC entry 9193 (class 2606 OID 22217)
-- Name: fisc_cte_rodoviario_veiculo fk_cte_rodoviario_veiculo_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_rodoviario_veiculo
    ADD CONSTRAINT fk_cte_rodoviario_veiculo_01 FOREIGN KEY (id_cte_rodoviario) REFERENCES sagnus.fisc_cte_rodoviario(id);


--
-- TOC entry 9194 (class 2606 OID 22239)
-- Name: fisc_cte_seguro fk_cte_seguro_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_seguro
    ADD CONSTRAINT fk_cte_seguro_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9195 (class 2606 OID 22275)
-- Name: fisc_cte_tomador fk_cte_tomador_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_tomador
    ADD CONSTRAINT fk_cte_tomador_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9196 (class 2606 OID 23807)
-- Name: fisc_cte_tomador fk_cte_tomador_pessoa_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_tomador
    ADD CONSTRAINT fk_cte_tomador_pessoa_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9197 (class 2606 OID 22298)
-- Name: fisc_cte_veiculo_novo fk_cte_veiculo_novo_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_cte_veiculo_novo
    ADD CONSTRAINT fk_cte_veiculo_novo_01 FOREIGN KEY (id_cte_cabecalho) REFERENCES sagnus.fisc_cte_cabecalho(id);


--
-- TOC entry 9209 (class 2606 OID 23571)
-- Name: corp_empresa_cnae fk_empresa_cnae_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_cnae
    ADD CONSTRAINT fk_empresa_cnae_01 FOREIGN KEY (id_cnae) REFERENCES sagnus.corp_cnae(id);


--
-- TOC entry 9210 (class 2606 OID 23576)
-- Name: corp_empresa_cnae fk_empresa_cnae_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_cnae
    ADD CONSTRAINT fk_empresa_cnae_02 FOREIGN KEY (id_empresa) REFERENCES sagnus.corp_empresa(id);


--
-- TOC entry 9211 (class 2606 OID 23581)
-- Name: corp_empresa_contato fk_empresa_contato_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_contato
    ADD CONSTRAINT fk_empresa_contato_01 FOREIGN KEY (id_empresa) REFERENCES sagnus.corp_empresa(id);


--
-- TOC entry 9212 (class 2606 OID 23586)
-- Name: corp_empresa_endereco fk_empresa_endereco_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_endereco
    ADD CONSTRAINT fk_empresa_endereco_01 FOREIGN KEY (id_empresa) REFERENCES sagnus.corp_empresa(id);


--
-- TOC entry 9213 (class 2606 OID 23591)
-- Name: corp_empresa_telefone fk_empresa_telefone_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_telefone
    ADD CONSTRAINT fk_empresa_telefone_01 FOREIGN KEY (id_empresa) REFERENCES sagnus.corp_empresa(id);


--
-- TOC entry 9214 (class 2606 OID 23596)
-- Name: corp_empresa_transporte_itinerario fk_empresa_transporte_itinerario; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_empresa_transporte_itinerario
    ADD CONSTRAINT fk_empresa_transporte_itinerario FOREIGN KEY (id_empresa_transporte) REFERENCES sagnus.corp_empresa_transporte(id);


--
-- TOC entry 9236 (class 2606 OID 25773)
-- Name: supr_estq_grade fk_estq_grade_produto_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_grade
    ADD CONSTRAINT fk_estq_grade_produto_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9237 (class 2606 OID 25779)
-- Name: supr_estq_reajuste_cab fk_estq_reajuste_cab_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_reajuste_cab
    ADD CONSTRAINT fk_estq_reajuste_cab_01 FOREIGN KEY (id_colaborador) REFERENCES sagnus.corp_colaborador(id);


--
-- TOC entry 9238 (class 2606 OID 25784)
-- Name: supr_estq_reajuste_det fk_estq_reajuste_det_prod_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_reajuste_det
    ADD CONSTRAINT fk_estq_reajuste_det_prod_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9297 (class 2606 OID 28480)
-- Name: supr_estq_saldo fk_estq_saldo_produto; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_saldo
    ADD CONSTRAINT fk_estq_saldo_produto FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9215 (class 2606 OID 23601)
-- Name: corp_fornecedor fk_fornecedor_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_fornecedor
    ADD CONSTRAINT fk_fornecedor_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9298 (class 2606 OID 28518)
-- Name: supr_estq_saldo_historico fk_hist_local; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_saldo_historico
    ADD CONSTRAINT fk_hist_local FOREIGN KEY (id_local) REFERENCES sagnus.supr_estq_local(id);


--
-- TOC entry 9299 (class 2606 OID 28513)
-- Name: supr_estq_saldo_historico fk_hist_produto; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_estq_saldo_historico
    ADD CONSTRAINT fk_hist_produto FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9239 (class 2606 OID 25799)
-- Name: supr_invt_contagem_det fk_invt_contagem_det_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_invt_contagem_det
    ADD CONSTRAINT fk_invt_contagem_det_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9240 (class 2606 OID 25794)
-- Name: supr_invt_contagem_det fk_invt_contagem_det_prod_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_invt_contagem_det
    ADD CONSTRAINT fk_invt_contagem_det_prod_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9114 (class 2606 OID 23752)
-- Name: fisc_nfe fk_nfe_cab_cliente_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe
    ADD CONSTRAINT fk_nfe_cab_cliente_01 FOREIGN KEY (id_cliente) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9115 (class 2606 OID 23757)
-- Name: fisc_nfe fk_nfe_cab_fornecedor_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe
    ADD CONSTRAINT fk_nfe_cab_fornecedor_01 FOREIGN KEY (id_fornecedor) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9116 (class 2606 OID 23747)
-- Name: fisc_nfe fk_nfe_cab_vendedor_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe
    ADD CONSTRAINT fk_nfe_cab_vendedor_01 FOREIGN KEY (id_vendedor) REFERENCES sagnus.corp_colaborador(id);


--
-- TOC entry 9117 (class 2606 OID 19665)
-- Name: fisc_nfe_cana fk_nfe_cana_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_cana
    ADD CONSTRAINT fk_nfe_cana_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9118 (class 2606 OID 19687)
-- Name: fisc_nfe_cana_deducoes_safra fk_nfe_cana_deducoes_safra_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_cana_deducoes_safra
    ADD CONSTRAINT fk_nfe_cana_deducoes_safra_01 FOREIGN KEY (id_nfe_cana) REFERENCES sagnus.fisc_nfe_cana(id);


--
-- TOC entry 9119 (class 2606 OID 19709)
-- Name: fisc_nfe_cana_fornecimento_diario fk_nfe_cana_fornecimento_diario_; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_cana_fornecimento_diario
    ADD CONSTRAINT fk_nfe_cana_fornecimento_diario_ FOREIGN KEY (id_nfe_cana) REFERENCES sagnus.fisc_nfe_cana(id);


--
-- TOC entry 9120 (class 2606 OID 19759)
-- Name: fisc_nfe_cte_referenciado fk_nfe_cte_referenciado_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_cte_referenciado
    ADD CONSTRAINT fk_nfe_cte_referenciado_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9121 (class 2606 OID 19781)
-- Name: fisc_nfe_cupom_fiscal_referenciado fk_nfe_cupom_fiscal_referenciado; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_cupom_fiscal_referenciado
    ADD CONSTRAINT fk_nfe_cupom_fiscal_referenciado FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9138 (class 2606 OID 20373)
-- Name: fisc_nfe_declaracao_importacao fk_nfe_declaracao_importacao_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_declaracao_importacao
    ADD CONSTRAINT fk_nfe_declaracao_importacao_01 FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9122 (class 2606 OID 19820)
-- Name: fisc_nfe_destinatario fk_nfe_destinatario_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_destinatario
    ADD CONSTRAINT fk_nfe_destinatario_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9123 (class 2606 OID 23762)
-- Name: fisc_nfe_detalhe fk_nfe_det_produto_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe
    ADD CONSTRAINT fk_nfe_det_produto_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9124 (class 2606 OID 19990)
-- Name: fisc_nfe_detalhe fk_nfe_detalhe_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe
    ADD CONSTRAINT fk_nfe_detalhe_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9125 (class 2606 OID 20014)
-- Name: fisc_nfe_detalhe_imposto_cofins fk_nfe_detalhe_imposto_cofins_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_cofins
    ADD CONSTRAINT fk_nfe_detalhe_imposto_cofins_01 FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9126 (class 2606 OID 20036)
-- Name: fisc_nfe_detalhe_imposto_cofins_st fk_nfe_detalhe_imposto_cofins_st; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_cofins_st
    ADD CONSTRAINT fk_nfe_detalhe_imposto_cofins_st FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9127 (class 2606 OID 20095)
-- Name: fisc_nfe_detalhe_imposto_icms fk_nfe_detalhe_imposto_icms_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_icms
    ADD CONSTRAINT fk_nfe_detalhe_imposto_icms_01 FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9128 (class 2606 OID 20121)
-- Name: fisc_nfe_detalhe_imposto_icms_ufdest fk_nfe_detalhe_imposto_icms_ufde; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_icms_ufdest
    ADD CONSTRAINT fk_nfe_detalhe_imposto_icms_ufde FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9129 (class 2606 OID 20142)
-- Name: fisc_nfe_detalhe_imposto_ii fk_nfe_detalhe_imposto_ii_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_ii
    ADD CONSTRAINT fk_nfe_detalhe_imposto_ii_01 FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9130 (class 2606 OID 20169)
-- Name: fisc_nfe_detalhe_imposto_ipi fk_nfe_detalhe_imposto_ipi_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_ipi
    ADD CONSTRAINT fk_nfe_detalhe_imposto_ipi_01 FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9131 (class 2606 OID 20202)
-- Name: fisc_nfe_detalhe_imposto_issqn fk_nfe_detalhe_imposto_issqn_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_issqn
    ADD CONSTRAINT fk_nfe_detalhe_imposto_issqn_01 FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9132 (class 2606 OID 20225)
-- Name: fisc_nfe_detalhe_imposto_pis fk_nfe_detalhe_imposto_pis_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_pis
    ADD CONSTRAINT fk_nfe_detalhe_imposto_pis_01 FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9133 (class 2606 OID 20247)
-- Name: fisc_nfe_detalhe_imposto_pis_st fk_nfe_detalhe_imposto_pis_st_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_detalhe_imposto_pis_st
    ADD CONSTRAINT fk_nfe_detalhe_imposto_pis_st_01 FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9135 (class 2606 OID 20287)
-- Name: fisc_nfe_duplicata fk_nfe_duplicata_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_duplicata
    ADD CONSTRAINT fk_nfe_duplicata_01 FOREIGN KEY (id_nfe_fatura) REFERENCES sagnus.fisc_nfe_fatura(id);


--
-- TOC entry 9136 (class 2606 OID 20326)
-- Name: fisc_nfe_emitente fk_nfe_emitente_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_emitente
    ADD CONSTRAINT fk_nfe_emitente_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9137 (class 2606 OID 20347)
-- Name: fisc_nfe_exportacao fk_nfe_exportacao_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_exportacao
    ADD CONSTRAINT fk_nfe_exportacao_01 FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9134 (class 2606 OID 20268)
-- Name: fisc_nfe_fatura fk_nfe_fatura_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_fatura
    ADD CONSTRAINT fk_nfe_fatura_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9139 (class 2606 OID 20395)
-- Name: fisc_nfe_importacao_det fk_nfe_importacao_detalhe_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_importacao_det
    ADD CONSTRAINT fk_nfe_importacao_detalhe_01 FOREIGN KEY (id_nfe_declaracao_importacao) REFERENCES sagnus.fisc_nfe_declaracao_importacao(id);


--
-- TOC entry 9140 (class 2606 OID 20420)
-- Name: fisc_nfe_informacao_pagamento fk_nfe_informacao_pagamento_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_informacao_pagamento
    ADD CONSTRAINT fk_nfe_informacao_pagamento_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9141 (class 2606 OID 20440)
-- Name: fisc_nfe_item_rastreado fk_nfe_item_rastreado_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_item_rastreado
    ADD CONSTRAINT fk_nfe_item_rastreado_01 FOREIGN KEY (id_nfe_detalhe) REFERENCES sagnus.fisc_nfe_detalhe(id);


--
-- TOC entry 9142 (class 2606 OID 20475)
-- Name: fisc_nfe_local_entrega fk_nfe_local_entrega_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_local_entrega
    ADD CONSTRAINT fk_nfe_local_entrega_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9143 (class 2606 OID 20510)
-- Name: fisc_nfe_local_retirada fk_nfe_local_retirada_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_local_retirada
    ADD CONSTRAINT fk_nfe_local_retirada_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9144 (class 2606 OID 20533)
-- Name: fisc_nfe_nf_referenciada fk_nfe_nf_referenciada_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_nf_referenciada
    ADD CONSTRAINT fk_nfe_nf_referenciada_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9145 (class 2606 OID 20578)
-- Name: fisc_nfe_processo_referenciado fk_nfe_processo_referenciado_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_processo_referenciado
    ADD CONSTRAINT fk_nfe_processo_referenciado_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9146 (class 2606 OID 20603)
-- Name: fisc_nfe_prod_rural_referenciada fk_nfe_prod_rural_referenciada_0; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_prod_rural_referenciada
    ADD CONSTRAINT fk_nfe_prod_rural_referenciada_0 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9147 (class 2606 OID 20621)
-- Name: fisc_nfe_referenciada fk_nfe_referenciada_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_referenciada
    ADD CONSTRAINT fk_nfe_referenciada_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9148 (class 2606 OID 20644)
-- Name: fisc_nfe_responsavel_tecnico fk_nfe_responsavel_tecnico_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_responsavel_tecnico
    ADD CONSTRAINT fk_nfe_responsavel_tecnico_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9149 (class 2606 OID 23767)
-- Name: fisc_nfe_transporte fk_nfe_transp_transporta_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_transporte
    ADD CONSTRAINT fk_nfe_transp_transporta_01 FOREIGN KEY (id_transportadora) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9150 (class 2606 OID 20679)
-- Name: fisc_nfe_transporte fk_nfe_transporte_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_transporte
    ADD CONSTRAINT fk_nfe_transporte_01 FOREIGN KEY (id_nfe_cabecalho) REFERENCES sagnus.fisc_nfe(id);


--
-- TOC entry 9151 (class 2606 OID 20702)
-- Name: fisc_nfe_transporte_reboque fk_nfe_transporte_reboque_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_transporte_reboque
    ADD CONSTRAINT fk_nfe_transporte_reboque_01 FOREIGN KEY (id_nfe_transporte) REFERENCES sagnus.fisc_nfe_transporte(id);


--
-- TOC entry 9152 (class 2606 OID 20725)
-- Name: fisc_nfe_transporte_volume fk_nfe_transporte_volume_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_transporte_volume
    ADD CONSTRAINT fk_nfe_transporte_volume_01 FOREIGN KEY (id_nfe_transporte) REFERENCES sagnus.fisc_nfe_transporte(id);


--
-- TOC entry 9153 (class 2606 OID 20743)
-- Name: fisc_nfe_transporte_volume_lacre fk_nfe_transporte_volume_lacre_0; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fisc_nfe_transporte_volume_lacre
    ADD CONSTRAINT fk_nfe_transporte_volume_lacre_0 FOREIGN KEY (id_nfe_transporte_volume) REFERENCES sagnus.fisc_nfe_transporte_volume(id);


--
-- TOC entry 9270 (class 2606 OID 27601)
-- Name: orca_orcamento_detalhe fk_orcamento_detalhe_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.orca_orcamento_detalhe
    ADD CONSTRAINT fk_orcamento_detalhe_01 FOREIGN KEY (id_orcamento_empresarial) REFERENCES sagnus.orca_orcamento_empresarial(id);


--
-- TOC entry 9271 (class 2606 OID 27606)
-- Name: orca_orcamento_empresarial fk_orcamento_empresarial_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.orca_orcamento_empresarial
    ADD CONSTRAINT fk_orcamento_empresarial_01 FOREIGN KEY (id_orcamento_periodo) REFERENCES sagnus.orca_orcamento_periodo(id);


--
-- TOC entry 9272 (class 2606 OID 27611)
-- Name: orca_orcamento_fluxo_caixa fk_orcamento_fluxo_caixa_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.orca_orcamento_fluxo_caixa
    ADD CONSTRAINT fk_orcamento_fluxo_caixa_01 FOREIGN KEY (id_orc_fluxo_caixa_periodo) REFERENCES sagnus.orca_orcamento_fluxo_caixa_periodo(id);


--
-- TOC entry 9273 (class 2606 OID 27616)
-- Name: orca_orcamento_fluxo_caixa_detalhe fk_orcamento_fluxo_caixa_detalhe; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.orca_orcamento_fluxo_caixa_detalhe
    ADD CONSTRAINT fk_orcamento_fluxo_caixa_detalhe FOREIGN KEY (id_orcamento_fluxo_caixa) REFERENCES sagnus.orca_orcamento_fluxo_caixa(id);


--
-- TOC entry 9274 (class 2606 OID 27628)
-- Name: pcp_instrucao_op fk_pcp_instrucao_op_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_instrucao_op
    ADD CONSTRAINT fk_pcp_instrucao_op_01 FOREIGN KEY (id_pcp_instrucao) REFERENCES sagnus.pcp_instrucao(id);


--
-- TOC entry 9275 (class 2606 OID 27633)
-- Name: pcp_instrucao_op fk_pcp_instrucao_op_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_instrucao_op
    ADD CONSTRAINT fk_pcp_instrucao_op_02 FOREIGN KEY (id_pcp_op_cabecalho) REFERENCES sagnus.pcp_op_cabecalho(id);


--
-- TOC entry 9276 (class 2606 OID 27638)
-- Name: pcp_op_detalhe fk_pcp_op_detalhe_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_op_detalhe
    ADD CONSTRAINT fk_pcp_op_detalhe_01 FOREIGN KEY (id_pcp_op_cabecalho) REFERENCES sagnus.pcp_op_cabecalho(id);


--
-- TOC entry 9277 (class 2606 OID 27643)
-- Name: pcp_servico fk_pcp_servico_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_servico
    ADD CONSTRAINT fk_pcp_servico_01 FOREIGN KEY (id_pcp_op_detalhe) REFERENCES sagnus.pcp_op_detalhe(id);


--
-- TOC entry 9278 (class 2606 OID 27648)
-- Name: pcp_servico_colaborador fk_pcp_servico_colaborador_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_servico_colaborador
    ADD CONSTRAINT fk_pcp_servico_colaborador_01 FOREIGN KEY (id_pcp_servico) REFERENCES sagnus.pcp_servico(id);


--
-- TOC entry 9279 (class 2606 OID 27653)
-- Name: pcp_servico_equipamento fk_pcp_servico_equipamento_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.pcp_servico_equipamento
    ADD CONSTRAINT fk_pcp_servico_equipamento_01 FOREIGN KEY (id_pcp_servico) REFERENCES sagnus.pcp_servico(id);


--
-- TOC entry 9300 (class 2606 OID 28535)
-- Name: com_vend_pedido fk_pedido_cliente; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pedido
    ADD CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9301 (class 2606 OID 28540)
-- Name: com_vend_pedido fk_pedido_tabela; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pedido
    ADD CONSTRAINT fk_pedido_tabela FOREIGN KEY (id_tabela_preco) REFERENCES sagnus.com_vend_tabela_preco(id);


--
-- TOC entry 9216 (class 2606 OID 23606)
-- Name: corp_pessoa_alteracao fk_pessoa_alteracao_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_alteracao
    ADD CONSTRAINT fk_pessoa_alteracao_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9217 (class 2606 OID 23611)
-- Name: corp_pessoa_contato fk_pessoa_contato_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_contato
    ADD CONSTRAINT fk_pessoa_contato_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9218 (class 2606 OID 23616)
-- Name: corp_pessoa_endereco fk_pessoa_endereco_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_endereco
    ADD CONSTRAINT fk_pessoa_endereco_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9219 (class 2606 OID 23621)
-- Name: corp_pessoa_fisica fk_pessoa_fisica_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_fisica
    ADD CONSTRAINT fk_pessoa_fisica_01 FOREIGN KEY (id_estado_civil) REFERENCES sagnus.corp_estado_civil(id);


--
-- TOC entry 9220 (class 2606 OID 23626)
-- Name: corp_pessoa_fisica fk_pessoa_fisica_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_fisica
    ADD CONSTRAINT fk_pessoa_fisica_02 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9221 (class 2606 OID 23631)
-- Name: corp_pessoa_juridica fk_pessoa_juridica_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_juridica
    ADD CONSTRAINT fk_pessoa_juridica_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9222 (class 2606 OID 23636)
-- Name: corp_pessoa_telefone fk_pessoa_telefone_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_pessoa_telefone
    ADD CONSTRAINT fk_pessoa_telefone_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9247 (class 2606 OID 26990)
-- Name: com_vend_pre_venda_cab fk_pre_venda_cab_pessoa; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pre_venda_cab
    ADD CONSTRAINT fk_pre_venda_cab_pessoa FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9248 (class 2606 OID 26908)
-- Name: com_vend_pre_venda_det fk_pre_venda_det_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pre_venda_det
    ADD CONSTRAINT fk_pre_venda_det_01 FOREIGN KEY (id_pre_venda_cab) REFERENCES sagnus.com_vend_pre_venda_cab(id);


--
-- TOC entry 9249 (class 2606 OID 26996)
-- Name: com_vend_pre_venda_det fk_pre_venda_det_produto; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_pre_venda_det
    ADD CONSTRAINT fk_pre_venda_det_produto FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9223 (class 2606 OID 23641)
-- Name: corp_produto fk_produto_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto
    ADD CONSTRAINT fk_produto_01 FOREIGN KEY (id_produto_marca) REFERENCES sagnus.corp_produto_marca(id);


--
-- TOC entry 9224 (class 2606 OID 23646)
-- Name: corp_produto fk_produto_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto
    ADD CONSTRAINT fk_produto_02 FOREIGN KEY (id_produto_subgrupo) REFERENCES sagnus.corp_produto_subgrupo(id);


--
-- TOC entry 9225 (class 2606 OID 23651)
-- Name: corp_produto fk_produto_03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto
    ADD CONSTRAINT fk_produto_03 FOREIGN KEY (id_produto_unidade) REFERENCES sagnus.corp_produto_unidade(id);


--
-- TOC entry 9226 (class 2606 OID 23656)
-- Name: corp_produto fk_produto_04; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto
    ADD CONSTRAINT fk_produto_04 FOREIGN KEY (id_tribut_grupo_tributario) REFERENCES sagnus.fisc_trib_grupo_tributario(id);


--
-- TOC entry 9227 (class 2606 OID 23661)
-- Name: corp_produto fk_produto_05; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto
    ADD CONSTRAINT fk_produto_05 FOREIGN KEY (id_tribut_icms_custom_cab) REFERENCES sagnus.fisc_trib_icms_custom_cab(id);


--
-- TOC entry 9228 (class 2606 OID 23666)
-- Name: corp_produto_alteracao_item fk_produto_alteracao_item_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_alteracao_item
    ADD CONSTRAINT fk_produto_alteracao_item_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9229 (class 2606 OID 23671)
-- Name: corp_produto_codigo_adicional fk_produto_codigo_adicional_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_codigo_adicional
    ADD CONSTRAINT fk_produto_codigo_adicional_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9230 (class 2606 OID 23676)
-- Name: corp_produto_ficha_tecnica fk_produto_ficha_tecnica_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_ficha_tecnica
    ADD CONSTRAINT fk_produto_ficha_tecnica_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9231 (class 2606 OID 23681)
-- Name: corp_produto_promocao fk_produto_promocao_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_promocao
    ADD CONSTRAINT fk_produto_promocao_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9250 (class 2606 OID 27002)
-- Name: com_vend_produto_promocao fk_produto_promocao_produto; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_produto_promocao
    ADD CONSTRAINT fk_produto_promocao_produto FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9232 (class 2606 OID 23686)
-- Name: corp_produto_subgrupo fk_produto_subgrupo_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_produto_subgrupo
    ADD CONSTRAINT fk_produto_subgrupo_01 FOREIGN KEY (id_produto_grupo) REFERENCES sagnus.corp_produto_grupo(id);


--
-- TOC entry 9241 (class 2606 OID 25805)
-- Name: supr_req_interna_cab fk_req_interna_cab_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_req_interna_cab
    ADD CONSTRAINT fk_req_interna_cab_01 FOREIGN KEY (id_colaborador) REFERENCES sagnus.corp_colaborador(id);


--
-- TOC entry 9242 (class 2606 OID 25811)
-- Name: supr_req_interna_det fk_req_interna_det_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_req_interna_det
    ADD CONSTRAINT fk_req_interna_det_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9251 (class 2606 OID 26913)
-- Name: com_vend_tabela_preco_produto fk_tabela_preco_produto_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_tabela_preco_produto
    ADD CONSTRAINT fk_tabela_preco_produto_01 FOREIGN KEY (id_tabela_preco) REFERENCES sagnus.com_vend_tabela_preco(id);


--
-- TOC entry 9252 (class 2606 OID 27008)
-- Name: com_vend_tabela_preco_produto fk_tabela_preco_produto_produto; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_tabela_preco_produto
    ADD CONSTRAINT fk_tabela_preco_produto_produto FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9302 (class 2606 OID 28572)
-- Name: fina_titulo fk_titulo_pessoa; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.fina_titulo
    ADD CONSTRAINT fk_titulo_pessoa FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9233 (class 2606 OID 23691)
-- Name: corp_transportadora fk_transportadora_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_transportadora
    ADD CONSTRAINT fk_transportadora_01 FOREIGN KEY (id_pessoa) REFERENCES sagnus.corp_pessoa(id);


--
-- TOC entry 9253 (class 2606 OID 26918)
-- Name: com_vend_cab fk_venda_cab_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_cab
    ADD CONSTRAINT fk_venda_cab_01 FOREIGN KEY (id_venda_orcamento_cab) REFERENCES sagnus.com_vend_orcamento_cab(id);


--
-- TOC entry 9254 (class 2606 OID 26923)
-- Name: com_vend_cab fk_venda_cab_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_cab
    ADD CONSTRAINT fk_venda_cab_02 FOREIGN KEY (id_venda_condicoes_pagamento) REFERENCES sagnus.com_vend_condicoes_pagamento(id);


--
-- TOC entry 9255 (class 2606 OID 27014)
-- Name: com_vend_cab fk_venda_cab_cliente; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_cab
    ADD CONSTRAINT fk_venda_cab_cliente FOREIGN KEY (id_cliente) REFERENCES sagnus.corp_cliente(id);


--
-- TOC entry 9256 (class 2606 OID 27020)
-- Name: com_vend_cab fk_venda_cab_transportador; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_cab
    ADD CONSTRAINT fk_venda_cab_transportador FOREIGN KEY (id_transportadora) REFERENCES sagnus.corp_transportadora(id);


--
-- TOC entry 9257 (class 2606 OID 27025)
-- Name: com_vend_cab fk_venda_cab_vendedor_03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_cab
    ADD CONSTRAINT fk_venda_cab_vendedor_03 FOREIGN KEY (id_vendedor) REFERENCES sagnus.corp_vendedor(id);


--
-- TOC entry 9258 (class 2606 OID 26928)
-- Name: com_vend_comissao fk_venda_comissao_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_comissao
    ADD CONSTRAINT fk_venda_comissao_01 FOREIGN KEY (id_venda_cab) REFERENCES sagnus.com_vend_cab(id);


--
-- TOC entry 9259 (class 2606 OID 27030)
-- Name: com_vend_comissao fk_venda_comissao_vendedor; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_comissao
    ADD CONSTRAINT fk_venda_comissao_vendedor FOREIGN KEY (id_vendedor) REFERENCES sagnus.corp_vendedor(id);


--
-- TOC entry 9260 (class 2606 OID 26933)
-- Name: com_vend_condicoes_parcelas fk_venda_condicoes_parcelas_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_condicoes_parcelas
    ADD CONSTRAINT fk_venda_condicoes_parcelas_01 FOREIGN KEY (id_venda_condicoes_pagamento) REFERENCES sagnus.com_vend_condicoes_pagamento(id);


--
-- TOC entry 9261 (class 2606 OID 26938)
-- Name: com_vend_det fk_venda_det_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_det
    ADD CONSTRAINT fk_venda_det_01 FOREIGN KEY (id_venda_cab) REFERENCES sagnus.com_vend_cab(id);


--
-- TOC entry 9262 (class 2606 OID 27036)
-- Name: com_vend_det fk_venda_det_produto_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_det
    ADD CONSTRAINT fk_venda_det_produto_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9263 (class 2606 OID 26943)
-- Name: com_vend_frete fk_venda_frete_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_frete
    ADD CONSTRAINT fk_venda_frete_01 FOREIGN KEY (id_venda_cab) REFERENCES sagnus.com_vend_cab(id);


--
-- TOC entry 9264 (class 2606 OID 27041)
-- Name: com_vend_frete fk_venda_frete_transportadora_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_frete
    ADD CONSTRAINT fk_venda_frete_transportadora_01 FOREIGN KEY (id_transportadora) REFERENCES sagnus.corp_transportadora(id);


--
-- TOC entry 9265 (class 2606 OID 27046)
-- Name: com_vend_orcamento_cab fk_venda_orcamento_cab_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_orcamento_cab
    ADD CONSTRAINT fk_venda_orcamento_cab_01 FOREIGN KEY (id_cliente) REFERENCES sagnus.corp_cliente(id);


--
-- TOC entry 9266 (class 2606 OID 27051)
-- Name: com_vend_orcamento_cab fk_venda_orcamento_cab_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_orcamento_cab
    ADD CONSTRAINT fk_venda_orcamento_cab_02 FOREIGN KEY (id_transportadora) REFERENCES sagnus.corp_transportadora(id);


--
-- TOC entry 9267 (class 2606 OID 27056)
-- Name: com_vend_orcamento_cab fk_venda_orcamento_cab_03; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_orcamento_cab
    ADD CONSTRAINT fk_venda_orcamento_cab_03 FOREIGN KEY (id_vendedor) REFERENCES sagnus.corp_vendedor(id);


--
-- TOC entry 9268 (class 2606 OID 26953)
-- Name: com_vend_orcamento_det fk_venda_orcamento_det_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_orcamento_det
    ADD CONSTRAINT fk_venda_orcamento_det_01 FOREIGN KEY (id_venda_orcamento_cab) REFERENCES sagnus.com_vend_orcamento_cab(id);


--
-- TOC entry 9269 (class 2606 OID 27061)
-- Name: com_vend_orcamento_det fk_venda_orcamento_det_04; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.com_vend_orcamento_det
    ADD CONSTRAINT fk_venda_orcamento_det_04 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9234 (class 2606 OID 23696)
-- Name: corp_vendedor fk_vendedor_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_vendedor
    ADD CONSTRAINT fk_vendedor_01 FOREIGN KEY (id_colaborador) REFERENCES sagnus.corp_colaborador(id);


--
-- TOC entry 9235 (class 2606 OID 23701)
-- Name: corp_vendedor fk_vendedor_02; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.corp_vendedor
    ADD CONSTRAINT fk_vendedor_02 FOREIGN KEY (id_comissao_perfil) REFERENCES sagnus.corp_comissao_perfil(id);


--
-- TOC entry 9243 (class 2606 OID 25817)
-- Name: supr_wms_ordem_separacao_det fk_wms_ordem_separacao_det_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_ordem_separacao_det
    ADD CONSTRAINT fk_wms_ordem_separacao_det_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 9244 (class 2606 OID 25823)
-- Name: supr_wms_recebimento_det fk_wms_recebimento_det_01; Type: FK CONSTRAINT; Schema: sagnus; Owner: postgres
--

ALTER TABLE ONLY sagnus.supr_wms_recebimento_det
    ADD CONSTRAINT fk_wms_recebimento_det_01 FOREIGN KEY (id_produto) REFERENCES sagnus.corp_produto(id);


--
-- TOC entry 10007 (class 0 OID 0)
-- Dependencies: 239
-- Name: SEQUENCE seq_adm_agen_cat_comp; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_adm_agen_cat_comp TO sagnus_app;


--
-- TOC entry 10008 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE adm_agen_cat_compromisso; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.adm_agen_cat_compromisso TO sagnus_app;


--
-- TOC entry 10009 (class 0 OID 0)
-- Dependencies: 243
-- Name: SEQUENCE seq_adm_agen_comp_conv; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_adm_agen_comp_conv TO sagnus_app;


--
-- TOC entry 10010 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE adm_agen_comp_conv; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.adm_agen_comp_conv TO sagnus_app;


--
-- TOC entry 10011 (class 0 OID 0)
-- Dependencies: 241
-- Name: SEQUENCE seq_adm_agen_compromisso; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_adm_agen_compromisso TO sagnus_app;


--
-- TOC entry 10012 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE adm_agen_compromisso; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.adm_agen_compromisso TO sagnus_app;


--
-- TOC entry 10013 (class 0 OID 0)
-- Dependencies: 245
-- Name: SEQUENCE seq_adm_agen_notificacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_adm_agen_notificacao TO sagnus_app;


--
-- TOC entry 10014 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE adm_agen_notificacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.adm_agen_notificacao TO sagnus_app;


--
-- TOC entry 10015 (class 0 OID 0)
-- Dependencies: 235
-- Name: SEQUENCE seq_adm_modulo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_adm_modulo TO sagnus_app;


--
-- TOC entry 10016 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE adm_modulo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.adm_modulo TO sagnus_app;


--
-- TOC entry 10017 (class 0 OID 0)
-- Dependencies: 237
-- Name: SEQUENCE seq_adm_parametro; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_adm_parametro TO sagnus_app;


--
-- TOC entry 10018 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE adm_parametro; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.adm_parametro TO sagnus_app;


--
-- TOC entry 10019 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE auth_perfil; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.auth_perfil TO sagnus_app;


--
-- TOC entry 10020 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE auth_perfil_permissao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.auth_perfil_permissao TO sagnus_app;


--
-- TOC entry 10021 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE auth_permissao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.auth_permissao TO sagnus_app;


--
-- TOC entry 10022 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE auth_usuario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.auth_usuario TO sagnus_app;


--
-- TOC entry 10023 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE auth_usuario_perfil; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.auth_usuario_perfil TO sagnus_app;


--
-- TOC entry 10024 (class 0 OID 0)
-- Dependencies: 660
-- Name: SEQUENCE seq_vend_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_cab TO sagnus_app;


--
-- TOC entry 10025 (class 0 OID 0)
-- Dependencies: 686
-- Name: TABLE com_vend_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_cab TO sagnus_app;


--
-- TOC entry 10026 (class 0 OID 0)
-- Dependencies: 661
-- Name: SEQUENCE seq_vend_comissao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_comissao TO sagnus_app;


--
-- TOC entry 10027 (class 0 OID 0)
-- Dependencies: 687
-- Name: TABLE com_vend_comissao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_comissao TO sagnus_app;


--
-- TOC entry 10028 (class 0 OID 0)
-- Dependencies: 642
-- Name: SEQUENCE seq_vend_comissao_objetivo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_comissao_objetivo TO sagnus_app;


--
-- TOC entry 10029 (class 0 OID 0)
-- Dependencies: 668
-- Name: TABLE com_vend_comissao_objetivo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_comissao_objetivo TO sagnus_app;


--
-- TOC entry 10030 (class 0 OID 0)
-- Dependencies: 643
-- Name: SEQUENCE seq_vend_comissao_perfil; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_comissao_perfil TO sagnus_app;


--
-- TOC entry 10031 (class 0 OID 0)
-- Dependencies: 669
-- Name: TABLE com_vend_comissao_perfil; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_comissao_perfil TO sagnus_app;


--
-- TOC entry 10032 (class 0 OID 0)
-- Dependencies: 662
-- Name: SEQUENCE seq_vend_condicoes_pagamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_condicoes_pagamento TO sagnus_app;


--
-- TOC entry 10033 (class 0 OID 0)
-- Dependencies: 688
-- Name: TABLE com_vend_condicoes_pagamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_condicoes_pagamento TO sagnus_app;


--
-- TOC entry 10034 (class 0 OID 0)
-- Dependencies: 663
-- Name: SEQUENCE seq_vend_condicoes_parcelas; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_condicoes_parcelas TO sagnus_app;


--
-- TOC entry 10035 (class 0 OID 0)
-- Dependencies: 689
-- Name: TABLE com_vend_condicoes_parcelas; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_condicoes_parcelas TO sagnus_app;


--
-- TOC entry 10036 (class 0 OID 0)
-- Dependencies: 664
-- Name: SEQUENCE seq_vend_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_det TO sagnus_app;


--
-- TOC entry 10037 (class 0 OID 0)
-- Dependencies: 690
-- Name: TABLE com_vend_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_det TO sagnus_app;


--
-- TOC entry 10038 (class 0 OID 0)
-- Dependencies: 665
-- Name: SEQUENCE seq_vend_frete; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_frete TO sagnus_app;


--
-- TOC entry 10039 (class 0 OID 0)
-- Dependencies: 691
-- Name: TABLE com_vend_frete; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_frete TO sagnus_app;


--
-- TOC entry 10040 (class 0 OID 0)
-- Dependencies: 644
-- Name: SEQUENCE seq_vend_integracao_pdv; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_integracao_pdv TO sagnus_app;


--
-- TOC entry 10041 (class 0 OID 0)
-- Dependencies: 670
-- Name: TABLE com_vend_integracao_pdv; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_integracao_pdv TO sagnus_app;


--
-- TOC entry 10042 (class 0 OID 0)
-- Dependencies: 666
-- Name: SEQUENCE seq_vend_orcamento_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_orcamento_cab TO sagnus_app;


--
-- TOC entry 10043 (class 0 OID 0)
-- Dependencies: 692
-- Name: TABLE com_vend_orcamento_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_orcamento_cab TO sagnus_app;


--
-- TOC entry 10044 (class 0 OID 0)
-- Dependencies: 667
-- Name: SEQUENCE seq_vend_orcamento_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_orcamento_det TO sagnus_app;


--
-- TOC entry 10045 (class 0 OID 0)
-- Dependencies: 693
-- Name: TABLE com_vend_orcamento_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_orcamento_det TO sagnus_app;


--
-- TOC entry 10046 (class 0 OID 0)
-- Dependencies: 645
-- Name: SEQUENCE seq_vend_pdv_caixa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pdv_caixa TO sagnus_app;


--
-- TOC entry 10047 (class 0 OID 0)
-- Dependencies: 671
-- Name: TABLE com_vend_pdv_caixa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pdv_caixa TO sagnus_app;


--
-- TOC entry 10048 (class 0 OID 0)
-- Dependencies: 646
-- Name: SEQUENCE seq_vend_pdv_configuracao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pdv_configuracao TO sagnus_app;


--
-- TOC entry 10049 (class 0 OID 0)
-- Dependencies: 672
-- Name: TABLE com_vend_pdv_configuracao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pdv_configuracao TO sagnus_app;


--
-- TOC entry 10050 (class 0 OID 0)
-- Dependencies: 647
-- Name: SEQUENCE seq_vend_pdv_fechamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pdv_fechamento TO sagnus_app;


--
-- TOC entry 10051 (class 0 OID 0)
-- Dependencies: 673
-- Name: TABLE com_vend_pdv_fechamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pdv_fechamento TO sagnus_app;


--
-- TOC entry 10052 (class 0 OID 0)
-- Dependencies: 648
-- Name: SEQUENCE seq_vend_pdv_movimento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pdv_movimento TO sagnus_app;


--
-- TOC entry 10053 (class 0 OID 0)
-- Dependencies: 674
-- Name: TABLE com_vend_pdv_movimento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pdv_movimento TO sagnus_app;


--
-- TOC entry 10054 (class 0 OID 0)
-- Dependencies: 649
-- Name: SEQUENCE seq_vend_pdv_sangria; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pdv_sangria TO sagnus_app;


--
-- TOC entry 10055 (class 0 OID 0)
-- Dependencies: 675
-- Name: TABLE com_vend_pdv_sangria; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pdv_sangria TO sagnus_app;


--
-- TOC entry 10056 (class 0 OID 0)
-- Dependencies: 650
-- Name: SEQUENCE seq_vend_pdv_suprimento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pdv_suprimento TO sagnus_app;


--
-- TOC entry 10057 (class 0 OID 0)
-- Dependencies: 676
-- Name: TABLE com_vend_pdv_suprimento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pdv_suprimento TO sagnus_app;


--
-- TOC entry 10058 (class 0 OID 0)
-- Dependencies: 651
-- Name: SEQUENCE seq_vend_pdv_tipo_pagamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pdv_tipo_pagamento TO sagnus_app;


--
-- TOC entry 10059 (class 0 OID 0)
-- Dependencies: 677
-- Name: TABLE com_vend_pdv_tipo_pagamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pdv_tipo_pagamento TO sagnus_app;


--
-- TOC entry 10060 (class 0 OID 0)
-- Dependencies: 652
-- Name: SEQUENCE seq_vend_pdv_total_tipo_pagamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pdv_total_tipo_pagamento TO sagnus_app;


--
-- TOC entry 10061 (class 0 OID 0)
-- Dependencies: 678
-- Name: TABLE com_vend_pdv_total_tipo_pagamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pdv_total_tipo_pagamento TO sagnus_app;


--
-- TOC entry 10062 (class 0 OID 0)
-- Dependencies: 653
-- Name: SEQUENCE seq_vend_pdv_venda_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pdv_venda_cab TO sagnus_app;


--
-- TOC entry 10063 (class 0 OID 0)
-- Dependencies: 679
-- Name: TABLE com_vend_pdv_venda_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pdv_venda_cab TO sagnus_app;


--
-- TOC entry 10064 (class 0 OID 0)
-- Dependencies: 654
-- Name: SEQUENCE seq_vend_pdv_venda_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pdv_venda_det TO sagnus_app;


--
-- TOC entry 10065 (class 0 OID 0)
-- Dependencies: 680
-- Name: TABLE com_vend_pdv_venda_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pdv_venda_det TO sagnus_app;


--
-- TOC entry 10066 (class 0 OID 0)
-- Dependencies: 771
-- Name: TABLE com_vend_pedido; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pedido TO sagnus_app;


--
-- TOC entry 10068 (class 0 OID 0)
-- Dependencies: 770
-- Name: SEQUENCE com_vend_pedido_id_seq; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.com_vend_pedido_id_seq TO sagnus_app;


--
-- TOC entry 10069 (class 0 OID 0)
-- Dependencies: 655
-- Name: SEQUENCE seq_vend_pre_venda_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pre_venda_cab TO sagnus_app;


--
-- TOC entry 10070 (class 0 OID 0)
-- Dependencies: 681
-- Name: TABLE com_vend_pre_venda_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pre_venda_cab TO sagnus_app;


--
-- TOC entry 10071 (class 0 OID 0)
-- Dependencies: 656
-- Name: SEQUENCE seq_vend_pre_venda_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_pre_venda_det TO sagnus_app;


--
-- TOC entry 10072 (class 0 OID 0)
-- Dependencies: 682
-- Name: TABLE com_vend_pre_venda_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_pre_venda_det TO sagnus_app;


--
-- TOC entry 10073 (class 0 OID 0)
-- Dependencies: 657
-- Name: SEQUENCE seq_vend_produto_promocao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_produto_promocao TO sagnus_app;


--
-- TOC entry 10074 (class 0 OID 0)
-- Dependencies: 683
-- Name: TABLE com_vend_produto_promocao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_produto_promocao TO sagnus_app;


--
-- TOC entry 10075 (class 0 OID 0)
-- Dependencies: 658
-- Name: SEQUENCE seq_vend_tabela_preco; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_tabela_preco TO sagnus_app;


--
-- TOC entry 10076 (class 0 OID 0)
-- Dependencies: 684
-- Name: TABLE com_vend_tabela_preco; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_tabela_preco TO sagnus_app;


--
-- TOC entry 10077 (class 0 OID 0)
-- Dependencies: 659
-- Name: SEQUENCE seq_vend_tabela_preco_produto; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_vend_tabela_preco_produto TO sagnus_app;


--
-- TOC entry 10078 (class 0 OID 0)
-- Dependencies: 685
-- Name: TABLE com_vend_tabela_preco_produto; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.com_vend_tabela_preco_produto TO sagnus_app;


--
-- TOC entry 10079 (class 0 OID 0)
-- Dependencies: 457
-- Name: SEQUENCE seq_corp_cargo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_cargo TO sagnus_app;


--
-- TOC entry 10080 (class 0 OID 0)
-- Dependencies: 501
-- Name: TABLE corp_cargo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_cargo TO sagnus_app;


--
-- TOC entry 10081 (class 0 OID 0)
-- Dependencies: 458
-- Name: SEQUENCE seq_corp_cep; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_cep TO sagnus_app;


--
-- TOC entry 10082 (class 0 OID 0)
-- Dependencies: 502
-- Name: TABLE corp_cep; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_cep TO sagnus_app;


--
-- TOC entry 10083 (class 0 OID 0)
-- Dependencies: 459
-- Name: SEQUENCE seq_corp_cliente; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_cliente TO sagnus_app;


--
-- TOC entry 10084 (class 0 OID 0)
-- Dependencies: 503
-- Name: TABLE corp_cliente; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_cliente TO sagnus_app;


--
-- TOC entry 10085 (class 0 OID 0)
-- Dependencies: 460
-- Name: SEQUENCE seq_corp_cnae; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_cnae TO sagnus_app;


--
-- TOC entry 10086 (class 0 OID 0)
-- Dependencies: 504
-- Name: TABLE corp_cnae; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_cnae TO sagnus_app;


--
-- TOC entry 10087 (class 0 OID 0)
-- Dependencies: 461
-- Name: SEQUENCE seq_corp_colaborador; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_colaborador TO sagnus_app;


--
-- TOC entry 10088 (class 0 OID 0)
-- Dependencies: 505
-- Name: TABLE corp_colaborador; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_colaborador TO sagnus_app;


--
-- TOC entry 10089 (class 0 OID 0)
-- Dependencies: 462
-- Name: SEQUENCE seq_corp_colaborador_relacionamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_colaborador_relacionamento TO sagnus_app;


--
-- TOC entry 10090 (class 0 OID 0)
-- Dependencies: 506
-- Name: TABLE corp_colaborador_relacionamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_colaborador_relacionamento TO sagnus_app;


--
-- TOC entry 10091 (class 0 OID 0)
-- Dependencies: 463
-- Name: SEQUENCE seq_corp_colaborador_situacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_colaborador_situacao TO sagnus_app;


--
-- TOC entry 10092 (class 0 OID 0)
-- Dependencies: 507
-- Name: TABLE corp_colaborador_situacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_colaborador_situacao TO sagnus_app;


--
-- TOC entry 10093 (class 0 OID 0)
-- Dependencies: 464
-- Name: SEQUENCE seq_corp_colaborador_tipo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_colaborador_tipo TO sagnus_app;


--
-- TOC entry 10094 (class 0 OID 0)
-- Dependencies: 508
-- Name: TABLE corp_colaborador_tipo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_colaborador_tipo TO sagnus_app;


--
-- TOC entry 10095 (class 0 OID 0)
-- Dependencies: 465
-- Name: SEQUENCE seq_corp_comissao_perfil; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_comissao_perfil TO sagnus_app;


--
-- TOC entry 10096 (class 0 OID 0)
-- Dependencies: 509
-- Name: TABLE corp_comissao_perfil; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_comissao_perfil TO sagnus_app;


--
-- TOC entry 10097 (class 0 OID 0)
-- Dependencies: 466
-- Name: SEQUENCE seq_corp_empresa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_empresa TO sagnus_app;


--
-- TOC entry 10098 (class 0 OID 0)
-- Dependencies: 510
-- Name: TABLE corp_empresa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_empresa TO sagnus_app;


--
-- TOC entry 10099 (class 0 OID 0)
-- Dependencies: 467
-- Name: SEQUENCE seq_corp_empresa_cnae; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_empresa_cnae TO sagnus_app;


--
-- TOC entry 10100 (class 0 OID 0)
-- Dependencies: 511
-- Name: TABLE corp_empresa_cnae; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_empresa_cnae TO sagnus_app;


--
-- TOC entry 10101 (class 0 OID 0)
-- Dependencies: 468
-- Name: SEQUENCE seq_corp_empresa_contato; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_empresa_contato TO sagnus_app;


--
-- TOC entry 10102 (class 0 OID 0)
-- Dependencies: 512
-- Name: TABLE corp_empresa_contato; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_empresa_contato TO sagnus_app;


--
-- TOC entry 10103 (class 0 OID 0)
-- Dependencies: 469
-- Name: SEQUENCE seq_corp_empresa_endereco; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_empresa_endereco TO sagnus_app;


--
-- TOC entry 10104 (class 0 OID 0)
-- Dependencies: 513
-- Name: TABLE corp_empresa_endereco; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_empresa_endereco TO sagnus_app;


--
-- TOC entry 10105 (class 0 OID 0)
-- Dependencies: 470
-- Name: SEQUENCE seq_corp_empresa_telefone; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_empresa_telefone TO sagnus_app;


--
-- TOC entry 10106 (class 0 OID 0)
-- Dependencies: 514
-- Name: TABLE corp_empresa_telefone; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_empresa_telefone TO sagnus_app;


--
-- TOC entry 10107 (class 0 OID 0)
-- Dependencies: 471
-- Name: SEQUENCE seq_corp_empresa_transporte; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_empresa_transporte TO sagnus_app;


--
-- TOC entry 10108 (class 0 OID 0)
-- Dependencies: 515
-- Name: TABLE corp_empresa_transporte; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_empresa_transporte TO sagnus_app;


--
-- TOC entry 10109 (class 0 OID 0)
-- Dependencies: 472
-- Name: SEQUENCE seq_corp_empresa_transporte_itinerario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_empresa_transporte_itinerario TO sagnus_app;


--
-- TOC entry 10110 (class 0 OID 0)
-- Dependencies: 516
-- Name: TABLE corp_empresa_transporte_itinerario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_empresa_transporte_itinerario TO sagnus_app;


--
-- TOC entry 10111 (class 0 OID 0)
-- Dependencies: 473
-- Name: SEQUENCE seq_corp_estado_civil; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_estado_civil TO sagnus_app;


--
-- TOC entry 10112 (class 0 OID 0)
-- Dependencies: 517
-- Name: TABLE corp_estado_civil; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_estado_civil TO sagnus_app;


--
-- TOC entry 10113 (class 0 OID 0)
-- Dependencies: 474
-- Name: SEQUENCE seq_corp_fornecedor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_fornecedor TO sagnus_app;


--
-- TOC entry 10114 (class 0 OID 0)
-- Dependencies: 518
-- Name: TABLE corp_fornecedor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_fornecedor TO sagnus_app;


--
-- TOC entry 10115 (class 0 OID 0)
-- Dependencies: 638
-- Name: SEQUENCE seq_corp_municipio; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_municipio TO sagnus_app;


--
-- TOC entry 10116 (class 0 OID 0)
-- Dependencies: 641
-- Name: TABLE corp_municipio; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_municipio TO sagnus_app;


--
-- TOC entry 10117 (class 0 OID 0)
-- Dependencies: 475
-- Name: SEQUENCE seq_corp_ncm; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_ncm TO sagnus_app;


--
-- TOC entry 10118 (class 0 OID 0)
-- Dependencies: 519
-- Name: TABLE corp_ncm; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_ncm TO sagnus_app;


--
-- TOC entry 10119 (class 0 OID 0)
-- Dependencies: 476
-- Name: SEQUENCE seq_corp_pessoa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_pessoa TO sagnus_app;


--
-- TOC entry 10120 (class 0 OID 0)
-- Dependencies: 520
-- Name: TABLE corp_pessoa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_pessoa TO sagnus_app;


--
-- TOC entry 10121 (class 0 OID 0)
-- Dependencies: 477
-- Name: SEQUENCE seq_corp_pessoa_alteracao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_pessoa_alteracao TO sagnus_app;


--
-- TOC entry 10122 (class 0 OID 0)
-- Dependencies: 521
-- Name: TABLE corp_pessoa_alteracao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_pessoa_alteracao TO sagnus_app;


--
-- TOC entry 10123 (class 0 OID 0)
-- Dependencies: 478
-- Name: SEQUENCE seq_corp_pessoa_contato; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_pessoa_contato TO sagnus_app;


--
-- TOC entry 10124 (class 0 OID 0)
-- Dependencies: 522
-- Name: TABLE corp_pessoa_contato; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_pessoa_contato TO sagnus_app;


--
-- TOC entry 10125 (class 0 OID 0)
-- Dependencies: 479
-- Name: SEQUENCE seq_corp_pessoa_endereco; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_pessoa_endereco TO sagnus_app;


--
-- TOC entry 10126 (class 0 OID 0)
-- Dependencies: 523
-- Name: TABLE corp_pessoa_endereco; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_pessoa_endereco TO sagnus_app;


--
-- TOC entry 10127 (class 0 OID 0)
-- Dependencies: 480
-- Name: SEQUENCE seq_corp_pessoa_fisica; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_pessoa_fisica TO sagnus_app;


--
-- TOC entry 10128 (class 0 OID 0)
-- Dependencies: 524
-- Name: TABLE corp_pessoa_fisica; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_pessoa_fisica TO sagnus_app;


--
-- TOC entry 10129 (class 0 OID 0)
-- Dependencies: 481
-- Name: SEQUENCE seq_corp_pessoa_juridica; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_pessoa_juridica TO sagnus_app;


--
-- TOC entry 10130 (class 0 OID 0)
-- Dependencies: 525
-- Name: TABLE corp_pessoa_juridica; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_pessoa_juridica TO sagnus_app;


--
-- TOC entry 10131 (class 0 OID 0)
-- Dependencies: 762
-- Name: TABLE corp_pessoa_papel; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_pessoa_papel TO sagnus_app;


--
-- TOC entry 10132 (class 0 OID 0)
-- Dependencies: 482
-- Name: SEQUENCE seq_corp_pessoa_telefone; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_pessoa_telefone TO sagnus_app;


--
-- TOC entry 10133 (class 0 OID 0)
-- Dependencies: 526
-- Name: TABLE corp_pessoa_telefone; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_pessoa_telefone TO sagnus_app;


--
-- TOC entry 10134 (class 0 OID 0)
-- Dependencies: 483
-- Name: SEQUENCE seq_corp_produto; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_produto TO sagnus_app;


--
-- TOC entry 10135 (class 0 OID 0)
-- Dependencies: 527
-- Name: TABLE corp_produto; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_produto TO sagnus_app;


--
-- TOC entry 10136 (class 0 OID 0)
-- Dependencies: 484
-- Name: SEQUENCE seq_corp_produto_alteracao_item; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_produto_alteracao_item TO sagnus_app;


--
-- TOC entry 10137 (class 0 OID 0)
-- Dependencies: 528
-- Name: TABLE corp_produto_alteracao_item; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_produto_alteracao_item TO sagnus_app;


--
-- TOC entry 10138 (class 0 OID 0)
-- Dependencies: 485
-- Name: SEQUENCE seq_corp_produto_codigo_adicional; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_produto_codigo_adicional TO sagnus_app;


--
-- TOC entry 10139 (class 0 OID 0)
-- Dependencies: 529
-- Name: TABLE corp_produto_codigo_adicional; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_produto_codigo_adicional TO sagnus_app;


--
-- TOC entry 10140 (class 0 OID 0)
-- Dependencies: 486
-- Name: SEQUENCE seq_corp_produto_ficha_tecnica; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_produto_ficha_tecnica TO sagnus_app;


--
-- TOC entry 10141 (class 0 OID 0)
-- Dependencies: 530
-- Name: TABLE corp_produto_ficha_tecnica; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_produto_ficha_tecnica TO sagnus_app;


--
-- TOC entry 10142 (class 0 OID 0)
-- Dependencies: 487
-- Name: SEQUENCE seq_corp_produto_grupo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_produto_grupo TO sagnus_app;


--
-- TOC entry 10143 (class 0 OID 0)
-- Dependencies: 531
-- Name: TABLE corp_produto_grupo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_produto_grupo TO sagnus_app;


--
-- TOC entry 10144 (class 0 OID 0)
-- Dependencies: 488
-- Name: SEQUENCE seq_corp_produto_marca; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_produto_marca TO sagnus_app;


--
-- TOC entry 10145 (class 0 OID 0)
-- Dependencies: 532
-- Name: TABLE corp_produto_marca; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_produto_marca TO sagnus_app;


--
-- TOC entry 10146 (class 0 OID 0)
-- Dependencies: 489
-- Name: SEQUENCE seq_corp_produto_promocao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_produto_promocao TO sagnus_app;


--
-- TOC entry 10147 (class 0 OID 0)
-- Dependencies: 533
-- Name: TABLE corp_produto_promocao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_produto_promocao TO sagnus_app;


--
-- TOC entry 10148 (class 0 OID 0)
-- Dependencies: 490
-- Name: SEQUENCE seq_corp_produto_subgrupo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_produto_subgrupo TO sagnus_app;


--
-- TOC entry 10149 (class 0 OID 0)
-- Dependencies: 534
-- Name: TABLE corp_produto_subgrupo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_produto_subgrupo TO sagnus_app;


--
-- TOC entry 10150 (class 0 OID 0)
-- Dependencies: 491
-- Name: SEQUENCE seq_corp_produto_unidade; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_produto_unidade TO sagnus_app;


--
-- TOC entry 10151 (class 0 OID 0)
-- Dependencies: 535
-- Name: TABLE corp_produto_unidade; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_produto_unidade TO sagnus_app;


--
-- TOC entry 10152 (class 0 OID 0)
-- Dependencies: 492
-- Name: SEQUENCE seq_corp_setor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_setor TO sagnus_app;


--
-- TOC entry 10153 (class 0 OID 0)
-- Dependencies: 536
-- Name: TABLE corp_setor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_setor TO sagnus_app;


--
-- TOC entry 10154 (class 0 OID 0)
-- Dependencies: 493
-- Name: SEQUENCE seq_corp_sindicato; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_sindicato TO sagnus_app;


--
-- TOC entry 10155 (class 0 OID 0)
-- Dependencies: 537
-- Name: TABLE corp_sindicato; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_sindicato TO sagnus_app;


--
-- TOC entry 10156 (class 0 OID 0)
-- Dependencies: 494
-- Name: SEQUENCE seq_corp_tabela_preco; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_tabela_preco TO sagnus_app;


--
-- TOC entry 10157 (class 0 OID 0)
-- Dependencies: 538
-- Name: TABLE corp_tabela_preco; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_tabela_preco TO sagnus_app;


--
-- TOC entry 10158 (class 0 OID 0)
-- Dependencies: 495
-- Name: SEQUENCE seq_corp_tipo_admissao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_tipo_admissao TO sagnus_app;


--
-- TOC entry 10159 (class 0 OID 0)
-- Dependencies: 539
-- Name: TABLE corp_tipo_admissao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_tipo_admissao TO sagnus_app;


--
-- TOC entry 10160 (class 0 OID 0)
-- Dependencies: 496
-- Name: SEQUENCE seq_corp_tipo_relacionamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_tipo_relacionamento TO sagnus_app;


--
-- TOC entry 10161 (class 0 OID 0)
-- Dependencies: 540
-- Name: TABLE corp_tipo_relacionamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_tipo_relacionamento TO sagnus_app;


--
-- TOC entry 10162 (class 0 OID 0)
-- Dependencies: 497
-- Name: SEQUENCE seq_corp_transportadora; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_transportadora TO sagnus_app;


--
-- TOC entry 10163 (class 0 OID 0)
-- Dependencies: 541
-- Name: TABLE corp_transportadora; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_transportadora TO sagnus_app;


--
-- TOC entry 10164 (class 0 OID 0)
-- Dependencies: 594
-- Name: SEQUENCE seq_corp_uf; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_uf TO sagnus_app;


--
-- TOC entry 10165 (class 0 OID 0)
-- Dependencies: 640
-- Name: TABLE corp_uf; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_uf TO sagnus_app;


--
-- TOC entry 10166 (class 0 OID 0)
-- Dependencies: 500
-- Name: SEQUENCE seq_corp_vendedor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_vendedor TO sagnus_app;


--
-- TOC entry 10167 (class 0 OID 0)
-- Dependencies: 544
-- Name: TABLE corp_vendedor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.corp_vendedor TO sagnus_app;


--
-- TOC entry 10168 (class 0 OID 0)
-- Dependencies: 722
-- Name: SEQUENCE seq_ctbl_conta; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_conta TO sagnus_app;


--
-- TOC entry 10169 (class 0 OID 0)
-- Dependencies: 742
-- Name: TABLE ctbl_conta; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_conta TO sagnus_app;


--
-- TOC entry 10170 (class 0 OID 0)
-- Dependencies: 723
-- Name: SEQUENCE seq_ctbl_conta_rateio; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_conta_rateio TO sagnus_app;


--
-- TOC entry 10171 (class 0 OID 0)
-- Dependencies: 743
-- Name: TABLE ctbl_conta_rateio; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_conta_rateio TO sagnus_app;


--
-- TOC entry 10172 (class 0 OID 0)
-- Dependencies: 724
-- Name: SEQUENCE seq_ctbl_dre_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_dre_cab TO sagnus_app;


--
-- TOC entry 10173 (class 0 OID 0)
-- Dependencies: 744
-- Name: TABLE ctbl_dre_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_dre_cab TO sagnus_app;


--
-- TOC entry 10174 (class 0 OID 0)
-- Dependencies: 725
-- Name: SEQUENCE seq_ctbl_dre_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_dre_det TO sagnus_app;


--
-- TOC entry 10175 (class 0 OID 0)
-- Dependencies: 745
-- Name: TABLE ctbl_dre_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_dre_det TO sagnus_app;


--
-- TOC entry 10176 (class 0 OID 0)
-- Dependencies: 726
-- Name: SEQUENCE seq_ctbl_encerramento_exe_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_encerramento_exe_cab TO sagnus_app;


--
-- TOC entry 10177 (class 0 OID 0)
-- Dependencies: 746
-- Name: TABLE ctbl_encerramento_exe_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_encerramento_exe_cab TO sagnus_app;


--
-- TOC entry 10178 (class 0 OID 0)
-- Dependencies: 727
-- Name: SEQUENCE seq_ctbl_encerramento_exe_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_encerramento_exe_det TO sagnus_app;


--
-- TOC entry 10179 (class 0 OID 0)
-- Dependencies: 747
-- Name: TABLE ctbl_encerramento_exe_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_encerramento_exe_det TO sagnus_app;


--
-- TOC entry 10180 (class 0 OID 0)
-- Dependencies: 728
-- Name: SEQUENCE seq_ctbl_fechamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_fechamento TO sagnus_app;


--
-- TOC entry 10181 (class 0 OID 0)
-- Dependencies: 748
-- Name: TABLE ctbl_fechamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_fechamento TO sagnus_app;


--
-- TOC entry 10182 (class 0 OID 0)
-- Dependencies: 729
-- Name: SEQUENCE seq_ctbl_historico; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_historico TO sagnus_app;


--
-- TOC entry 10183 (class 0 OID 0)
-- Dependencies: 749
-- Name: TABLE ctbl_historico; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_historico TO sagnus_app;


--
-- TOC entry 10184 (class 0 OID 0)
-- Dependencies: 730
-- Name: SEQUENCE seq_ctbl_indice; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_indice TO sagnus_app;


--
-- TOC entry 10185 (class 0 OID 0)
-- Dependencies: 750
-- Name: TABLE ctbl_indice; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_indice TO sagnus_app;


--
-- TOC entry 10186 (class 0 OID 0)
-- Dependencies: 731
-- Name: SEQUENCE seq_ctbl_indice_valor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_indice_valor TO sagnus_app;


--
-- TOC entry 10187 (class 0 OID 0)
-- Dependencies: 751
-- Name: TABLE ctbl_indice_valor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_indice_valor TO sagnus_app;


--
-- TOC entry 10188 (class 0 OID 0)
-- Dependencies: 732
-- Name: SEQUENCE seq_ctbl_lancamento_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_lancamento_cab TO sagnus_app;


--
-- TOC entry 10189 (class 0 OID 0)
-- Dependencies: 752
-- Name: TABLE ctbl_lancamento_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_lancamento_cab TO sagnus_app;


--
-- TOC entry 10190 (class 0 OID 0)
-- Dependencies: 733
-- Name: SEQUENCE seq_ctbl_lancamento_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_lancamento_det TO sagnus_app;


--
-- TOC entry 10191 (class 0 OID 0)
-- Dependencies: 753
-- Name: TABLE ctbl_lancamento_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_lancamento_det TO sagnus_app;


--
-- TOC entry 10192 (class 0 OID 0)
-- Dependencies: 734
-- Name: SEQUENCE seq_ctbl_lancamento_orcado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_lancamento_orcado TO sagnus_app;


--
-- TOC entry 10193 (class 0 OID 0)
-- Dependencies: 754
-- Name: TABLE ctbl_lancamento_orcado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_lancamento_orcado TO sagnus_app;


--
-- TOC entry 10194 (class 0 OID 0)
-- Dependencies: 735
-- Name: SEQUENCE seq_ctbl_lancamento_padrao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_lancamento_padrao TO sagnus_app;


--
-- TOC entry 10195 (class 0 OID 0)
-- Dependencies: 755
-- Name: TABLE ctbl_lancamento_padrao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_lancamento_padrao TO sagnus_app;


--
-- TOC entry 10196 (class 0 OID 0)
-- Dependencies: 736
-- Name: SEQUENCE seq_ctbl_livro; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_livro TO sagnus_app;


--
-- TOC entry 10197 (class 0 OID 0)
-- Dependencies: 756
-- Name: TABLE ctbl_livro; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_livro TO sagnus_app;


--
-- TOC entry 10198 (class 0 OID 0)
-- Dependencies: 737
-- Name: SEQUENCE seq_ctbl_lote; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_lote TO sagnus_app;


--
-- TOC entry 10199 (class 0 OID 0)
-- Dependencies: 757
-- Name: TABLE ctbl_lote; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_lote TO sagnus_app;


--
-- TOC entry 10200 (class 0 OID 0)
-- Dependencies: 738
-- Name: SEQUENCE seq_ctbl_parametro; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_parametro TO sagnus_app;


--
-- TOC entry 10201 (class 0 OID 0)
-- Dependencies: 758
-- Name: TABLE ctbl_parametro; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_parametro TO sagnus_app;


--
-- TOC entry 10202 (class 0 OID 0)
-- Dependencies: 603
-- Name: SEQUENCE seq_ctbl_patrim_estado_conservacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_patrim_estado_conservacao TO sagnus_app;


--
-- TOC entry 10203 (class 0 OID 0)
-- Dependencies: 617
-- Name: TABLE ctbl_patrim_estado_conservacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_patrim_estado_conservacao TO sagnus_app;


--
-- TOC entry 10204 (class 0 OID 0)
-- Dependencies: 604
-- Name: SEQUENCE seq_ctbl_patrim_indice_atualizacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_patrim_indice_atualizacao TO sagnus_app;


--
-- TOC entry 10205 (class 0 OID 0)
-- Dependencies: 618
-- Name: TABLE ctbl_patrim_indice_atualizacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_patrim_indice_atualizacao TO sagnus_app;


--
-- TOC entry 10206 (class 0 OID 0)
-- Dependencies: 740
-- Name: SEQUENCE seq_ctbl_plano_conta; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_plano_conta TO sagnus_app;


--
-- TOC entry 10207 (class 0 OID 0)
-- Dependencies: 760
-- Name: TABLE ctbl_plano_conta; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_plano_conta TO sagnus_app;


--
-- TOC entry 10208 (class 0 OID 0)
-- Dependencies: 741
-- Name: SEQUENCE seq_ctbl_plano_conta_ref_sped; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_plano_conta_ref_sped TO sagnus_app;


--
-- TOC entry 10209 (class 0 OID 0)
-- Dependencies: 761
-- Name: TABLE ctbl_plano_conta_ref_sped; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_plano_conta_ref_sped TO sagnus_app;


--
-- TOC entry 10210 (class 0 OID 0)
-- Dependencies: 739
-- Name: SEQUENCE seq_ctbl_termo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_ctbl_termo TO sagnus_app;


--
-- TOC entry 10211 (class 0 OID 0)
-- Dependencies: 759
-- Name: TABLE ctbl_termo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctbl_termo TO sagnus_app;


--
-- TOC entry 10212 (class 0 OID 0)
-- Dependencies: 605
-- Name: SEQUENCE seq_com_ctrs_tipo_servico; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_com_ctrs_tipo_servico TO sagnus_app;


--
-- TOC entry 10213 (class 0 OID 0)
-- Dependencies: 619
-- Name: TABLE ctrs_tipo_servico; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.ctrs_tipo_servico TO sagnus_app;


--
-- TOC entry 10214 (class 0 OID 0)
-- Dependencies: 249
-- Name: SEQUENCE seq_fina_cad_doc_origem; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cad_doc_origem TO sagnus_app;


--
-- TOC entry 10215 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE fina_cad_doc_origem; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cad_doc_origem TO sagnus_app;


--
-- TOC entry 10216 (class 0 OID 0)
-- Dependencies: 247
-- Name: SEQUENCE seq_fina_cad_nat_financeira; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cad_nat_financeira TO sagnus_app;


--
-- TOC entry 10217 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE fina_cad_nat_financeira; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cad_nat_financeira TO sagnus_app;


--
-- TOC entry 10218 (class 0 OID 0)
-- Dependencies: 251
-- Name: SEQUENCE seq_fina_cad_status_parcela; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cad_status_parcela TO sagnus_app;


--
-- TOC entry 10219 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE fina_cad_status_parcela; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cad_status_parcela TO sagnus_app;


--
-- TOC entry 10220 (class 0 OID 0)
-- Dependencies: 253
-- Name: SEQUENCE seq_fina_cad_tipo_pagto; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cad_tipo_pagto TO sagnus_app;


--
-- TOC entry 10221 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE fina_cad_tipo_pagto; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cad_tipo_pagto TO sagnus_app;


--
-- TOC entry 10222 (class 0 OID 0)
-- Dependencies: 255
-- Name: SEQUENCE seq_fina_cad_tipo_receb; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cad_tipo_receb TO sagnus_app;


--
-- TOC entry 10223 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE fina_cad_tipo_receb; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cad_tipo_receb TO sagnus_app;


--
-- TOC entry 10224 (class 0 OID 0)
-- Dependencies: 263
-- Name: SEQUENCE seq_fina_cap_lancamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cap_lancamento TO sagnus_app;


--
-- TOC entry 10225 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE fina_cap_lancamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cap_lancamento TO sagnus_app;


--
-- TOC entry 10226 (class 0 OID 0)
-- Dependencies: 265
-- Name: SEQUENCE seq_fina_cap_parcela; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cap_parcela TO sagnus_app;


--
-- TOC entry 10227 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE fina_cap_parcela; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cap_parcela TO sagnus_app;


--
-- TOC entry 10228 (class 0 OID 0)
-- Dependencies: 267
-- Name: SEQUENCE seq_fina_car_lancamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_car_lancamento TO sagnus_app;


--
-- TOC entry 10229 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE fina_car_lancamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_car_lancamento TO sagnus_app;


--
-- TOC entry 10230 (class 0 OID 0)
-- Dependencies: 269
-- Name: SEQUENCE seq_fina_car_parcela; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_car_parcela TO sagnus_app;


--
-- TOC entry 10231 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE fina_car_parcela; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_car_parcela TO sagnus_app;


--
-- TOC entry 10232 (class 0 OID 0)
-- Dependencies: 277
-- Name: SEQUENCE seq_fina_cbk_conc; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cbk_conc TO sagnus_app;


--
-- TOC entry 10233 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE fina_cbk_conc; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cbk_conc TO sagnus_app;


--
-- TOC entry 10234 (class 0 OID 0)
-- Dependencies: 279
-- Name: SEQUENCE seq_fina_cbk_conc_item; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cbk_conc_item TO sagnus_app;


--
-- TOC entry 10235 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE fina_cbk_conc_item; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cbk_conc_item TO sagnus_app;


--
-- TOC entry 10236 (class 0 OID 0)
-- Dependencies: 257
-- Name: SEQUENCE seq_fina_cxb_banco; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cxb_banco TO sagnus_app;


--
-- TOC entry 10237 (class 0 OID 0)
-- Dependencies: 258
-- Name: TABLE fina_cxb_banco; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cxb_banco TO sagnus_app;


--
-- TOC entry 10238 (class 0 OID 0)
-- Dependencies: 259
-- Name: SEQUENCE seq_fina_cxb_banco_ag; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cxb_banco_ag TO sagnus_app;


--
-- TOC entry 10239 (class 0 OID 0)
-- Dependencies: 260
-- Name: TABLE fina_cxb_banco_agencia; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cxb_banco_agencia TO sagnus_app;


--
-- TOC entry 10240 (class 0 OID 0)
-- Dependencies: 261
-- Name: SEQUENCE seq_fina_cxb_conta_caixa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cxb_conta_caixa TO sagnus_app;


--
-- TOC entry 10241 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE fina_cxb_conta_caixa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cxb_conta_caixa TO sagnus_app;


--
-- TOC entry 10242 (class 0 OID 0)
-- Dependencies: 275
-- Name: SEQUENCE seq_fina_cxb_extrato; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_cxb_extrato TO sagnus_app;


--
-- TOC entry 10243 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE fina_cxb_extrato; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_cxb_extrato TO sagnus_app;


--
-- TOC entry 10244 (class 0 OID 0)
-- Dependencies: 271
-- Name: SEQUENCE seq_fina_edi_arquivo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_edi_arquivo TO sagnus_app;


--
-- TOC entry 10245 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE fina_edi_arquivo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_edi_arquivo TO sagnus_app;


--
-- TOC entry 10246 (class 0 OID 0)
-- Dependencies: 273
-- Name: SEQUENCE seq_fina_edi_linha; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_edi_linha TO sagnus_app;


--
-- TOC entry 10247 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE fina_edi_linha; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_edi_linha TO sagnus_app;


--
-- TOC entry 10248 (class 0 OID 0)
-- Dependencies: 289
-- Name: SEQUENCE seq_fina_fcx_previsto; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_fcx_previsto TO sagnus_app;


--
-- TOC entry 10249 (class 0 OID 0)
-- Dependencies: 290
-- Name: TABLE fina_fcx_previsto; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_fcx_previsto TO sagnus_app;


--
-- TOC entry 10250 (class 0 OID 0)
-- Dependencies: 291
-- Name: SEQUENCE seq_fina_fcx_saldo_diario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_fcx_saldo_diario TO sagnus_app;


--
-- TOC entry 10251 (class 0 OID 0)
-- Dependencies: 292
-- Name: TABLE fina_fcx_saldo_diario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_fcx_saldo_diario TO sagnus_app;


--
-- TOC entry 10252 (class 0 OID 0)
-- Dependencies: 773
-- Name: TABLE fina_plano_contas; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_plano_contas TO sagnus_app;


--
-- TOC entry 10254 (class 0 OID 0)
-- Dependencies: 772
-- Name: SEQUENCE fina_plano_contas_id_seq; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.fina_plano_contas_id_seq TO sagnus_app;


--
-- TOC entry 10255 (class 0 OID 0)
-- Dependencies: 285
-- Name: SEQUENCE seq_fina_tes_aplicacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_tes_aplicacao TO sagnus_app;


--
-- TOC entry 10256 (class 0 OID 0)
-- Dependencies: 286
-- Name: TABLE fina_tes_aplicacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_tes_aplicacao TO sagnus_app;


--
-- TOC entry 10257 (class 0 OID 0)
-- Dependencies: 281
-- Name: SEQUENCE seq_fina_tes_movimento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_tes_movimento TO sagnus_app;


--
-- TOC entry 10258 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE fina_tes_movimento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_tes_movimento TO sagnus_app;


--
-- TOC entry 10259 (class 0 OID 0)
-- Dependencies: 287
-- Name: SEQUENCE seq_fina_tes_resgate; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_tes_resgate TO sagnus_app;


--
-- TOC entry 10260 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE fina_tes_resgate; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_tes_resgate TO sagnus_app;


--
-- TOC entry 10261 (class 0 OID 0)
-- Dependencies: 283
-- Name: SEQUENCE seq_fina_tes_transferencia; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fina_tes_transferencia TO sagnus_app;


--
-- TOC entry 10262 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE fina_tes_transferencia; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_tes_transferencia TO sagnus_app;


--
-- TOC entry 10263 (class 0 OID 0)
-- Dependencies: 775
-- Name: TABLE fina_titulo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fina_titulo TO sagnus_app;


--
-- TOC entry 10265 (class 0 OID 0)
-- Dependencies: 774
-- Name: SEQUENCE fina_titulo_id_seq; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.fina_titulo_id_seq TO sagnus_app;


--
-- TOC entry 10266 (class 0 OID 0)
-- Dependencies: 232
-- Name: SEQUENCE seq_fisc_aidf_aimdf; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_aidf_aimdf TO sagnus_app;


--
-- TOC entry 10267 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE fisc_aidf_aimdf; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_aidf_aimdf TO sagnus_app;


--
-- TOC entry 10268 (class 0 OID 0)
-- Dependencies: 592
-- Name: SEQUENCE seq_fisc_cfop; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cfop TO sagnus_app;


--
-- TOC entry 10269 (class 0 OID 0)
-- Dependencies: 607
-- Name: TABLE fisc_cfop; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cfop TO sagnus_app;


--
-- TOC entry 10270 (class 0 OID 0)
-- Dependencies: 593
-- Name: SEQUENCE seq_fisc_csosn; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_csosn TO sagnus_app;


--
-- TOC entry 10271 (class 0 OID 0)
-- Dependencies: 608
-- Name: TABLE fisc_csosn; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_csosn TO sagnus_app;


--
-- TOC entry 10272 (class 0 OID 0)
-- Dependencies: 595
-- Name: SEQUENCE seq_fisc_cst_cofins; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cst_cofins TO sagnus_app;


--
-- TOC entry 10273 (class 0 OID 0)
-- Dependencies: 609
-- Name: TABLE fisc_cst_cofins; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cst_cofins TO sagnus_app;


--
-- TOC entry 10274 (class 0 OID 0)
-- Dependencies: 596
-- Name: SEQUENCE seq_fisc_cst_icms; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cst_icms TO sagnus_app;


--
-- TOC entry 10275 (class 0 OID 0)
-- Dependencies: 610
-- Name: TABLE fisc_cst_icms; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cst_icms TO sagnus_app;


--
-- TOC entry 10276 (class 0 OID 0)
-- Dependencies: 597
-- Name: SEQUENCE seq_fisc_cst_ipi; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cst_ipi TO sagnus_app;


--
-- TOC entry 10277 (class 0 OID 0)
-- Dependencies: 611
-- Name: TABLE fisc_cst_ipi; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cst_ipi TO sagnus_app;


--
-- TOC entry 10278 (class 0 OID 0)
-- Dependencies: 598
-- Name: SEQUENCE seq_fisc_cst_pis; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cst_pis TO sagnus_app;


--
-- TOC entry 10279 (class 0 OID 0)
-- Dependencies: 612
-- Name: TABLE fisc_cst_pis; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cst_pis TO sagnus_app;


--
-- TOC entry 10280 (class 0 OID 0)
-- Dependencies: 383
-- Name: SEQUENCE seq_fisc_cte_aereo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_aereo TO sagnus_app;


--
-- TOC entry 10281 (class 0 OID 0)
-- Dependencies: 384
-- Name: TABLE fisc_cte_aereo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_aereo TO sagnus_app;


--
-- TOC entry 10282 (class 0 OID 0)
-- Dependencies: 385
-- Name: SEQUENCE seq_fisc_cte_aquaviario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_aquaviario TO sagnus_app;


--
-- TOC entry 10283 (class 0 OID 0)
-- Dependencies: 386
-- Name: TABLE fisc_cte_aquaviario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_aquaviario TO sagnus_app;


--
-- TOC entry 10284 (class 0 OID 0)
-- Dependencies: 387
-- Name: SEQUENCE seq_fisc_cte_aquaviario_balsa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_aquaviario_balsa TO sagnus_app;


--
-- TOC entry 10285 (class 0 OID 0)
-- Dependencies: 388
-- Name: TABLE fisc_cte_aquaviario_balsa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_aquaviario_balsa TO sagnus_app;


--
-- TOC entry 10286 (class 0 OID 0)
-- Dependencies: 381
-- Name: SEQUENCE seq_fisc_cte_cabecalho; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_cabecalho TO sagnus_app;


--
-- TOC entry 10287 (class 0 OID 0)
-- Dependencies: 382
-- Name: TABLE fisc_cte_cabecalho; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_cabecalho TO sagnus_app;


--
-- TOC entry 10288 (class 0 OID 0)
-- Dependencies: 389
-- Name: SEQUENCE seq_fisc_cte_carga; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_carga TO sagnus_app;


--
-- TOC entry 10289 (class 0 OID 0)
-- Dependencies: 390
-- Name: TABLE fisc_cte_carga; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_carga TO sagnus_app;


--
-- TOC entry 10290 (class 0 OID 0)
-- Dependencies: 391
-- Name: SEQUENCE seq_fisc_cte_componente; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_componente TO sagnus_app;


--
-- TOC entry 10291 (class 0 OID 0)
-- Dependencies: 392
-- Name: TABLE fisc_cte_componente; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_componente TO sagnus_app;


--
-- TOC entry 10292 (class 0 OID 0)
-- Dependencies: 393
-- Name: SEQUENCE seq_fisc_cte_destinatario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_destinatario TO sagnus_app;


--
-- TOC entry 10293 (class 0 OID 0)
-- Dependencies: 394
-- Name: TABLE fisc_cte_destinatario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_destinatario TO sagnus_app;


--
-- TOC entry 10294 (class 0 OID 0)
-- Dependencies: 395
-- Name: SEQUENCE seq_fisc_cte_documento_anterior; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_documento_anterior TO sagnus_app;


--
-- TOC entry 10295 (class 0 OID 0)
-- Dependencies: 396
-- Name: TABLE fisc_cte_documento_anterior; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_documento_anterior TO sagnus_app;


--
-- TOC entry 10296 (class 0 OID 0)
-- Dependencies: 397
-- Name: SEQUENCE seq_fisc_cte_documento_anterior_id; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_documento_anterior_id TO sagnus_app;


--
-- TOC entry 10297 (class 0 OID 0)
-- Dependencies: 398
-- Name: TABLE fisc_cte_documento_anterior_id; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_documento_anterior_id TO sagnus_app;


--
-- TOC entry 10298 (class 0 OID 0)
-- Dependencies: 399
-- Name: SEQUENCE seq_fisc_cte_duplicata; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_duplicata TO sagnus_app;


--
-- TOC entry 10299 (class 0 OID 0)
-- Dependencies: 400
-- Name: TABLE fisc_cte_duplicata; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_duplicata TO sagnus_app;


--
-- TOC entry 10300 (class 0 OID 0)
-- Dependencies: 401
-- Name: SEQUENCE seq_fisc_cte_dutoviario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_dutoviario TO sagnus_app;


--
-- TOC entry 10301 (class 0 OID 0)
-- Dependencies: 402
-- Name: TABLE fisc_cte_dutoviario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_dutoviario TO sagnus_app;


--
-- TOC entry 10302 (class 0 OID 0)
-- Dependencies: 403
-- Name: SEQUENCE seq_fisc_cte_emitente; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_emitente TO sagnus_app;


--
-- TOC entry 10303 (class 0 OID 0)
-- Dependencies: 404
-- Name: TABLE fisc_cte_emitente; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_emitente TO sagnus_app;


--
-- TOC entry 10304 (class 0 OID 0)
-- Dependencies: 405
-- Name: SEQUENCE seq_fisc_cte_expedidor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_expedidor TO sagnus_app;


--
-- TOC entry 10305 (class 0 OID 0)
-- Dependencies: 406
-- Name: TABLE fisc_cte_expedidor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_expedidor TO sagnus_app;


--
-- TOC entry 10306 (class 0 OID 0)
-- Dependencies: 407
-- Name: SEQUENCE seq_fisc_cte_fatura; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_fatura TO sagnus_app;


--
-- TOC entry 10307 (class 0 OID 0)
-- Dependencies: 408
-- Name: TABLE fisc_cte_fatura; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_fatura TO sagnus_app;


--
-- TOC entry 10308 (class 0 OID 0)
-- Dependencies: 409
-- Name: SEQUENCE seq_fisc_cte_ferroviario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_ferroviario TO sagnus_app;


--
-- TOC entry 10309 (class 0 OID 0)
-- Dependencies: 410
-- Name: TABLE fisc_cte_ferroviario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_ferroviario TO sagnus_app;


--
-- TOC entry 10310 (class 0 OID 0)
-- Dependencies: 411
-- Name: SEQUENCE seq_fisc_cte_ferroviario_ferrovia; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_ferroviario_ferrovia TO sagnus_app;


--
-- TOC entry 10311 (class 0 OID 0)
-- Dependencies: 412
-- Name: TABLE fisc_cte_ferroviario_ferrovia; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_ferroviario_ferrovia TO sagnus_app;


--
-- TOC entry 10312 (class 0 OID 0)
-- Dependencies: 413
-- Name: SEQUENCE seq_fisc_cte_ferroviario_vagao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_ferroviario_vagao TO sagnus_app;


--
-- TOC entry 10313 (class 0 OID 0)
-- Dependencies: 414
-- Name: TABLE fisc_cte_ferroviario_vagao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_ferroviario_vagao TO sagnus_app;


--
-- TOC entry 10314 (class 0 OID 0)
-- Dependencies: 421
-- Name: SEQUENCE seq_fisc_cte_inf_nf_carga_lacre; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_inf_nf_carga_lacre TO sagnus_app;


--
-- TOC entry 10315 (class 0 OID 0)
-- Dependencies: 422
-- Name: TABLE fisc_cte_inf_nf_carga_lacre; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_inf_nf_carga_lacre TO sagnus_app;


--
-- TOC entry 10316 (class 0 OID 0)
-- Dependencies: 423
-- Name: SEQUENCE seq_fisc_cte_inf_nf_transporte_lacre; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_inf_nf_transporte_lacre TO sagnus_app;


--
-- TOC entry 10317 (class 0 OID 0)
-- Dependencies: 424
-- Name: TABLE fisc_cte_inf_nf_transporte_lacre; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_inf_nf_transporte_lacre TO sagnus_app;


--
-- TOC entry 10318 (class 0 OID 0)
-- Dependencies: 419
-- Name: SEQUENCE seq_fisc_cte_informacao_nf_carga; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_informacao_nf_carga TO sagnus_app;


--
-- TOC entry 10319 (class 0 OID 0)
-- Dependencies: 420
-- Name: TABLE fisc_cte_informacao_nf_carga; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_informacao_nf_carga TO sagnus_app;


--
-- TOC entry 10320 (class 0 OID 0)
-- Dependencies: 415
-- Name: SEQUENCE seq_fisc_cte_informacao_nf_outros; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_informacao_nf_outros TO sagnus_app;


--
-- TOC entry 10321 (class 0 OID 0)
-- Dependencies: 416
-- Name: TABLE fisc_cte_informacao_nf_outros; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_informacao_nf_outros TO sagnus_app;


--
-- TOC entry 10322 (class 0 OID 0)
-- Dependencies: 417
-- Name: SEQUENCE seq_fisc_cte_informacao_nf_transporte; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_informacao_nf_transporte TO sagnus_app;


--
-- TOC entry 10323 (class 0 OID 0)
-- Dependencies: 418
-- Name: TABLE fisc_cte_informacao_nf_transporte; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_informacao_nf_transporte TO sagnus_app;


--
-- TOC entry 10324 (class 0 OID 0)
-- Dependencies: 425
-- Name: SEQUENCE seq_fisc_cte_local_coleta; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_local_coleta TO sagnus_app;


--
-- TOC entry 10325 (class 0 OID 0)
-- Dependencies: 426
-- Name: TABLE fisc_cte_local_coleta; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_local_coleta TO sagnus_app;


--
-- TOC entry 10326 (class 0 OID 0)
-- Dependencies: 427
-- Name: SEQUENCE seq_fisc_cte_local_entrega; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_local_entrega TO sagnus_app;


--
-- TOC entry 10327 (class 0 OID 0)
-- Dependencies: 428
-- Name: TABLE fisc_cte_local_entrega; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_local_entrega TO sagnus_app;


--
-- TOC entry 10328 (class 0 OID 0)
-- Dependencies: 429
-- Name: SEQUENCE seq_fisc_cte_multimodal; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_multimodal TO sagnus_app;


--
-- TOC entry 10329 (class 0 OID 0)
-- Dependencies: 430
-- Name: TABLE fisc_cte_multimodal; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_multimodal TO sagnus_app;


--
-- TOC entry 10330 (class 0 OID 0)
-- Dependencies: 431
-- Name: SEQUENCE seq_fisc_cte_passagem; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_passagem TO sagnus_app;


--
-- TOC entry 10331 (class 0 OID 0)
-- Dependencies: 432
-- Name: TABLE fisc_cte_passagem; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_passagem TO sagnus_app;


--
-- TOC entry 10332 (class 0 OID 0)
-- Dependencies: 433
-- Name: SEQUENCE seq_fisc_cte_perigoso; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_perigoso TO sagnus_app;


--
-- TOC entry 10333 (class 0 OID 0)
-- Dependencies: 434
-- Name: TABLE fisc_cte_perigoso; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_perigoso TO sagnus_app;


--
-- TOC entry 10334 (class 0 OID 0)
-- Dependencies: 435
-- Name: SEQUENCE seq_fisc_cte_recebedor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_recebedor TO sagnus_app;


--
-- TOC entry 10335 (class 0 OID 0)
-- Dependencies: 436
-- Name: TABLE fisc_cte_recebedor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_recebedor TO sagnus_app;


--
-- TOC entry 10336 (class 0 OID 0)
-- Dependencies: 437
-- Name: SEQUENCE seq_fisc_cte_remetente; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_remetente TO sagnus_app;


--
-- TOC entry 10337 (class 0 OID 0)
-- Dependencies: 438
-- Name: TABLE fisc_cte_remetente; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_remetente TO sagnus_app;


--
-- TOC entry 10338 (class 0 OID 0)
-- Dependencies: 439
-- Name: SEQUENCE seq_fisc_cte_rodoviario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_rodoviario TO sagnus_app;


--
-- TOC entry 10339 (class 0 OID 0)
-- Dependencies: 440
-- Name: TABLE fisc_cte_rodoviario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_rodoviario TO sagnus_app;


--
-- TOC entry 10340 (class 0 OID 0)
-- Dependencies: 441
-- Name: SEQUENCE seq_fisc_cte_rodoviario_lacre; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_rodoviario_lacre TO sagnus_app;


--
-- TOC entry 10341 (class 0 OID 0)
-- Dependencies: 442
-- Name: TABLE fisc_cte_rodoviario_lacre; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_rodoviario_lacre TO sagnus_app;


--
-- TOC entry 10342 (class 0 OID 0)
-- Dependencies: 443
-- Name: SEQUENCE seq_fisc_cte_rodoviario_motorista; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_rodoviario_motorista TO sagnus_app;


--
-- TOC entry 10343 (class 0 OID 0)
-- Dependencies: 444
-- Name: TABLE fisc_cte_rodoviario_motorista; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_rodoviario_motorista TO sagnus_app;


--
-- TOC entry 10344 (class 0 OID 0)
-- Dependencies: 445
-- Name: SEQUENCE seq_fisc_cte_rodoviario_occ; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_rodoviario_occ TO sagnus_app;


--
-- TOC entry 10345 (class 0 OID 0)
-- Dependencies: 446
-- Name: TABLE fisc_cte_rodoviario_occ; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_rodoviario_occ TO sagnus_app;


--
-- TOC entry 10346 (class 0 OID 0)
-- Dependencies: 447
-- Name: SEQUENCE seq_fisc_cte_rodoviario_pedagio; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_rodoviario_pedagio TO sagnus_app;


--
-- TOC entry 10347 (class 0 OID 0)
-- Dependencies: 448
-- Name: TABLE fisc_cte_rodoviario_pedagio; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_rodoviario_pedagio TO sagnus_app;


--
-- TOC entry 10348 (class 0 OID 0)
-- Dependencies: 449
-- Name: SEQUENCE seq_fisc_cte_rodoviario_veiculo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_rodoviario_veiculo TO sagnus_app;


--
-- TOC entry 10349 (class 0 OID 0)
-- Dependencies: 450
-- Name: TABLE fisc_cte_rodoviario_veiculo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_rodoviario_veiculo TO sagnus_app;


--
-- TOC entry 10350 (class 0 OID 0)
-- Dependencies: 451
-- Name: SEQUENCE seq_fisc_cte_seguro; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_seguro TO sagnus_app;


--
-- TOC entry 10351 (class 0 OID 0)
-- Dependencies: 452
-- Name: TABLE fisc_cte_seguro; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_seguro TO sagnus_app;


--
-- TOC entry 10352 (class 0 OID 0)
-- Dependencies: 453
-- Name: SEQUENCE seq_fisc_cte_tomador; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_tomador TO sagnus_app;


--
-- TOC entry 10353 (class 0 OID 0)
-- Dependencies: 454
-- Name: TABLE fisc_cte_tomador; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_tomador TO sagnus_app;


--
-- TOC entry 10354 (class 0 OID 0)
-- Dependencies: 455
-- Name: SEQUENCE seq_fisc_cte_veiculo_novo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_cte_veiculo_novo TO sagnus_app;


--
-- TOC entry 10355 (class 0 OID 0)
-- Dependencies: 456
-- Name: TABLE fisc_cte_veiculo_novo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_cte_veiculo_novo TO sagnus_app;


--
-- TOC entry 10356 (class 0 OID 0)
-- Dependencies: 599
-- Name: SEQUENCE seq_fisc_ecf_aliquotas; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_ecf_aliquotas TO sagnus_app;


--
-- TOC entry 10357 (class 0 OID 0)
-- Dependencies: 613
-- Name: TABLE fisc_ecf_aliquotas; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_ecf_aliquotas TO sagnus_app;


--
-- TOC entry 10358 (class 0 OID 0)
-- Dependencies: 601
-- Name: SEQUENCE seq_fisc_municipal_regime; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_municipal_regime TO sagnus_app;


--
-- TOC entry 10359 (class 0 OID 0)
-- Dependencies: 615
-- Name: TABLE fisc_municipal_regime; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_municipal_regime TO sagnus_app;


--
-- TOC entry 10360 (class 0 OID 0)
-- Dependencies: 295
-- Name: SEQUENCE seq_fisc_nfe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe TO sagnus_app;


--
-- TOC entry 10361 (class 0 OID 0)
-- Dependencies: 296
-- Name: TABLE fisc_nfe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe TO sagnus_app;


--
-- TOC entry 10362 (class 0 OID 0)
-- Dependencies: 293
-- Name: SEQUENCE seq_fisc_nfe_acesso_xml; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_acesso_xml TO sagnus_app;


--
-- TOC entry 10363 (class 0 OID 0)
-- Dependencies: 294
-- Name: TABLE fisc_nfe_acesso_xml; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_acesso_xml TO sagnus_app;


--
-- TOC entry 10364 (class 0 OID 0)
-- Dependencies: 297
-- Name: SEQUENCE seq_fisc_nfe_cana; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_cana TO sagnus_app;


--
-- TOC entry 10365 (class 0 OID 0)
-- Dependencies: 298
-- Name: TABLE fisc_nfe_cana; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_cana TO sagnus_app;


--
-- TOC entry 10366 (class 0 OID 0)
-- Dependencies: 299
-- Name: SEQUENCE seq_fisc_nfe_cana_deducoes_safra; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_cana_deducoes_safra TO sagnus_app;


--
-- TOC entry 10367 (class 0 OID 0)
-- Dependencies: 300
-- Name: TABLE fisc_nfe_cana_deducoes_safra; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_cana_deducoes_safra TO sagnus_app;


--
-- TOC entry 10368 (class 0 OID 0)
-- Dependencies: 301
-- Name: SEQUENCE seq_fisc_nfe_cana_fornecimento_diario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_cana_fornecimento_diario TO sagnus_app;


--
-- TOC entry 10369 (class 0 OID 0)
-- Dependencies: 302
-- Name: TABLE fisc_nfe_cana_fornecimento_diario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_cana_fornecimento_diario TO sagnus_app;


--
-- TOC entry 10370 (class 0 OID 0)
-- Dependencies: 303
-- Name: SEQUENCE seq_fisc_nfe_configuracao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_configuracao TO sagnus_app;


--
-- TOC entry 10371 (class 0 OID 0)
-- Dependencies: 304
-- Name: TABLE fisc_nfe_configuracao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_configuracao TO sagnus_app;


--
-- TOC entry 10372 (class 0 OID 0)
-- Dependencies: 305
-- Name: SEQUENCE seq_fisc_nfe_cte_referenciado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_cte_referenciado TO sagnus_app;


--
-- TOC entry 10373 (class 0 OID 0)
-- Dependencies: 306
-- Name: TABLE fisc_nfe_cte_referenciado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_cte_referenciado TO sagnus_app;


--
-- TOC entry 10374 (class 0 OID 0)
-- Dependencies: 307
-- Name: SEQUENCE seq_fisc_nfe_cupom_fiscal_referenciado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_cupom_fiscal_referenciado TO sagnus_app;


--
-- TOC entry 10375 (class 0 OID 0)
-- Dependencies: 308
-- Name: TABLE fisc_nfe_cupom_fiscal_referenciado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_cupom_fiscal_referenciado TO sagnus_app;


--
-- TOC entry 10376 (class 0 OID 0)
-- Dependencies: 347
-- Name: SEQUENCE seq_fisc_nfe_declaracao_importacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_declaracao_importacao TO sagnus_app;


--
-- TOC entry 10377 (class 0 OID 0)
-- Dependencies: 348
-- Name: TABLE fisc_nfe_declaracao_importacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_declaracao_importacao TO sagnus_app;


--
-- TOC entry 10378 (class 0 OID 0)
-- Dependencies: 309
-- Name: SEQUENCE seq_fisc_nfe_destinatario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_destinatario TO sagnus_app;


--
-- TOC entry 10379 (class 0 OID 0)
-- Dependencies: 310
-- Name: TABLE fisc_nfe_destinatario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_destinatario TO sagnus_app;


--
-- TOC entry 10380 (class 0 OID 0)
-- Dependencies: 311
-- Name: SEQUENCE seq_fisc_nfe_det_especifico_armamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_det_especifico_armamento TO sagnus_app;


--
-- TOC entry 10381 (class 0 OID 0)
-- Dependencies: 312
-- Name: TABLE fisc_nfe_det_especifico_armamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_det_especifico_armamento TO sagnus_app;


--
-- TOC entry 10382 (class 0 OID 0)
-- Dependencies: 313
-- Name: SEQUENCE seq_fisc_nfe_det_especifico_combustivel; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_det_especifico_combustivel TO sagnus_app;


--
-- TOC entry 10383 (class 0 OID 0)
-- Dependencies: 314
-- Name: TABLE fisc_nfe_det_especifico_combustivel; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_det_especifico_combustivel TO sagnus_app;


--
-- TOC entry 10384 (class 0 OID 0)
-- Dependencies: 315
-- Name: SEQUENCE seq_fisc_nfe_det_especifico_medicamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_det_especifico_medicamento TO sagnus_app;


--
-- TOC entry 10385 (class 0 OID 0)
-- Dependencies: 316
-- Name: TABLE fisc_nfe_det_especifico_medicamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_det_especifico_medicamento TO sagnus_app;


--
-- TOC entry 10386 (class 0 OID 0)
-- Dependencies: 317
-- Name: SEQUENCE seq_fisc_nfe_det_especifico_veiculo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_det_especifico_veiculo TO sagnus_app;


--
-- TOC entry 10387 (class 0 OID 0)
-- Dependencies: 318
-- Name: TABLE fisc_nfe_det_especifico_veiculo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_det_especifico_veiculo TO sagnus_app;


--
-- TOC entry 10388 (class 0 OID 0)
-- Dependencies: 319
-- Name: SEQUENCE seq_fisc_nfe_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_detalhe TO sagnus_app;


--
-- TOC entry 10389 (class 0 OID 0)
-- Dependencies: 320
-- Name: TABLE fisc_nfe_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_detalhe TO sagnus_app;


--
-- TOC entry 10390 (class 0 OID 0)
-- Dependencies: 321
-- Name: SEQUENCE seq_fisc_nfe_detalhe_imposto_cofins; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_cofins TO sagnus_app;


--
-- TOC entry 10391 (class 0 OID 0)
-- Dependencies: 322
-- Name: TABLE fisc_nfe_detalhe_imposto_cofins; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_detalhe_imposto_cofins TO sagnus_app;


--
-- TOC entry 10392 (class 0 OID 0)
-- Dependencies: 323
-- Name: SEQUENCE seq_fisc_nfe_detalhe_imposto_cofins_st; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_cofins_st TO sagnus_app;


--
-- TOC entry 10393 (class 0 OID 0)
-- Dependencies: 324
-- Name: TABLE fisc_nfe_detalhe_imposto_cofins_st; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_detalhe_imposto_cofins_st TO sagnus_app;


--
-- TOC entry 10394 (class 0 OID 0)
-- Dependencies: 325
-- Name: SEQUENCE seq_fisc_nfe_detalhe_imposto_icms; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_icms TO sagnus_app;


--
-- TOC entry 10395 (class 0 OID 0)
-- Dependencies: 326
-- Name: TABLE fisc_nfe_detalhe_imposto_icms; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_detalhe_imposto_icms TO sagnus_app;


--
-- TOC entry 10396 (class 0 OID 0)
-- Dependencies: 327
-- Name: SEQUENCE seq_fisc_nfe_detalhe_imposto_icms_ufdest; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_icms_ufdest TO sagnus_app;


--
-- TOC entry 10397 (class 0 OID 0)
-- Dependencies: 328
-- Name: TABLE fisc_nfe_detalhe_imposto_icms_ufdest; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_detalhe_imposto_icms_ufdest TO sagnus_app;


--
-- TOC entry 10398 (class 0 OID 0)
-- Dependencies: 329
-- Name: SEQUENCE seq_fisc_nfe_detalhe_imposto_ii; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_ii TO sagnus_app;


--
-- TOC entry 10399 (class 0 OID 0)
-- Dependencies: 330
-- Name: TABLE fisc_nfe_detalhe_imposto_ii; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_detalhe_imposto_ii TO sagnus_app;


--
-- TOC entry 10400 (class 0 OID 0)
-- Dependencies: 331
-- Name: SEQUENCE seq_fisc_nfe_detalhe_imposto_ipi; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_ipi TO sagnus_app;


--
-- TOC entry 10401 (class 0 OID 0)
-- Dependencies: 332
-- Name: TABLE fisc_nfe_detalhe_imposto_ipi; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_detalhe_imposto_ipi TO sagnus_app;


--
-- TOC entry 10402 (class 0 OID 0)
-- Dependencies: 333
-- Name: SEQUENCE seq_fisc_nfe_detalhe_imposto_issqn; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_issqn TO sagnus_app;


--
-- TOC entry 10403 (class 0 OID 0)
-- Dependencies: 334
-- Name: TABLE fisc_nfe_detalhe_imposto_issqn; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_detalhe_imposto_issqn TO sagnus_app;


--
-- TOC entry 10404 (class 0 OID 0)
-- Dependencies: 335
-- Name: SEQUENCE seq_fisc_nfe_detalhe_imposto_pis; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_pis TO sagnus_app;


--
-- TOC entry 10405 (class 0 OID 0)
-- Dependencies: 336
-- Name: TABLE fisc_nfe_detalhe_imposto_pis; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_detalhe_imposto_pis TO sagnus_app;


--
-- TOC entry 10406 (class 0 OID 0)
-- Dependencies: 337
-- Name: SEQUENCE seq_fisc_nfe_detalhe_imposto_pis_st; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_detalhe_imposto_pis_st TO sagnus_app;


--
-- TOC entry 10407 (class 0 OID 0)
-- Dependencies: 338
-- Name: TABLE fisc_nfe_detalhe_imposto_pis_st; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_detalhe_imposto_pis_st TO sagnus_app;


--
-- TOC entry 10408 (class 0 OID 0)
-- Dependencies: 341
-- Name: SEQUENCE seq_fisc_nfe_duplicata; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_duplicata TO sagnus_app;


--
-- TOC entry 10409 (class 0 OID 0)
-- Dependencies: 342
-- Name: TABLE fisc_nfe_duplicata; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_duplicata TO sagnus_app;


--
-- TOC entry 10410 (class 0 OID 0)
-- Dependencies: 343
-- Name: SEQUENCE seq_fisc_nfe_emitente; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_emitente TO sagnus_app;


--
-- TOC entry 10411 (class 0 OID 0)
-- Dependencies: 344
-- Name: TABLE fisc_nfe_emitente; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_emitente TO sagnus_app;


--
-- TOC entry 10412 (class 0 OID 0)
-- Dependencies: 345
-- Name: SEQUENCE seq_fisc_nfe_exportacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_exportacao TO sagnus_app;


--
-- TOC entry 10413 (class 0 OID 0)
-- Dependencies: 346
-- Name: TABLE fisc_nfe_exportacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_exportacao TO sagnus_app;


--
-- TOC entry 10414 (class 0 OID 0)
-- Dependencies: 339
-- Name: SEQUENCE seq_fisc_nfe_fatura; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_fatura TO sagnus_app;


--
-- TOC entry 10415 (class 0 OID 0)
-- Dependencies: 340
-- Name: TABLE fisc_nfe_fatura; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_fatura TO sagnus_app;


--
-- TOC entry 10416 (class 0 OID 0)
-- Dependencies: 349
-- Name: SEQUENCE seq_fisc_nfe_importacao_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_importacao_detalhe TO sagnus_app;


--
-- TOC entry 10417 (class 0 OID 0)
-- Dependencies: 350
-- Name: TABLE fisc_nfe_importacao_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_importacao_det TO sagnus_app;


--
-- TOC entry 10418 (class 0 OID 0)
-- Dependencies: 351
-- Name: SEQUENCE seq_fisc_nfe_informacao_pagamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_informacao_pagamento TO sagnus_app;


--
-- TOC entry 10419 (class 0 OID 0)
-- Dependencies: 352
-- Name: TABLE fisc_nfe_informacao_pagamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_informacao_pagamento TO sagnus_app;


--
-- TOC entry 10420 (class 0 OID 0)
-- Dependencies: 353
-- Name: SEQUENCE seq_fisc_nfe_item_rastreado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_item_rastreado TO sagnus_app;


--
-- TOC entry 10421 (class 0 OID 0)
-- Dependencies: 354
-- Name: TABLE fisc_nfe_item_rastreado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_item_rastreado TO sagnus_app;


--
-- TOC entry 10422 (class 0 OID 0)
-- Dependencies: 355
-- Name: SEQUENCE seq_fisc_nfe_local_entrega; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_local_entrega TO sagnus_app;


--
-- TOC entry 10423 (class 0 OID 0)
-- Dependencies: 356
-- Name: TABLE fisc_nfe_local_entrega; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_local_entrega TO sagnus_app;


--
-- TOC entry 10424 (class 0 OID 0)
-- Dependencies: 357
-- Name: SEQUENCE seq_fisc_nfe_local_retirada; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_local_retirada TO sagnus_app;


--
-- TOC entry 10425 (class 0 OID 0)
-- Dependencies: 358
-- Name: TABLE fisc_nfe_local_retirada; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_local_retirada TO sagnus_app;


--
-- TOC entry 10426 (class 0 OID 0)
-- Dependencies: 359
-- Name: SEQUENCE seq_fisc_nfe_nf_referenciada; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_nf_referenciada TO sagnus_app;


--
-- TOC entry 10427 (class 0 OID 0)
-- Dependencies: 360
-- Name: TABLE fisc_nfe_nf_referenciada; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_nf_referenciada TO sagnus_app;


--
-- TOC entry 10428 (class 0 OID 0)
-- Dependencies: 361
-- Name: SEQUENCE seq_fisc_nfe_numero; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_numero TO sagnus_app;


--
-- TOC entry 10429 (class 0 OID 0)
-- Dependencies: 362
-- Name: TABLE fisc_nfe_numero; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_numero TO sagnus_app;


--
-- TOC entry 10430 (class 0 OID 0)
-- Dependencies: 363
-- Name: SEQUENCE seq_fisc_nfe_numero_inutilizado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_numero_inutilizado TO sagnus_app;


--
-- TOC entry 10431 (class 0 OID 0)
-- Dependencies: 364
-- Name: TABLE fisc_nfe_numero_inutilizado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_numero_inutilizado TO sagnus_app;


--
-- TOC entry 10432 (class 0 OID 0)
-- Dependencies: 365
-- Name: SEQUENCE seq_fisc_nfe_processo_referenciado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_processo_referenciado TO sagnus_app;


--
-- TOC entry 10433 (class 0 OID 0)
-- Dependencies: 366
-- Name: TABLE fisc_nfe_processo_referenciado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_processo_referenciado TO sagnus_app;


--
-- TOC entry 10434 (class 0 OID 0)
-- Dependencies: 367
-- Name: SEQUENCE seq_fisc_nfe_prod_rural_referenciada; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_prod_rural_referenciada TO sagnus_app;


--
-- TOC entry 10435 (class 0 OID 0)
-- Dependencies: 368
-- Name: TABLE fisc_nfe_prod_rural_referenciada; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_prod_rural_referenciada TO sagnus_app;


--
-- TOC entry 10436 (class 0 OID 0)
-- Dependencies: 369
-- Name: SEQUENCE seq_fisc_nfe_referenciada; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_referenciada TO sagnus_app;


--
-- TOC entry 10437 (class 0 OID 0)
-- Dependencies: 370
-- Name: TABLE fisc_nfe_referenciada; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_referenciada TO sagnus_app;


--
-- TOC entry 10438 (class 0 OID 0)
-- Dependencies: 371
-- Name: SEQUENCE seq_fisc_nfe_responsavel_tecnico; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_responsavel_tecnico TO sagnus_app;


--
-- TOC entry 10439 (class 0 OID 0)
-- Dependencies: 372
-- Name: TABLE fisc_nfe_responsavel_tecnico; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_responsavel_tecnico TO sagnus_app;


--
-- TOC entry 10440 (class 0 OID 0)
-- Dependencies: 373
-- Name: SEQUENCE seq_fisc_nfe_transporte; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_transporte TO sagnus_app;


--
-- TOC entry 10441 (class 0 OID 0)
-- Dependencies: 374
-- Name: TABLE fisc_nfe_transporte; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_transporte TO sagnus_app;


--
-- TOC entry 10442 (class 0 OID 0)
-- Dependencies: 375
-- Name: SEQUENCE seq_fisc_nfe_transporte_reboque; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_transporte_reboque TO sagnus_app;


--
-- TOC entry 10443 (class 0 OID 0)
-- Dependencies: 376
-- Name: TABLE fisc_nfe_transporte_reboque; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_transporte_reboque TO sagnus_app;


--
-- TOC entry 10444 (class 0 OID 0)
-- Dependencies: 377
-- Name: SEQUENCE seq_fisc_nfe_transporte_volume; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_transporte_volume TO sagnus_app;


--
-- TOC entry 10445 (class 0 OID 0)
-- Dependencies: 378
-- Name: TABLE fisc_nfe_transporte_volume; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_transporte_volume TO sagnus_app;


--
-- TOC entry 10446 (class 0 OID 0)
-- Dependencies: 379
-- Name: SEQUENCE seq_fisc_nfe_transporte_volume_lacre; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_nfe_transporte_volume_lacre TO sagnus_app;


--
-- TOC entry 10447 (class 0 OID 0)
-- Dependencies: 380
-- Name: TABLE fisc_nfe_transporte_volume_lacre; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_nfe_transporte_volume_lacre TO sagnus_app;


--
-- TOC entry 10448 (class 0 OID 0)
-- Dependencies: 620
-- Name: SEQUENCE seq_fisc_trib_cfop; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_trib_cfop TO sagnus_app;


--
-- TOC entry 10449 (class 0 OID 0)
-- Dependencies: 629
-- Name: TABLE fisc_trib_cfop; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_trib_cfop TO sagnus_app;


--
-- TOC entry 10450 (class 0 OID 0)
-- Dependencies: 621
-- Name: SEQUENCE seq_fisc_trib_csosn; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_trib_csosn TO sagnus_app;


--
-- TOC entry 10451 (class 0 OID 0)
-- Dependencies: 630
-- Name: TABLE fisc_trib_csosn; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_trib_csosn TO sagnus_app;


--
-- TOC entry 10452 (class 0 OID 0)
-- Dependencies: 622
-- Name: SEQUENCE seq_fisc_trib_cst_cofins; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_trib_cst_cofins TO sagnus_app;


--
-- TOC entry 10453 (class 0 OID 0)
-- Dependencies: 631
-- Name: TABLE fisc_trib_cst_cofins; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_trib_cst_cofins TO sagnus_app;


--
-- TOC entry 10454 (class 0 OID 0)
-- Dependencies: 623
-- Name: SEQUENCE seq_fisc_trib_cst_icms; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_trib_cst_icms TO sagnus_app;


--
-- TOC entry 10455 (class 0 OID 0)
-- Dependencies: 632
-- Name: TABLE fisc_trib_cst_icms; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_trib_cst_icms TO sagnus_app;


--
-- TOC entry 10456 (class 0 OID 0)
-- Dependencies: 624
-- Name: SEQUENCE seq_fisc_trib_cst_ipi; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_trib_cst_ipi TO sagnus_app;


--
-- TOC entry 10457 (class 0 OID 0)
-- Dependencies: 633
-- Name: TABLE fisc_trib_cst_ipi; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_trib_cst_ipi TO sagnus_app;


--
-- TOC entry 10458 (class 0 OID 0)
-- Dependencies: 625
-- Name: SEQUENCE seq_fisc_trib_cst_pis; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_trib_cst_pis TO sagnus_app;


--
-- TOC entry 10459 (class 0 OID 0)
-- Dependencies: 634
-- Name: TABLE fisc_trib_cst_pis; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_trib_cst_pis TO sagnus_app;


--
-- TOC entry 10460 (class 0 OID 0)
-- Dependencies: 626
-- Name: SEQUENCE seq_fisc_trib_ecf_aliquotas; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_trib_ecf_aliquotas TO sagnus_app;


--
-- TOC entry 10461 (class 0 OID 0)
-- Dependencies: 635
-- Name: TABLE fisc_trib_ecf_aliquotas; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_trib_ecf_aliquotas TO sagnus_app;


--
-- TOC entry 10462 (class 0 OID 0)
-- Dependencies: 498
-- Name: SEQUENCE seq_corp_tribut_grupo_tributario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_tribut_grupo_tributario TO sagnus_app;


--
-- TOC entry 10463 (class 0 OID 0)
-- Dependencies: 542
-- Name: TABLE fisc_trib_grupo_tributario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_trib_grupo_tributario TO sagnus_app;


--
-- TOC entry 10464 (class 0 OID 0)
-- Dependencies: 499
-- Name: SEQUENCE seq_corp_tribut_icms_custom_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_tribut_icms_custom_cab TO sagnus_app;


--
-- TOC entry 10465 (class 0 OID 0)
-- Dependencies: 543
-- Name: TABLE fisc_trib_icms_custom_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_trib_icms_custom_cab TO sagnus_app;


--
-- TOC entry 10466 (class 0 OID 0)
-- Dependencies: 628
-- Name: SEQUENCE seq_fisc_trib_icms_uf; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_trib_icms_uf TO sagnus_app;


--
-- TOC entry 10467 (class 0 OID 0)
-- Dependencies: 637
-- Name: TABLE fisc_trib_icms_uf; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_trib_icms_uf TO sagnus_app;


--
-- TOC entry 10468 (class 0 OID 0)
-- Dependencies: 627
-- Name: SEQUENCE seq_fisc_trib_municipal_regime; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_trib_municipal_regime TO sagnus_app;


--
-- TOC entry 10469 (class 0 OID 0)
-- Dependencies: 636
-- Name: TABLE fisc_trib_municipal_regime; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_trib_municipal_regime TO sagnus_app;


--
-- TOC entry 10470 (class 0 OID 0)
-- Dependencies: 602
-- Name: SEQUENCE seq_fisc_tribut_icms_uf; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_fisc_tribut_icms_uf TO sagnus_app;


--
-- TOC entry 10471 (class 0 OID 0)
-- Dependencies: 616
-- Name: TABLE fisc_tribut_icms_uf; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.fisc_tribut_icms_uf TO sagnus_app;


--
-- TOC entry 10472 (class 0 OID 0)
-- Dependencies: 694
-- Name: SEQUENCE seq_orca_orcamento_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_orca_orcamento_detalhe TO sagnus_app;


--
-- TOC entry 10473 (class 0 OID 0)
-- Dependencies: 700
-- Name: TABLE orca_orcamento_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.orca_orcamento_detalhe TO sagnus_app;


--
-- TOC entry 10474 (class 0 OID 0)
-- Dependencies: 695
-- Name: SEQUENCE seq_orca_orcamento_empresarial; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_orca_orcamento_empresarial TO sagnus_app;


--
-- TOC entry 10475 (class 0 OID 0)
-- Dependencies: 701
-- Name: TABLE orca_orcamento_empresarial; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.orca_orcamento_empresarial TO sagnus_app;


--
-- TOC entry 10476 (class 0 OID 0)
-- Dependencies: 696
-- Name: SEQUENCE seq_orca_orcamento_fluxo_caixa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_orca_orcamento_fluxo_caixa TO sagnus_app;


--
-- TOC entry 10477 (class 0 OID 0)
-- Dependencies: 702
-- Name: TABLE orca_orcamento_fluxo_caixa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.orca_orcamento_fluxo_caixa TO sagnus_app;


--
-- TOC entry 10478 (class 0 OID 0)
-- Dependencies: 697
-- Name: SEQUENCE seq_orca_orcamento_fluxo_caixa_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_orca_orcamento_fluxo_caixa_detalhe TO sagnus_app;


--
-- TOC entry 10479 (class 0 OID 0)
-- Dependencies: 703
-- Name: TABLE orca_orcamento_fluxo_caixa_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.orca_orcamento_fluxo_caixa_detalhe TO sagnus_app;


--
-- TOC entry 10480 (class 0 OID 0)
-- Dependencies: 698
-- Name: SEQUENCE seq_orca_orcamento_fluxo_caixa_periodo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_orca_orcamento_fluxo_caixa_periodo TO sagnus_app;


--
-- TOC entry 10481 (class 0 OID 0)
-- Dependencies: 704
-- Name: TABLE orca_orcamento_fluxo_caixa_periodo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.orca_orcamento_fluxo_caixa_periodo TO sagnus_app;


--
-- TOC entry 10482 (class 0 OID 0)
-- Dependencies: 699
-- Name: SEQUENCE seq_orca_orcamento_periodo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_orca_orcamento_periodo TO sagnus_app;


--
-- TOC entry 10483 (class 0 OID 0)
-- Dependencies: 705
-- Name: TABLE orca_orcamento_periodo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.orca_orcamento_periodo TO sagnus_app;


--
-- TOC entry 10484 (class 0 OID 0)
-- Dependencies: 706
-- Name: SEQUENCE seq_pcp_instrucao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_pcp_instrucao TO sagnus_app;


--
-- TOC entry 10485 (class 0 OID 0)
-- Dependencies: 713
-- Name: TABLE pcp_instrucao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.pcp_instrucao TO sagnus_app;


--
-- TOC entry 10486 (class 0 OID 0)
-- Dependencies: 707
-- Name: SEQUENCE seq_pcp_instrucao_op; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_pcp_instrucao_op TO sagnus_app;


--
-- TOC entry 10487 (class 0 OID 0)
-- Dependencies: 714
-- Name: TABLE pcp_instrucao_op; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.pcp_instrucao_op TO sagnus_app;


--
-- TOC entry 10488 (class 0 OID 0)
-- Dependencies: 708
-- Name: SEQUENCE seq_pcp_op_cabecalho; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_pcp_op_cabecalho TO sagnus_app;


--
-- TOC entry 10489 (class 0 OID 0)
-- Dependencies: 715
-- Name: TABLE pcp_op_cabecalho; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.pcp_op_cabecalho TO sagnus_app;


--
-- TOC entry 10490 (class 0 OID 0)
-- Dependencies: 709
-- Name: SEQUENCE seq_pcp_op_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_pcp_op_detalhe TO sagnus_app;


--
-- TOC entry 10491 (class 0 OID 0)
-- Dependencies: 716
-- Name: TABLE pcp_op_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.pcp_op_detalhe TO sagnus_app;


--
-- TOC entry 10492 (class 0 OID 0)
-- Dependencies: 710
-- Name: SEQUENCE seq_pcp_servico; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_pcp_servico TO sagnus_app;


--
-- TOC entry 10493 (class 0 OID 0)
-- Dependencies: 717
-- Name: TABLE pcp_servico; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.pcp_servico TO sagnus_app;


--
-- TOC entry 10494 (class 0 OID 0)
-- Dependencies: 711
-- Name: SEQUENCE seq_pcp_servico_colaborador; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_pcp_servico_colaborador TO sagnus_app;


--
-- TOC entry 10495 (class 0 OID 0)
-- Dependencies: 718
-- Name: TABLE pcp_servico_colaborador; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.pcp_servico_colaborador TO sagnus_app;


--
-- TOC entry 10496 (class 0 OID 0)
-- Dependencies: 712
-- Name: SEQUENCE seq_pcp_servico_equipamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_pcp_servico_equipamento TO sagnus_app;


--
-- TOC entry 10497 (class 0 OID 0)
-- Dependencies: 719
-- Name: TABLE pcp_servico_equipamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.pcp_servico_equipamento TO sagnus_app;


--
-- TOC entry 10498 (class 0 OID 0)
-- Dependencies: 720
-- Name: SEQUENCE seq_prdc_produto_ficha_tecnica; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_prdc_produto_ficha_tecnica TO sagnus_app;


--
-- TOC entry 10499 (class 0 OID 0)
-- Dependencies: 721
-- Name: TABLE prdc_produto_ficha_tecnica; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.prdc_produto_ficha_tecnica TO sagnus_app;


--
-- TOC entry 10500 (class 0 OID 0)
-- Dependencies: 591
-- Name: SEQUENCE seq_rhfo_cbo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_rhfo_cbo TO sagnus_app;


--
-- TOC entry 10501 (class 0 OID 0)
-- Dependencies: 606
-- Name: TABLE rhfo_cbo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.rhfo_cbo TO sagnus_app;


--
-- TOC entry 10502 (class 0 OID 0)
-- Dependencies: 600
-- Name: SEQUENCE seq_rhfo_estado_civil; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_rhfo_estado_civil TO sagnus_app;


--
-- TOC entry 10503 (class 0 OID 0)
-- Dependencies: 614
-- Name: TABLE rhfo_estado_civil; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.rhfo_estado_civil TO sagnus_app;


--
-- TOC entry 10504 (class 0 OID 0)
-- Dependencies: 234
-- Name: SEQUENCE seq_agen_categoria_compromisso; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_agen_categoria_compromisso TO sagnus_app;


--
-- TOC entry 10506 (class 0 OID 0)
-- Dependencies: 226
-- Name: SEQUENCE seq_auth_perfil; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_auth_perfil TO sagnus_app;


--
-- TOC entry 10508 (class 0 OID 0)
-- Dependencies: 228
-- Name: SEQUENCE seq_auth_permissao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_auth_permissao TO sagnus_app;


--
-- TOC entry 10510 (class 0 OID 0)
-- Dependencies: 224
-- Name: SEQUENCE seq_auth_usuario; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_auth_usuario TO sagnus_app;


--
-- TOC entry 10511 (class 0 OID 0)
-- Dependencies: 639
-- Name: SEQUENCE seq_corp_pais; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_corp_pais TO sagnus_app;


--
-- TOC entry 10512 (class 0 OID 0)
-- Dependencies: 545
-- Name: SEQUENCE seq_supr_almoxarifado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_almoxarifado TO sagnus_app;


--
-- TOC entry 10513 (class 0 OID 0)
-- Dependencies: 546
-- Name: SEQUENCE seq_supr_estq_cor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_estq_cor TO sagnus_app;


--
-- TOC entry 10514 (class 0 OID 0)
-- Dependencies: 547
-- Name: SEQUENCE seq_supr_estq_grade; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_estq_grade TO sagnus_app;


--
-- TOC entry 10515 (class 0 OID 0)
-- Dependencies: 548
-- Name: SEQUENCE seq_supr_estq_marca; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_estq_marca TO sagnus_app;


--
-- TOC entry 10516 (class 0 OID 0)
-- Dependencies: 549
-- Name: SEQUENCE seq_supr_estq_reajuste_cabecalho; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_estq_reajuste_cabecalho TO sagnus_app;


--
-- TOC entry 10517 (class 0 OID 0)
-- Dependencies: 550
-- Name: SEQUENCE seq_supr_estq_reajuste_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_estq_reajuste_detalhe TO sagnus_app;


--
-- TOC entry 10518 (class 0 OID 0)
-- Dependencies: 551
-- Name: SEQUENCE seq_supr_estq_sabor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_estq_sabor TO sagnus_app;


--
-- TOC entry 10519 (class 0 OID 0)
-- Dependencies: 552
-- Name: SEQUENCE seq_supr_estq_tamanho; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_estq_tamanho TO sagnus_app;


--
-- TOC entry 10520 (class 0 OID 0)
-- Dependencies: 553
-- Name: SEQUENCE seq_supr_invt_contagem_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_invt_contagem_cab TO sagnus_app;


--
-- TOC entry 10521 (class 0 OID 0)
-- Dependencies: 554
-- Name: SEQUENCE seq_supr_invt_contagem_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_invt_contagem_det TO sagnus_app;


--
-- TOC entry 10522 (class 0 OID 0)
-- Dependencies: 555
-- Name: SEQUENCE seq_supr_req_interna_cabecalho; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_req_interna_cabecalho TO sagnus_app;


--
-- TOC entry 10523 (class 0 OID 0)
-- Dependencies: 556
-- Name: SEQUENCE seq_supr_req_interna_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_req_interna_detalhe TO sagnus_app;


--
-- TOC entry 10524 (class 0 OID 0)
-- Dependencies: 557
-- Name: SEQUENCE seq_supr_wms_agendamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_wms_agendamento TO sagnus_app;


--
-- TOC entry 10525 (class 0 OID 0)
-- Dependencies: 558
-- Name: SEQUENCE seq_supr_wms_armazenamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_wms_armazenamento TO sagnus_app;


--
-- TOC entry 10526 (class 0 OID 0)
-- Dependencies: 559
-- Name: SEQUENCE seq_supr_wms_caixa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_wms_caixa TO sagnus_app;


--
-- TOC entry 10527 (class 0 OID 0)
-- Dependencies: 560
-- Name: SEQUENCE seq_supr_wms_estante; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_wms_estante TO sagnus_app;


--
-- TOC entry 10528 (class 0 OID 0)
-- Dependencies: 561
-- Name: SEQUENCE seq_supr_wms_expedicao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_wms_expedicao TO sagnus_app;


--
-- TOC entry 10529 (class 0 OID 0)
-- Dependencies: 562
-- Name: SEQUENCE seq_supr_wms_ordem_separacao_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_wms_ordem_separacao_cab TO sagnus_app;


--
-- TOC entry 10530 (class 0 OID 0)
-- Dependencies: 563
-- Name: SEQUENCE seq_supr_wms_ordem_separacao_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_wms_ordem_separacao_det TO sagnus_app;


--
-- TOC entry 10531 (class 0 OID 0)
-- Dependencies: 564
-- Name: SEQUENCE seq_supr_wms_parametro; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_wms_parametro TO sagnus_app;


--
-- TOC entry 10532 (class 0 OID 0)
-- Dependencies: 565
-- Name: SEQUENCE seq_supr_wms_recebimento_cabecalho; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_wms_recebimento_cabecalho TO sagnus_app;


--
-- TOC entry 10533 (class 0 OID 0)
-- Dependencies: 566
-- Name: SEQUENCE seq_supr_wms_recebimento_detalhe; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_wms_recebimento_detalhe TO sagnus_app;


--
-- TOC entry 10534 (class 0 OID 0)
-- Dependencies: 567
-- Name: SEQUENCE seq_supr_wms_rua; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.seq_supr_wms_rua TO sagnus_app;


--
-- TOC entry 10535 (class 0 OID 0)
-- Dependencies: 568
-- Name: TABLE supr_almoxarifado; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_almoxarifado TO sagnus_app;


--
-- TOC entry 10536 (class 0 OID 0)
-- Dependencies: 569
-- Name: TABLE supr_estq_cor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_estq_cor TO sagnus_app;


--
-- TOC entry 10537 (class 0 OID 0)
-- Dependencies: 570
-- Name: TABLE supr_estq_grade; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_estq_grade TO sagnus_app;


--
-- TOC entry 10538 (class 0 OID 0)
-- Dependencies: 764
-- Name: TABLE supr_estq_local; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_estq_local TO sagnus_app;


--
-- TOC entry 10540 (class 0 OID 0)
-- Dependencies: 763
-- Name: SEQUENCE supr_estq_local_id_seq; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.supr_estq_local_id_seq TO sagnus_app;


--
-- TOC entry 10541 (class 0 OID 0)
-- Dependencies: 571
-- Name: TABLE supr_estq_marca; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_estq_marca TO sagnus_app;


--
-- TOC entry 10542 (class 0 OID 0)
-- Dependencies: 767
-- Name: TABLE supr_estq_movimentacao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_estq_movimentacao TO sagnus_app;


--
-- TOC entry 10544 (class 0 OID 0)
-- Dependencies: 766
-- Name: SEQUENCE supr_estq_movimentacao_id_seq; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.supr_estq_movimentacao_id_seq TO sagnus_app;


--
-- TOC entry 10545 (class 0 OID 0)
-- Dependencies: 572
-- Name: TABLE supr_estq_reajuste_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_estq_reajuste_cab TO sagnus_app;


--
-- TOC entry 10546 (class 0 OID 0)
-- Dependencies: 573
-- Name: TABLE supr_estq_reajuste_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_estq_reajuste_det TO sagnus_app;


--
-- TOC entry 10547 (class 0 OID 0)
-- Dependencies: 574
-- Name: TABLE supr_estq_sabor; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_estq_sabor TO sagnus_app;


--
-- TOC entry 10549 (class 0 OID 0)
-- Dependencies: 765
-- Name: TABLE supr_estq_saldo; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_estq_saldo TO sagnus_app;


--
-- TOC entry 10550 (class 0 OID 0)
-- Dependencies: 769
-- Name: TABLE supr_estq_saldo_historico; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_estq_saldo_historico TO sagnus_app;


--
-- TOC entry 10552 (class 0 OID 0)
-- Dependencies: 768
-- Name: SEQUENCE supr_estq_saldo_historico_id_seq; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT ALL ON SEQUENCE sagnus.supr_estq_saldo_historico_id_seq TO sagnus_app;


--
-- TOC entry 10553 (class 0 OID 0)
-- Dependencies: 575
-- Name: TABLE supr_estq_tamanho; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_estq_tamanho TO sagnus_app;


--
-- TOC entry 10554 (class 0 OID 0)
-- Dependencies: 576
-- Name: TABLE supr_invt_contagem_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_invt_contagem_cab TO sagnus_app;


--
-- TOC entry 10555 (class 0 OID 0)
-- Dependencies: 577
-- Name: TABLE supr_invt_contagem_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_invt_contagem_det TO sagnus_app;


--
-- TOC entry 10556 (class 0 OID 0)
-- Dependencies: 578
-- Name: TABLE supr_req_interna_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_req_interna_cab TO sagnus_app;


--
-- TOC entry 10557 (class 0 OID 0)
-- Dependencies: 579
-- Name: TABLE supr_req_interna_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_req_interna_det TO sagnus_app;


--
-- TOC entry 10558 (class 0 OID 0)
-- Dependencies: 580
-- Name: TABLE supr_wms_agendamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_wms_agendamento TO sagnus_app;


--
-- TOC entry 10559 (class 0 OID 0)
-- Dependencies: 581
-- Name: TABLE supr_wms_armazenamento; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_wms_armazenamento TO sagnus_app;


--
-- TOC entry 10560 (class 0 OID 0)
-- Dependencies: 582
-- Name: TABLE supr_wms_caixa; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_wms_caixa TO sagnus_app;


--
-- TOC entry 10561 (class 0 OID 0)
-- Dependencies: 583
-- Name: TABLE supr_wms_estante; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_wms_estante TO sagnus_app;


--
-- TOC entry 10562 (class 0 OID 0)
-- Dependencies: 584
-- Name: TABLE supr_wms_expedicao; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_wms_expedicao TO sagnus_app;


--
-- TOC entry 10563 (class 0 OID 0)
-- Dependencies: 585
-- Name: TABLE supr_wms_ordem_separacao_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_wms_ordem_separacao_cab TO sagnus_app;


--
-- TOC entry 10564 (class 0 OID 0)
-- Dependencies: 586
-- Name: TABLE supr_wms_ordem_separacao_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_wms_ordem_separacao_det TO sagnus_app;


--
-- TOC entry 10565 (class 0 OID 0)
-- Dependencies: 587
-- Name: TABLE supr_wms_parametro; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_wms_parametro TO sagnus_app;


--
-- TOC entry 10566 (class 0 OID 0)
-- Dependencies: 588
-- Name: TABLE supr_wms_recebimento_cab; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_wms_recebimento_cab TO sagnus_app;


--
-- TOC entry 10567 (class 0 OID 0)
-- Dependencies: 589
-- Name: TABLE supr_wms_recebimento_det; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_wms_recebimento_det TO sagnus_app;


--
-- TOC entry 10568 (class 0 OID 0)
-- Dependencies: 590
-- Name: TABLE supr_wms_rua; Type: ACL; Schema: sagnus; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLE sagnus.supr_wms_rua TO sagnus_app;


--
-- TOC entry 3436 (class 826 OID 16392)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: sagnus; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA sagnus GRANT ALL ON SEQUENCES TO sagnus_app;


--
-- TOC entry 3435 (class 826 OID 16391)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: sagnus; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA sagnus GRANT SELECT,INSERT,REFERENCES,DELETE,UPDATE ON TABLES TO sagnus_app;


-- Completed on 2025-12-19 14:07:43

--
-- PostgreSQL database dump complete
--

\unrestrict bnNB2kaKpV0GCVkIq3e8bpOFCzLJ1QjvEZblKRdYefSoYRTHrfasMSMWtBI8dPo


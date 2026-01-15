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

CREATE SEQUENCE IF NOT EXISTS sagnus.seq_auth_refresh_token START WITH 1 INCREMENT BY 1 CACHE 1;

CREATE TABLE IF NOT EXISTS sagnus.auth_refresh_token (
  "ID" numeric(11,0) DEFAULT nextval('sagnus.seq_auth_refresh_token'::regclass) NOT NULL,
  "USUARIO_ID" numeric(11,0) NOT NULL,
  "TOKEN_HASH" varchar(64) NOT NULL,
  "EXPIRA_EM" timestamptz NOT NULL,
  "REVOGADO" boolean DEFAULT false NOT NULL,
  "DT_CRIACAO" timestamptz DEFAULT now() NOT NULL,
  CONSTRAINT "PK_AUTH_REFRESH_TOKEN" PRIMARY KEY ("ID"),
  CONSTRAINT "UK_AUTH_REFRESH_TOKEN_HASH" UNIQUE ("TOKEN_HASH")
);

CREATE INDEX IF NOT EXISTS "IX_AUTH_REFRESH_TOKEN_USUARIO" ON sagnus.auth_refresh_token("USUARIO_ID");

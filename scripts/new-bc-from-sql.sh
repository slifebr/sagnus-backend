#!/usr/bin/env bash
set -euo pipefail

BC_NAME="${1:-}"
SQL_FILE="${2:-}"
PREFIX="${3:-adm_}"
SCHEMA="${4:-sagnus}"
PACKAGE_SUFFIX="${5:-}"

if [[ -z "$BC_NAME" || -z "$SQL_FILE" ]]; then
  echo "Uso:"
  echo "  ./scripts/new-bc-from-sql.sh <bcName> <sqlFile> [prefix] [schema] [packageSuffix]"
  echo "Ex.: ./scripts/new-bc-from-sql.sh adm base_1221.sql adm_ sagnus"
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [[ ! -f "./scripts/new-bc.sh" ]]; then
  echo "ERRO: não achei scripts/new-bc.sh"
  exit 1
fi

if [[ -n "$PACKAGE_SUFFIX" ]]; then
  ./scripts/new-bc.sh "$BC_NAME" "$PACKAGE_SUFFIX"
else
  ./scripts/new-bc.sh "$BC_NAME"
fi

MODULE_DIR="$ROOT_DIR/sagnus-bc-$BC_NAME"
MIG_DIR="$MODULE_DIR/src/main/resources/db/migration"
mkdir -p "$MIG_DIR"

TS="$(date +%Y%m%d%H%M%S)"
OUT_MIG="$MIG_DIR/V${TS}__init_${BC_NAME}_${PREFIX%_}_schema.sql"

if [[ ! -f "./scripts/tools/extract_ddl.py" ]]; then
  echo "ERRO: não achei scripts/tools/extract_ddl.py"
  exit 1
fi
if [[ ! -f "$SQL_FILE" ]]; then
  echo "ERRO: SQL file não existe: $SQL_FILE"
  exit 1
fi

python ./scripts/tools/extract_ddl.py --in "$SQL_FILE" --prefix "$PREFIX" --out "$OUT_MIG" --schema "$SCHEMA"

cat > "$MODULE_DIR/BC_FROM_SQL.md" <<EOF
# BC $BC_NAME - Gerado a partir de SQL

- Fonte DDL: $SQL_FILE
- Prefixo de tabelas: $PREFIX
- Schema (search_path): $SCHEMA
- Migration gerada:
  - $OUT_MIG

## O que foi extraído
- CREATE TABLE
- ALTER TABLE ... ADD CONSTRAINT (PK/FK/UK/CHK)
- CREATE INDEX / CREATE UNIQUE INDEX
- COMMENT ON TABLE/COLUMN
- SEQUENCES relevantes (quando aplicável)

## Próximos passos (recomendado)
1) Revisar a migration e remover trechos indesejados (GRANT/OWNER/ACL) se existirem.
2) Completar FKs/Indexes ausentes se o dump não tiver tudo.
3) Criar Entities/Repos e UseCases a partir das tabelas.
EOF

echo "OK: BC criado em $MODULE_DIR"
echo "OK: Migration criada em $OUT_MIG"

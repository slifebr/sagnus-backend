#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------
# new-bc-from-sql.sh (v2)
# Cria um BC via template + (opcionalmente) gera migration Flyway
# a partir de um arquivo SQL (DDL). Também pode criar módulo
# *-contracts e stubs opcionais.
#
# Uso:
#   ./scripts/new-bc-from-sql.sh <bcName> <sqlFile> [prefix] [schema] [packageSuffix] [flags...]
#
# Flags (repassadas para new-bc.sh quando aplicável):
#   --with-contracts | --no-contracts
#   --with-contracts-ports | --no-contracts-ports
#   --with-gateway-graphql-stub | --no-gateway-graphql-stub
#   --with-flyway | --no-flyway   (default: with; se no-flyway, pula geração de migration)
#
# Ex:
#   ./scripts/new-bc-from-sql.sh adm base.sql adm_ sagnus "" --with-contracts --with-contracts-ports
# ------------------------------------------------------------

BC_NAME="${1:-}"
SQL_FILE="${2:-}"
PREFIX="${3:-adm_}"
SCHEMA="${4:-sagnus}"
PACKAGE_SUFFIX="${5:-}"

shift $(( $#>=5 ? 5 : $# ))

WITH_FLYWAY=1
PASS_FLAGS=()

usage() {
  cat <<'EOF'
Uso:
  ./scripts/new-bc-from-sql.sh <bcName> <sqlFile> [prefix] [schema] [packageSuffix] [flags...]

EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help) usage; exit 0 ;;
    --with-flyway) WITH_FLYWAY=1; PASS_FLAGS+=("--with-flyway") ;;
    --no-flyway) WITH_FLYWAY=0; PASS_FLAGS+=("--no-flyway") ;;
    --with-contracts|--no-contracts|--with-contracts-ports|--no-contracts-ports|--with-gateway-graphql-stub|--no-gateway-graphql-stub)
      PASS_FLAGS+=("$1")
      ;;
    *) echo "Flag desconhecida: $1" >&2; usage; exit 2 ;;
  esac
  shift
done

if [[ -z "$BC_NAME" || -z "$SQL_FILE" ]]; then
  echo "ERRO: informe bcName e sqlFile." >&2
  usage
  exit 1
fi

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SQL_PATH="$SQL_FILE"
if [[ ! "$SQL_PATH" = /* ]]; then
  SQL_PATH="$REPO_ROOT/$SQL_FILE"
fi
if [[ ! -f "$SQL_PATH" ]]; then
  echo "ERRO: SQL não encontrado: $SQL_PATH" >&2
  exit 1
fi

# 1) cria BC (e opcionalmente contracts / stubs)
"$REPO_ROOT/scripts/new-bc.sh" "$BC_NAME" "$PACKAGE_SUFFIX" "$BC_NAME" "${PASS_FLAGS[@]}"

# 2) gera migration Flyway (opcional)
if [[ "$WITH_FLYWAY" == "1" ]]; then
  BC_DIR="$REPO_ROOT/sagnus-bc-${BC_NAME}"
  MIG_DIR="$BC_DIR/src/main/resources/db/migration"
  mkdir -p "$MIG_DIR"

  TS="$(date +%Y%m%d%H%M%S)"
  OUT_FILE="$MIG_DIR/V${TS}__init_${BC_NAME}_${PREFIX%_}_schema.sql"

  # Preferir script de extração se existir; caso contrário, copia o SQL bruto
  EXTRACTOR="$REPO_ROOT/scripts/tools/extract_ddl.py"
  if [[ -f "$EXTRACTOR" ]]; then
    python3 "$EXTRACTOR" --input "$SQL_PATH" --output "$OUT_FILE" --schema "$SCHEMA" --prefix "$PREFIX" || true
    if [[ ! -s "$OUT_FILE" ]]; then
      cp "$SQL_PATH" "$OUT_FILE"
    fi
  else
    cp "$SQL_PATH" "$OUT_FILE"
  fi

  echo "OK: migration gerada: $OUT_FILE"
else
  echo "INFO: --no-flyway: migration NÃO gerada"
fi

echo "OK: BC criado a partir do SQL: $BC_NAME"

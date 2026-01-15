#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------
# new-bc.sh (v2)
# Cria um novo bounded context a partir do template e registra
# o(s) módulo(s) no pom.xml agregador.
#
# Uso:
#   ./scripts/new-bc.sh <bcName> [packageSuffix] [feature] [flags...]
#
# Flags:
#   --with-contracts | --no-contracts                 (default: with)
#   --with-contracts-ports | --no-contracts-ports     (default: no)
#   --with-gateway-graphql-stub | --no-gateway-graphql-stub (default: no)
#   --with-flyway | --no-flyway                       (default: with)
#
# Exemplos:
#   ./scripts/new-bc.sh adm
#   ./scripts/new-bc.sh adm "" "" --with-contracts-ports --with-gateway-graphql-stub
#   ./scripts/new-bc.sh fiscal-nfe fiscal.nfe nfe --no-contracts --no-flyway
# ------------------------------------------------------------

BC_NAME="${1:-}"
PACKAGE_SUFFIX="${2:-}"
FEATURE="${3:-}"

shift $(( $#>=3 ? 3 : $# ))

WITH_CONTRACTS=1
WITH_CONTRACTS_PORTS=0
WITH_GATEWAY_GRAPHQL_STUB=0
WITH_FLYWAY=1

usage() {
  cat <<'EOF'
Uso:
  ./scripts/new-bc.sh <bcName> [packageSuffix] [feature] [flags...]

Flags:
  --with-contracts | --no-contracts
  --with-contracts-ports | --no-contracts-ports
  --with-gateway-graphql-stub | --no-gateway-graphql-stub
  --with-flyway | --no-flyway

EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help) usage; exit 0 ;;
    --with-contracts) WITH_CONTRACTS=1 ;;
    --no-contracts) WITH_CONTRACTS=0 ;;
    --with-contracts-ports) WITH_CONTRACTS_PORTS=1 ;;
    --no-contracts-ports) WITH_CONTRACTS_PORTS=0 ;;
    --with-gateway-graphql-stub) WITH_GATEWAY_GRAPHQL_STUB=1 ;;
    --no-gateway-graphql-stub) WITH_GATEWAY_GRAPHQL_STUB=0 ;;
    --with-flyway) WITH_FLYWAY=1 ;;
    --no-flyway) WITH_FLYWAY=0 ;;
    *) echo "Flag desconhecida: $1" >&2; usage; exit 2 ;;
  esac
  shift
done

if [[ -z "$BC_NAME" ]]; then
  echo "ERRO: informe o nome do BC (kebab-case). Ex: adm, estoque, fiscal-nfe" >&2
  usage
  exit 1
fi

if [[ -z "$FEATURE" ]]; then
  FEATURE="$BC_NAME"
fi

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
POM_FILE="$REPO_ROOT/pom.xml"

to_pascal() {
  local s="$1"
  s="${s//-/ }"
  local out=""
  for w in $s; do out+="${w^}"; done
  echo "$out"
}

add_module_to_pom() {
  local module="$1"
  if grep -q "<module>${module}</module>" "$POM_FILE"; then
    return 0
  fi
  # Insere antes do </modules>
  perl -0777 -i -pe "s#(</modules>)#  <module>${module}</module>\n\1#s" "$POM_FILE"
}

BASE_PKG="com.slifesys.sagnus.${BC_NAME//-/.}"
if [[ -n "$PACKAGE_SUFFIX" ]]; then
  BASE_PKG="com.slifesys.sagnus.${PACKAGE_SUFFIX}"
fi

TEMPLATE_DIR="$REPO_ROOT/sagnus-bc-template"
CONTRACTS_TEMPLATE_DIR="$REPO_ROOT/sagnus-bc-contracts-template"

BC_DIR="$REPO_ROOT/sagnus-bc-${BC_NAME}"
CONTRACTS_DIR="$REPO_ROOT/sagnus-bc-${BC_NAME}-contracts"

if [[ -d "$BC_DIR" ]]; then
  echo "ERRO: já existe: $BC_DIR" >&2
  exit 1
fi
if [[ "$WITH_CONTRACTS" == "1" && -d "$CONTRACTS_DIR" ]]; then
  echo "ERRO: já existe: $CONTRACTS_DIR" >&2
  exit 1
fi

# --- 1) BC principal ---
cp -R "$TEMPLATE_DIR" "$BC_DIR"

# replace placeholders
find "$BC_DIR" -type f -print0 | xargs -0 sed -i.bak   -e "s/sagnus-bc-template/sagnus-bc-${BC_NAME}/g"   -e "s/com\.slifesys\.sagnus\.template/${BASE_PKG}/g"   -e "s#api/example#api/${FEATURE}#g"

find "$BC_DIR" -type f -name "*.bak" -delete

# renomeia pasta do package template -> bc package
OLD_PKG_DIR="$BC_DIR/src/main/java/com/slifesys/sagnus/template"
NEW_PKG_DIR="$BC_DIR/src/main/java/$(echo "$BASE_PKG" | tr '.' '/')"
mkdir -p "$(dirname "$NEW_PKG_DIR")"
if [[ -d "$OLD_PKG_DIR" ]]; then
  mv "$OLD_PKG_DIR" "$NEW_PKG_DIR"
fi

# move api/example -> api/<feature>
EXAMPLE_DIR="$NEW_PKG_DIR/api/example"
if [[ -d "$EXAMPLE_DIR" ]]; then
  FEATURE_DIR="$NEW_PKG_DIR/api/${FEATURE}"
  mkdir -p "$FEATURE_DIR"
  mv "$EXAMPLE_DIR"/* "$FEATURE_DIR"/
  rmdir "$EXAMPLE_DIR" || true
fi

# rename ExampleController -> <Feature>Controller
FEATURE_PASCAL="$(to_pascal "$FEATURE")"
if [[ -f "$NEW_PKG_DIR/api/${FEATURE}/${FEATURE_PASCAL}Controller.java" ]]; then
  : # já renomeado
else
  if [[ -f "$NEW_PKG_DIR/api/${FEATURE}/ExampleController.java" ]]; then
    mv "$NEW_PKG_DIR/api/${FEATURE}/ExampleController.java" "$NEW_PKG_DIR/api/${FEATURE}/${FEATURE_PASCAL}Controller.java"
  fi
fi
if [[ -f "$NEW_PKG_DIR/api/${FEATURE}/${FEATURE_PASCAL}Controller.java" ]]; then
  sed -i.bak -e "s/class ExampleController/class ${FEATURE_PASCAL}Controller/g" "$NEW_PKG_DIR/api/${FEATURE}/${FEATURE_PASCAL}Controller.java"
  rm -f "$NEW_PKG_DIR/api/${FEATURE}/${FEATURE_PASCAL}Controller.java.bak"
fi

# Flyway folder opcional (apenas estrutura)
if [[ "$WITH_FLYWAY" == "1" ]]; then
  mkdir -p "$BC_DIR/src/main/resources/db/migration"
  if [[ ! -f "$BC_DIR/src/main/resources/db/migration/.keep" ]]; then
    echo "# keep" > "$BC_DIR/src/main/resources/db/migration/.keep"
  fi
fi

# registra módulo BC
add_module_to_pom "sagnus-bc-${BC_NAME}"

# --- 2) Contracts (opcional) ---
if [[ "$WITH_CONTRACTS" == "1" ]]; then
  if [[ ! -d "$CONTRACTS_TEMPLATE_DIR" ]]; then
    echo "ERRO: contracts template não encontrado: $CONTRACTS_TEMPLATE_DIR" >&2
    exit 1
  fi
  cp -R "$CONTRACTS_TEMPLATE_DIR" "$CONTRACTS_DIR"

  find "$CONTRACTS_DIR" -type f -print0 | xargs -0 sed -i.bak     -e "s/sagnus-bc-contracts-template/sagnus-bc-${BC_NAME}-contracts/g"     -e "s/com\.slifesys\.sagnus\.template/${BASE_PKG}/g"
  find "$CONTRACTS_DIR" -type f -name "*.bak" -delete

  OLD_C_PKG_DIR="$CONTRACTS_DIR/src/main/java/com/slifesys/sagnus/template"
  NEW_C_PKG_DIR="$CONTRACTS_DIR/src/main/java/$(echo "$BASE_PKG" | tr '.' '/')"
  mkdir -p "$(dirname "$NEW_C_PKG_DIR")"
  if [[ -d "$OLD_C_PKG_DIR" ]]; then
    mv "$OLD_C_PKG_DIR" "$NEW_C_PKG_DIR"
  fi

  # opcional: gerar Ports + DTOs iniciais
  if [[ "$WITH_CONTRACTS_PORTS" == "1" ]]; then
    BC_PASCAL="$(to_pascal "$BC_NAME")"
    PORT_PKG_DIR="$NEW_C_PKG_DIR/contract/core"
    mkdir -p "$PORT_PKG_DIR"
    cat > "$PORT_PKG_DIR/${BC_PASCAL}QueryPort.java" <<EOF
package ${BASE_PKG}.contract.core;

import java.util.Optional;

/**
 * Port de consulta do BC ${BC_NAME^^}.
 * Outros BCs dependem APENAS deste contrato.
 *
 * Obs.: ajuste nomes/assuntos conforme o domínio real do BC.
 */
public interface ${BC_PASCAL}QueryPort {
    Optional<ResumoDTO> obterResumoPorId(Long id);
    Optional<ResumoDTO> obterResumoPorCodigo(String codigo);
}
EOF

    cat > "$PORT_PKG_DIR/ResumoDTO.java" <<EOF
package ${BASE_PKG}.contract.core;

/**
 * DTO mínimo (read-only) para referências cruzadas entre BCs.
 * Evite expor entidades do domínio diretamente.
 */
public record ResumoDTO(
        Long id,
        String codigo,
        String nome,
        Boolean ativo
) {}
EOF
  fi

  add_module_to_pom "sagnus-bc-${BC_NAME}-contracts"
fi

# --- 3) Stub GraphQL no gateway (opcional) ---
if [[ "$WITH_GATEWAY_GRAPHQL_STUB" == "1" ]]; then
  # Organização: resources/graphql/<bc>/*.graphqls
  GQL_ROOT="$REPO_ROOT/sagnus-api-gateway/src/main/resources/graphql"
  GQL_DIR="$GQL_ROOT/$BC_NAME"
  JAVA_GQL_DIR="$REPO_ROOT/sagnus-api-gateway/src/main/java/com/slifesys/sagnus/graphql"
  mkdir -p "$GQL_DIR" "$JAVA_GQL_DIR/bc"

  # Stubs separados por responsabilidade (escala melhor e reduz conflitos de merge)
  cat > "$GQL_DIR/${BC_NAME}.queries.graphqls" <<EOF
"""Queries (stub) do BC ${BC_NAME} no Gateway GraphQL (BFF fino)."""

extend type Query {
  ${BC_NAME}Ping: String!
}
EOF

  cat > "$GQL_DIR/${BC_NAME}.mutations.graphqls" <<EOF
"""Mutations (stub) do BC ${BC_NAME} no Gateway GraphQL (BFF fino)."""

extend type Mutation {
  ${BC_NAME}PingMut: String!
}
EOF

  cat > "$GQL_DIR/${BC_NAME}.types.graphqls" <<EOF
"""Types (stub) do BC ${BC_NAME} no Gateway GraphQL (BFF fino)."""

# Adicione aqui inputs/enums/types específicos do BC.
EOF

  BC_PASCAL="$(to_pascal "$BC_NAME")"
  cat > "$JAVA_GQL_DIR/bc/${BC_PASCAL}GraphqlStubController.java" <<EOF
package com.slifesys.sagnus.graphql.bc;

import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

/**
 * Stub inicial do BC ${BC_NAME} no Gateway GraphQL (BFF fino).
 * Substitua/adapte para chamar use cases/ports reais do BC.
 */
@Controller
public class ${BC_PASCAL}GraphqlStubController {

    @QueryMapping(name = "${BC_NAME}Ping")
    public String ping() {
        return "OK";
    }

    @MutationMapping(name = "${BC_NAME}PingMut")
    public String pingMut() {
        return "OK";
    }
}
EOF
fi

echo "OK: criado $BC_DIR"
echo " - package base: $BASE_PKG"
echo " - api feature: api/$FEATURE"
echo " - endpoint base: /$FEATURE"
echo " - contracts: $([[ "$WITH_CONTRACTS" == "1" ]] && echo "SIM" || echo "NÃO")"
echo " - contracts ports: $([[ "$WITH_CONTRACTS_PORTS" == "1" ]] && echo "SIM" || echo "NÃO")"
echo " - flyway folder: $([[ "$WITH_FLYWAY" == "1" ]] && echo "SIM" || echo "NÃO")"
echo " - gateway graphql stub: $([[ "$WITH_GATEWAY_GRAPHQL_STUB" == "1" ]] && echo "SIM" || echo "NÃO")"
echo "OK: atualizado pom: $POM_FILE"

#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Uso: ./scripts/delete-bc.sh <bc-name>"
  echo "Ex.: ./scripts/delete-bc.sh estoque"
  exit 1
fi

BC_NAME="$(echo "$1" | tr '[:upper:]' '[:lower:]')"
MODULE="sagnus-bc-${BC_NAME}"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
POM="${ROOT_DIR}/pom.xml"
MOD_PATH="${ROOT_DIR}/${MODULE}"

if [[ ! -f "${POM}" ]]; then
  echo "Erro: não encontrei pom.xml na raiz (${POM})"
  exit 1
fi

if [[ ! -d "${MOD_PATH}" ]]; then
  echo "Erro: módulo não encontrado (${MOD_PATH})"
  exit 1
fi

echo "Removendo módulo: ${MODULE}"

# 1) remove pasta
rm -rf "${MOD_PATH}"

# 2) remove do <modules> no pom.xml raiz (remove linha inteira)
# Mantém compatibilidade macOS/Linux
if grep -q "<module>${MODULE}</module>" "${POM}"; then
  tmp="$(mktemp)"
  grep -v "<module>${MODULE}</module>" "${POM}" > "${tmp}"
  mv "${tmp}" "${POM}"
  echo "Atualizado: removido <module>${MODULE}</module> do pom.xml raiz."
else
  echo "Aviso: não achei <module>${MODULE}</module> no pom.xml."
fi

echo "OK. Agora rode: mvn -q -DskipTests clean verify"

#!/usr/bin/env bash
set -euo pipefail

BC_NAME="${1:-}"
PACKAGE_SUFFIX="${2:-}"
FEATURE="${3:-}"

if [[ -z "$BC_NAME" ]]; then
  echo "Uso:"
  echo "  ./scripts/new-bc.sh <bcName> [packageSuffix] [feature]"
  echo "Ex.: ./scripts/new-bc.sh adm"
  echo "Ex.: ./scripts/new-bc.sh fiscal-nfe fiscal.nfe nfe"
  exit 1
fi

if [[ -z "$FEATURE" ]]; then
  FEATURE="$BC_NAME"
fi

to_pascal() {
  local s="$1"
  IFS='-_. ' read -r -a parts <<< "$s"
  local out=""
  for p in "${parts[@]}"; do
    [[ -z "$p" ]] && continue
    out+="${p^}"
  done
  echo "$out"
}

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

TEMPLATE_DIR="sagnus-bc-template"
BC_DIR="sagnus-bc-${BC_NAME}"

if [[ ! -d "$TEMPLATE_DIR" ]]; then
  echo "ERRO: template não encontrado: $TEMPLATE_DIR"
  exit 1
fi
if [[ -d "$BC_DIR" ]]; then
  echo "ERRO: BC já existe: $BC_DIR"
  exit 1
fi

cp -R "$TEMPLATE_DIR" "$BC_DIR"

# artifactId
sed -i.bak "s/<artifactId>${TEMPLATE_DIR}<\/artifactId>/<artifactId>${BC_DIR}<\/artifactId>/g" "$BC_DIR/pom.xml" && rm -f "$BC_DIR/pom.xml.bak"

BASE_PKG="com.slifesys.sagnus"
if [[ -n "$PACKAGE_SUFFIX" ]]; then
  NEW_PKG="${BASE_PKG}.${PACKAGE_SUFFIX}"
else
  NEW_PKG="${BASE_PKG}.${BC_NAME}"
fi
TEMPLATE_PKG="${BASE_PKG}.template"

# move package trees (main/test)
move_pkg() {
  local root="$1"
  local from="${TEMPLATE_PKG//./\/}"
  local to="${NEW_PKG//./\/}"
  if [[ -d "$BC_DIR/$root/$from" ]]; then
    mkdir -p "$BC_DIR/$root/$(dirname "$to")"
    mv "$BC_DIR/$root/$from" "$BC_DIR/$root/$to"
  fi
}
move_pkg "src/main/java"
move_pkg "src/test/java"

# replace package/imports
find "$BC_DIR" -type f -name "*.java" -print0 | xargs -0 sed -i.bak "s/${TEMPLATE_PKG}/${NEW_PKG}/g"
find "$BC_DIR" -type f -name "*.java.bak" -delete

# spring.application.name + /v1/template
FEATURE_PATH="/v1/${BC_NAME}"
find "$BC_DIR" -type f \( -name "*.java" -o -name "*.yml" -o -name "*.yaml" -o -name "*.properties" \) -print0 \
  | xargs -0 sed -i.bak \
    -e "s/spring\.application\.name:\s*template/spring.application.name: ${BC_NAME}/g" \
    -e "s/\/v1\/template/${FEATURE_PATH//\//\\/}/g"
find "$BC_DIR" -type f -name "*.bak" -delete

# API vertical: api/example -> api/<feature>
API_ROOT="$BC_DIR/src/main/java/${NEW_PKG//./\/}"
if [[ -d "$API_ROOT/api/example" ]]; then
  mkdir -p "$API_ROOT/api"
  mv "$API_ROOT/api/example" "$API_ROOT/api/${FEATURE}"
fi

FEATURE_PASCAL="$(to_pascal "$FEATURE")"

# rename ExampleController.java file if exists
while IFS= read -r -d '' f; do
  dir="$(dirname "$f")"
  mv "$f" "$dir/${FEATURE_PASCAL}Controller.java"
done < <(find "$BC_DIR" -type f -name "*ExampleController.java" -print0)

# replace class/package references
find "$BC_DIR" -type f -name "*.java" -print0 | xargs -0 sed -i.bak \
  -e "s/\bExampleController\b/${FEATURE_PASCAL}Controller/g" \
  -e "s/\.api\.example\b/.api.${FEATURE}/g"
find "$BC_DIR" -type f -name "*.bak" -delete

echo "OK: criado $BC_DIR"
echo " - package base: $NEW_PKG"
echo " - api feature: api/$FEATURE"
echo " - endpoint base: $FEATURE_PATH"

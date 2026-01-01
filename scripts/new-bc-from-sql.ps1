param(
  [Parameter(Mandatory=$true)][string]$BcName,
  [Parameter(Mandatory=$true)][string]$SqlFile,
  [string]$Prefix = "adm_",
  [string]$Schema = "sagnus",
  [string]$PackageSuffix = ""
)

$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $root

# 1) criar BC via script existente (new-bc.ps1)
$newBcScript = Join-Path $PSScriptRoot "new-bc.ps1"
if (-not (Test-Path $newBcScript)) {
  throw "Não achei scripts/new-bc.ps1."
}

$pkgArg = @()
if ($PackageSuffix -and $PackageSuffix.Trim().Length -gt 0) {
  $pkgArg = @("-PackageSuffix", $PackageSuffix)
}

& $newBcScript -BcName $BcName @pkgArg

$moduleDir = Join-Path $root ("sagnus-bc-" + $BcName)
if (-not (Test-Path $moduleDir)) {
  throw "Módulo não encontrado após criação: $moduleDir"
}

# 2) gerar migration Flyway com as tabelas do prefixo (+ índices/constraints/comments)
$migDir = Join-Path $moduleDir "src\main\resources\db\migration"
New-Item -ItemType Directory -Force -Path $migDir | Out-Null

$ts = Get-Date -Format "yyyyMMddHHmmss"
$outMig = Join-Path $migDir ("V" + $ts + "__init_" + $BcName + "_" + $Prefix.TrimEnd('_') + "_schema.sql")

$py = "python"
$extractor = Join-Path $PSScriptRoot "tools\extract_ddl.py"
if (-not (Test-Path $extractor)) {
  throw "Não achei scripts/tools/extract_ddl.py."
}
if (-not (Test-Path $SqlFile)) {
  throw "Arquivo SQL não encontrado: $SqlFile"
}

& $py $extractor --in $SqlFile --prefix $Prefix --out $outMig --schema $Schema

# 3) resumo
$readme = Join-Path $moduleDir "BC_FROM_SQL.md"
@"
# BC $BcName - Gerado a partir de SQL

- Fonte DDL: $SqlFile
- Prefixo de tabelas: $Prefix
- Schema (search_path): $Schema
- Migration gerada:
  - $outMig

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
"@ | Set-Content -Encoding UTF8 $readme

Write-Host "OK: BC criado em $moduleDir"
Write-Host "OK: Migration criada em $outMig"

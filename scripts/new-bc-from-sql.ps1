param(
  [Parameter(Mandatory=$true)][string]$BcName,
  [Parameter(Mandatory=$true)][string]$SqlFile,
  [string]$Prefix = "adm_",
  [string]$Schema = "sagnus",
  [string]$PackageSuffix = "",
  [switch]$WithContracts,
  [switch]$NoContracts,
  [switch]$WithContractsPorts,
  [switch]$NoContractsPorts,
  [switch]$WithGatewayGraphqlStub,
  [switch]$NoGatewayGraphqlStub,
  [switch]$WithFlyway,
  [switch]$NoFlyway
)

$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $root

# defaults
$createFlyway = $true
if ($NoFlyway) { $createFlyway = $false }
elseif ($WithFlyway) { $createFlyway = $true }

# chama new-bc.ps1 repassando flags relevantes
$cmd = @(
  (Join-Path $PSScriptRoot "new-bc.ps1"),
  "-BcName", $BcName,
  "-PackageSuffix", $PackageSuffix,
  "-Feature", $BcName
)

if ($WithContracts) { $cmd += "-WithContracts" }
if ($NoContracts) { $cmd += "-NoContracts" }
if ($WithContractsPorts) { $cmd += "-WithContractsPorts" }
if ($NoContractsPorts) { $cmd += "-NoContractsPorts" }
if ($WithGatewayGraphqlStub) { $cmd += "-WithGatewayGraphqlStub" }
if ($NoGatewayGraphqlStub) { $cmd += "-NoGatewayGraphqlStub" }
if ($WithFlyway) { $cmd += "-WithFlyway" }
if ($NoFlyway) { $cmd += "-NoFlyway" }

& @cmd

if (-not (Test-Path $SqlFile)) {
  $candidate = Join-Path $root $SqlFile
  if (Test-Path $candidate) { $SqlFile = $candidate }
}
if (-not (Test-Path $SqlFile)) { throw "SQL não encontrado: $SqlFile" }

if ($createFlyway) {
  $bcFolder = Join-Path $root ("sagnus-bc-" + $BcName)
  $migDir = Join-Path $bcFolder "src/main/resources/db/migration"
  New-Item -ItemType Directory -Force -Path $migDir | Out-Null

  $ts = Get-Date -Format "yyyyMMddHHmmss"
  $outFile = Join-Path $migDir ("V{0}__init_{1}_{2}_schema.sql" -f $ts, $BcName, ($Prefix.TrimEnd('_')))

  $extractor = Join-Path $PSScriptRoot "tools/extract_ddl.py"
  if (Test-Path $extractor) {
    try {
      python $extractor --input $SqlFile --output $outFile --schema $Schema --prefix $Prefix | Out-Null
    } catch {
      # fallback
    }
  }
  if (-not (Test-Path $outFile) -or ((Get-Item $outFile).Length -eq 0)) {
    Copy-Item -Force $SqlFile $outFile
  }

  Write-Host "OK: migration gerada: $outFile"
} else {
  Write-Host "INFO: -NoFlyway: migration NÃO gerada"
}

Write-Host "OK: BC criado a partir do SQL: $BcName"

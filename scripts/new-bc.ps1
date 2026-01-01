param(
  [Parameter(Mandatory=$true)][string]$BcName,
  [string]$PackageSuffix = "",
  [string]$Feature = ""
)

$ErrorActionPreference = "Stop"

function To-PascalCase([string]$s) {
  if (-not $s) { return $s }
  $parts = $s -split '[-_\.]'
  ($parts | ForEach-Object { if ($_.Length -gt 0) { $_.Substring(0,1).ToUpper() + $_.Substring(1) } }) -join ''
}

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $root

if (-not $Feature -or $Feature.Trim().Length -eq 0) { $Feature = $BcName }

$bcFolder = "sagnus-bc-$BcName"
$templateFolder = "sagnus-bc-template"

if (-not (Test-Path $templateFolder)) {
  throw "Template não encontrado: $templateFolder"
}
if (Test-Path $bcFolder) {
  throw "Módulo já existe: $bcFolder"
}

# 1) Copia template
Copy-Item $templateFolder $bcFolder -Recurse

# 2) Ajusta artifactId
$pom = Join-Path $bcFolder "pom.xml"
(Get-Content $pom -Raw) `
  -replace "<artifactId>$templateFolder</artifactId>", "<artifactId>$bcFolder</artifactId>" `
  | Set-Content -Encoding UTF8 $pom

# 3) Base package
$basePkg = "com.slifesys.sagnus"
$srcBase = Join-Path $bcFolder "src\main\java"
$testBase = Join-Path $bcFolder "src\test\java"

if ($PackageSuffix -and $PackageSuffix.Trim().Length -gt 0) {
  $newPkg = "$basePkg.$PackageSuffix"
} else {
  $newPkg = "$basePkg.$BcName"
}

# Template package (assumido)
$templatePkg = "$basePkg.template"

# Move diretórios do package raiz
function Move-PackageTree([string]$javaRoot, [string]$fromPkg, [string]$toPkg) {
  $fromPath = Join-Path $javaRoot ($fromPkg -replace '\.', '\')
  $toPath   = Join-Path $javaRoot ($toPkg -replace '\.', '\')

  if (-not (Test-Path $fromPath)) { return }

  New-Item -ItemType Directory -Force -Path (Split-Path $toPath) | Out-Null
  Move-Item -Path $fromPath -Destination $toPath -Force
}

Move-PackageTree $srcBase  $templatePkg $newPkg
Move-PackageTree $testBase $templatePkg $newPkg

# Replace package/imports em todos os .java
Get-ChildItem $bcFolder -Recurse -File -Include *.java | ForEach-Object {
  (Get-Content $_.FullName -Raw) `
    -replace [regex]::Escape($templatePkg), $newPkg `
    | Set-Content -Encoding UTF8 $_.FullName
}

# Ajusta spring.application.name e rota /v1/template
$featurePath = "/v1/$BcName"
Get-ChildItem $bcFolder -Recurse -File -Include *.java,*.yml,*.yaml,*.properties | ForEach-Object {
  $txt = Get-Content $_.FullName -Raw
  $txt = $txt -replace "spring\.application\.name:\s*template", "spring.application.name: $BcName"
  $txt = $txt -replace "/v1/template", $featurePath
  $txt | Set-Content -Encoding UTF8 $_.FullName
}

# API vertical: renomeia api/example -> api/<feature> e classe ExampleController -> <FeaturePascal>Controller
$featurePascal = To-PascalCase $Feature

$apiDir = Join-Path $srcBase ($newPkg -replace '\.', '\')
$apiExamplePath = Join-Path $apiDir "api\example"
$apiFeaturePath = Join-Path $apiDir ("api\" + $Feature)

if (Test-Path $apiExamplePath) {
  New-Item -ItemType Directory -Force -Path (Split-Path $apiFeaturePath) | Out-Null
  Move-Item -Path $apiExamplePath -Destination $apiFeaturePath -Force
}

# Renomeia arquivos/classe ExampleController -> <FeaturePascal>Controller (se existir)
Get-ChildItem $bcFolder -Recurse -File -Include *ExampleController.java | ForEach-Object {
  $newName = ($featurePascal + "Controller.java")
  Rename-Item -Path $_.FullName -NewName $newName -Force
}

# Troca nomes dentro do código (classe e referências)
Get-ChildItem $bcFolder -Recurse -File -Include *.java | ForEach-Object {
  $raw = Get-Content $_.FullName -Raw
  $raw = $raw -replace "\bExampleController\b", ($featurePascal + "Controller")
  $raw = $raw -replace "\.api\.example\b", (".api." + $Feature)
  $raw | Set-Content -Encoding UTF8 $_.FullName
}

Write-Host "OK: criado $bcFolder"
Write-Host " - package base: $newPkg"
Write-Host " - api feature: api/$Feature"
Write-Host " - endpoint base: $featurePath"

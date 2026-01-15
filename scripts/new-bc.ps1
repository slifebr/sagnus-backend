param(
  [Parameter(Mandatory=$true)][string]$BcName,
  [string]$PackageSuffix = "",
  [string]$Feature = "",
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

function To-PascalCase([string]$s) {
  if (-not $s) { return $s }
  $parts = $s -split '[-_\.]'
  ($parts | ForEach-Object {
    if ($_.Length -gt 0) { $_.Substring(0,1).ToUpper() + $_.Substring(1) }
  }) -join ''
}

function Add-ModuleToPom([string]$PomPath, [string]$ModuleName) {
  $pom = Get-Content -Raw -Encoding UTF8 $PomPath
  if ($pom -notmatch "<module>$([regex]::Escape($ModuleName))</module>") {
    $pom = $pom -replace "(?s)</modules>", "`n        <module>$ModuleName</module>`n    </modules>"
  }
  $pom | Set-Content -Encoding UTF8 $PomPath
}

# Defaults
if (-not $Feature) { $Feature = $BcName }

$createContracts = $true
if ($NoContracts) { $createContracts = $false }
elseif ($WithContracts) { $createContracts = $true }

$createContractsPorts = $false
if ($NoContractsPorts) { $createContractsPorts = $false }
elseif ($WithContractsPorts) { $createContractsPorts = $true }

$createGatewayStub = $false
if ($NoGatewayGraphqlStub) { $createGatewayStub = $false }
elseif ($WithGatewayGraphqlStub) { $createGatewayStub = $true }

$createFlyway = $true
if ($NoFlyway) { $createFlyway = $false }
elseif ($WithFlyway) { $createFlyway = $true }

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $root

$templateFolder = Join-Path $root "sagnus-bc-template"
$contractsTemplateFolder = Join-Path $root "sagnus-bc-contracts-template"
$pomPath = Join-Path $root "pom.xml"

$bcFolder = Join-Path $root ("sagnus-bc-" + $BcName)
$contractsFolder = Join-Path $root ("sagnus-bc-" + $BcName + "-contracts")

if (Test-Path $bcFolder) { throw "Já existe: $bcFolder" }
if ($createContracts -and (Test-Path $contractsFolder)) { throw "Já existe: $contractsFolder" }

# base package
$basePkg = ("com.slifesys.sagnus." + ($BcName -replace "-", "."))
if ($PackageSuffix) { $basePkg = ("com.slifesys.sagnus." + $PackageSuffix) }

# 1) BC principal
Copy-Item -Recurse -Force $templateFolder $bcFolder

# replace placeholders in files
Get-ChildItem -Recurse -File $bcFolder | ForEach-Object {
  (Get-Content -Raw -Encoding UTF8 $_.FullName) `
    -replace "sagnus-bc-template", ("sagnus-bc-" + $BcName) `
    -replace "com\.slifesys\.sagnus\.template", $basePkg `
    -replace "api/example", ("api/" + $Feature) |
    Set-Content -Encoding UTF8 $_.FullName
}

# move package folder
$oldPkgDir = Join-Path $bcFolder "src/main/java/com/slifesys/sagnus/template"
$newPkgDir = Join-Path $bcFolder ("src/main/java/" + ($basePkg -replace "\.", "/"))
if (Test-Path $oldPkgDir) {
  New-Item -ItemType Directory -Force -Path (Split-Path $newPkgDir) | Out-Null
  Move-Item -Force $oldPkgDir $newPkgDir
}

# move api/example -> api/<feature>
$exampleDir = Join-Path $newPkgDir "api/example"
if (Test-Path $exampleDir) {
  $featureDir = Join-Path $newPkgDir ("api/" + $Feature)
  New-Item -ItemType Directory -Force -Path $featureDir | Out-Null
  Get-ChildItem -File $exampleDir | Move-Item -Destination $featureDir -Force
  Remove-Item $exampleDir -Force -Recurse
}

# rename ExampleController -> <Feature>Controller
$featurePascal = To-PascalCase $Feature
$exampleController = Join-Path $newPkgDir ("api/" + $Feature + "/ExampleController.java")
$targetController  = Join-Path $newPkgDir ("api/" + $Feature + "/" + $featurePascal + "Controller.java")
if (Test-Path $exampleController -and -not (Test-Path $targetController)) {
  Move-Item -Force $exampleController $targetController
}
if (Test-Path $targetController) {
  (Get-Content -Raw -Encoding UTF8 $targetController) `
    -replace "class ExampleController", ("class " + $featurePascal + "Controller") |
    Set-Content -Encoding UTF8 $targetController
}

# Flyway folder opcional
if ($createFlyway) {
  $migDir = Join-Path $bcFolder "src/main/resources/db/migration"
  New-Item -ItemType Directory -Force -Path $migDir | Out-Null
  $keep = Join-Path $migDir ".keep"
  if (-not (Test-Path $keep)) { "# keep" | Set-Content -Encoding UTF8 $keep }
}

Add-ModuleToPom $pomPath ("sagnus-bc-" + $BcName)

# 2) Contracts
if ($createContracts) {
  if (-not (Test-Path $contractsTemplateFolder)) { throw "Contracts template não encontrado: $contractsTemplateFolder" }
  Copy-Item -Recurse -Force $contractsTemplateFolder $contractsFolder

  Get-ChildItem -Recurse -File $contractsFolder | ForEach-Object {
    (Get-Content -Raw -Encoding UTF8 $_.FullName) `
      -replace "sagnus-bc-contracts-template", ("sagnus-bc-" + $BcName + "-contracts") `
      -replace "com\.slifesys\.sagnus\.template", $basePkg |
      Set-Content -Encoding UTF8 $_.FullName
  }

  $oldCPkgDir = Join-Path $contractsFolder "src/main/java/com/slifesys/sagnus/template"
  $newCPkgDir = Join-Path $contractsFolder ("src/main/java/" + ($basePkg -replace "\.", "/"))
  if (Test-Path $oldCPkgDir) {
    New-Item -ItemType Directory -Force -Path (Split-Path $newCPkgDir) | Out-Null
    Move-Item -Force $oldCPkgDir $newCPkgDir
  }

  if ($createContractsPorts) {
    $bcPascal = To-PascalCase $BcName
    $portDir = Join-Path $newCPkgDir "contract/core"
    New-Item -ItemType Directory -Force -Path $portDir | Out-Null

    @"
package $basePkg.contract.core;

import java.util.Optional;

/**
 * Port de consulta do BC $($BcName.ToUpper()).
 * Outros BCs dependem APENAS deste contrato.
 *
 * Obs.: ajuste nomes/assuntos conforme o domínio real do BC.
 */
public interface $bcPascal`QueryPort {
    Optional<ResumoDTO> obterResumoPorId(Long id);
    Optional<ResumoDTO> obterResumoPorCodigo(String codigo);
}
"@ | Set-Content -Encoding UTF8 (Join-Path $portDir ($bcPascal + "QueryPort.java"))

    @"
package $basePkg.contract.core;

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
"@ | Set-Content -Encoding UTF8 (Join-Path $portDir "ResumoDTO.java")
  }

  Add-ModuleToPom $pomPath ("sagnus-bc-" + $BcName + "-contracts")
}

# 3) Stub GraphQL no gateway
if ($createGatewayStub) {
  # Organização: resources/graphql/<bc>/*.graphqls
  $gqlRoot = Join-Path $root "sagnus-api-gateway/src/main/resources/graphql"
  $gqlDir  = Join-Path $gqlRoot $BcName
  $javaDir = Join-Path $root "sagnus-api-gateway/src/main/java/com/slifesys/sagnus/graphql/bc"
  New-Item -ItemType Directory -Force -Path $gqlDir | Out-Null
  New-Item -ItemType Directory -Force -Path $javaDir | Out-Null

  @"
"""Queries (stub) do BC $BcName no Gateway GraphQL (BFF fino)."""

extend type Query {
  ${BcName}Ping: String!
}
"@ | Set-Content -Encoding UTF8 (Join-Path $gqlDir ($BcName + ".queries.graphqls"))

  @"
"""Mutations (stub) do BC $BcName no Gateway GraphQL (BFF fino)."""

extend type Mutation {
  ${BcName}PingMut: String!
}
"@ | Set-Content -Encoding UTF8 (Join-Path $gqlDir ($BcName + ".mutations.graphqls"))

  @"
"""Types (stub) do BC $BcName no Gateway GraphQL (BFF fino)."""

# Adicione aqui inputs/enums/types específicos do BC.
"@ | Set-Content -Encoding UTF8 (Join-Path $gqlDir ($BcName + ".types.graphqls"))

  $bcPascal = To-PascalCase $BcName
  @"
package com.slifesys.sagnus.graphql.bc;

import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

/**
 * Stub inicial do BC $BcName no Gateway GraphQL (BFF fino).
 * Substitua/adapte para chamar use cases/ports reais do BC.
 */
@Controller
public class ${bcPascal}GraphqlStubController {

    @QueryMapping(name = "${BcName}Ping")
    public String ping() {
        return "OK";
    }

    @MutationMapping(name = "${BcName}PingMut")
    public String pingMut() {
        return "OK";
    }
}
"@ | Set-Content -Encoding UTF8 (Join-Path $javaDir ($bcPascal + "GraphqlStubController.java"))
}

Write-Host "OK: criado $bcFolder"
Write-Host " - package base: $basePkg"
Write-Host " - api feature: api/$Feature"
Write-Host " - contracts: $createContracts"
Write-Host " - contracts ports: $createContractsPorts"
Write-Host " - flyway folder: $createFlyway"
Write-Host " - gateway graphql stub: $createGatewayStub"
Write-Host "OK: atualizado pom: $pomPath"

\
        param(
          [Parameter(Mandatory=$true)]
          [string]$BcName
        )

        $ErrorActionPreference = "Stop"

        function To-ModuleName([string]$name) {
          $n = $name.Trim().ToLower()
          return "sagnus-bc-$n"
        }

        $root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
        $moduleName = To-ModuleName $BcName
        $modulePath = Join-Path $root $moduleName
        $pomPath = Join-Path $root "pom.xml"

        if (!(Test-Path $pomPath)) {
          Write-Error "Não encontrei pom.xml na raiz: $pomPath"
        }

        if (!(Test-Path $modulePath)) {
          Write-Error "Módulo não encontrado: $modulePath"
        }

        Write-Host "Removendo módulo: $moduleName"

        # 1) Remover pasta do módulo
        Remove-Item -Recurse -Force $modulePath

        # 2) Remover entrada do <modules> no pom.xml raiz
        $pom = Get-Content -Raw -Path $pomPath -Encoding UTF8
        $pattern = "<module>\s*$moduleName\s*</module>\s*"
        if ($pom -match $pattern) {
          $pom = [regex]::Replace($pom, $pattern, "", "IgnoreCase")
          Set-Content -Path $pomPath -Value $pom -Encoding UTF8
          Write-Host "Atualizado: removido <module>$moduleName</module> do pom.xml raiz."
        } else {
          Write-Warning "Não achei <module>$moduleName</module> no pom.xml. Verifique manualmente."
        }

        Write-Host "OK. Agora rode: mvn -q -DskipTests clean verify"

# Scripts

## new-bc.ps1
Cria um novo Bounded Context a partir de `sagnus-bc-template`.

Exemplos:

```powershell
# padrão: package vira com.slifesys.sagnus.<bcname sem hífen>
./scripts/new-bc.ps1 -BcName estoque

# definindo sufixo do package explicitamente
./scripts/new-bc.ps1 -BcName fiscal-nfe -PackageSuffix fiscal.nfe
```

## new-bc.sh
Versão Bash (Linux/macOS):

```bash
./scripts/new-bc.sh estoque
./scripts/new-bc.sh fiscal-nfe fiscal.nfe
```


> Opcional: você pode informar um `Feature` (nome do pacote da API) diferente do nome do BC.
> Por padrão, o feature = bcName.

Exemplo (PowerShell):
```powershell
./scripts/new-bc.ps1 -BcName fiscal-nfe -PackageSuffix fiscal.nfe -Feature nfe
```

Exemplo (Bash):
```bash
./scripts/new-bc.sh fiscal-nfe fiscal.nfe nfe
```


## Remover um Bounded Context (delete-bc)

> Remove a pasta do módulo `sagnus-bc-<bcname>` e também retira o `<module>` correspondente do `pom.xml` raiz.

**Windows (PowerShell):**
```powershell
.\scripts\delete-bc.ps1 -BcName estoque
```

**Linux/macOS (Bash):**
```bash
./scripts/delete-bc.sh estoque
```

Após remover, valide:
```bash
mvn -q -DskipTests clean verify
```


## new-bc-from-sql.ps1 / new-bc-from-sql.sh
Cria um novo BC a partir do `sagnus-bc-template` e também gera uma migration Flyway inicial extraída de um DDL `.sql`,
filtrando por prefixo de tabela (ex.: `adm_`).

Exemplos (PowerShell):

```powershell
./scripts/new-bc-from-sql.ps1 -BcName adm -SqlFile .\base_1221.sql -Prefix adm_ -Schema sagnus
```

Exemplos (Bash):

```bash
./scripts/new-bc-from-sql.sh adm ./base_1221.sql adm_ sagnus
```

### extract_ddl.py
O extrator fica em `scripts/tools/extract_ddl.py` e inclui:
- CREATE TABLE (prefixo)
- ALTER TABLE ... ADD CONSTRAINT
- CREATE INDEX / CREATE UNIQUE INDEX
- COMMENT ON TABLE/COLUMN
- SEQUENCES relevantes (quando aplicável)

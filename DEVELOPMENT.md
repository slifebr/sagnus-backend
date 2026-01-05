# Sagnus ERP — Development Guide (DEVELOPMENT.md)

Data: 2025-12-16

Este guia é o **onboarding técnico** do repositório Sagnus ERP (Maven multi-módulo, DDD/BCs).
O objetivo é permitir que qualquer dev rode o projeto localmente com o mínimo de fricção.

---

## 1) Pré-requisitos

- **JDK 21** (recomendado: Temurin/Adoptium)
- **Maven 3.9+**
- **PostgreSQL 14+** (ou versão usada no seu ambiente)
- (Opcional) IntelliJ IDEA

Verificação rápida:
```bash
java -version
mvn -version
psql --version
```

---

## 2) Estrutura do repositório (resumo)

- `sagnus-bc-corp` / `sagnus-bc-corp-contracts`
- `sagnus-bc-auth`
- `sagnus-bc-nfe`
- `sagnus-platform-security`
- `sagnus-platform-web`
- `sagnus-shared-api-error`

> **Regra:** BC consome outro BC apenas por contrato (`*-api`) ou integração (HTTP/mensageria).

---

## 3) Build e comandos Maven

### 3.1 Compilar tudo
```bash
mvn clean install
```

### 3.2 Compilar 1 módulo + dependências
```bash
mvn -pl sagnus-bc-auth -am clean test -DskipTests
```

### 3.3 Instalar contrato CORP (quando o IDE “não enxerga”)
```bash
mvn -pl sagnus-bc-corp-contracts clean install
```

---

## 4) Configuração de ambiente (segredos e senhas)

### 4.1 Nunca commitar senha no `application.yml`
Padronize por **environment variables**.

Exemplos (Windows PowerShell):
```powershell
setx SAGNUS_DB_URL "jdbc:postgresql://localhost:5432/sagnus"
setx SAGNUS_DB_USER "postgres"
setx SAGNUS_DB_PASS "suaSenhaAqui"

setx SAGNUS_JWT_SECRET "um-segredo-longo-com-32+chars"
setx SAGNUS_AUTH_PORT "8083"
```

Exemplos (bash):
```bash
export SAGNUS_DB_URL="jdbc:postgresql://localhost:5432/sagnus"
export SAGNUS_DB_USER="postgres"
export SAGNUS_DB_PASS="suaSenhaAqui"

export SAGNUS_JWT_SECRET="um-segredo-longo-com-32+chars"
export SAGNUS_AUTH_PORT="8083"
```

> Para ambientes reais, depois migramos para **Vault/KMS/Secrets do CI**.

---

## 5) Banco de dados

### 5.1 Criar database
```sql
CREATE DATABASE sagnus;
```

### 5.2 Seeds (AUTH)
O módulo AUTH costuma ter um seed para um admin inicial, exemplo:
- `sagnus-bc-auth/db/seed_auth_admin.sql`

Execute no PostgreSQL (psql):
```bash
psql -d sagnus -U postgres -f sagnus-bc-auth/db/seed_auth_admin.sql
```

> Caso o schema/tabelas ainda não existam, primeiro aplicaremos migrações (Flyway/Liquibase) numa etapa futura.

---

## 6) Rodando os BCs

### 6.1 Rodar AUTH
Exemplo:
```bash
mvn -pl sagnus-bc-auth spring-boot:run
```

Endpoints principais:
- `POST /auth/login`
- `POST /auth/refresh`
- `GET  /auth/me`

### 6.2 Rodar CORP / NFe
Quando os módulos tiverem `SpringBootApplication` e infra completa,
o processo é o mesmo:
```bash
mvn -pl sagnus-bc-corp spring-boot:run
mvn -pl sagnus-bc-nfe spring-boot:run
```

---

## 7) Fluxo mínimo de teste (AUTH)

### 7.1 Login
```bash
curl -X POST http://localhost:8083/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"Admin@123"}'
```

### 7.2 Me (com token)
```bash
curl http://localhost:8083/auth/me \
  -H "Authorization: Bearer <ACCESS_TOKEN_AQUI>"
```

---

## 8) IntelliJ (dicas anti-“BurroJ” 😄)

- Abra o projeto **pela raiz** (onde está o `pom.xml` pai).
- Use **Maven → Reload All Maven Projects** após mudar módulos/deps.
- Se o IDE “insistir” em erro que o Maven não tem:
  - feche e reabra o projeto
  - ou faça *Invalidate Caches / Restart*

---

## 9) Padrão de branches (sugestão)

- `main`: estável
- `develop`: integração
- `feature/<bc>-<tema>`: ex. `feature/nfe-domain-items`
- `hotfix/<tema>`: correção urgente

---

## 10) Commits (padrão adotado)

Conventional Commits:
- `feat(bc-nfe): ...`
- `refactor(bc-auth): ...`
- `docs: ...`
- `chore: ...`

Exemplo:
```text
feat(bc-nfe): add pure domain and EmitirNfeUseCase foundation
```

---

## 11) Troubleshooting

### 11.1 “Package does not exist” em módulo contrato
- Garanta que `sagnus-bc-corp-contracts` está em `<modules>` do POM pai
- Rode:
```bash
mvn -pl sagnus-bc-corp-contracts clean install
```
- Recarregue o Maven no IDE

### 11.2 Falha por senha Postgres
- Ajuste `SAGNUS_DB_PASS` no ambiente
- Evite senha hardcoded em `application.yml`

---


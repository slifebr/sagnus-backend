# API Gateway - Controllers REST

**Data:** 2026-01-21  
**Status:** Implementado  
**Contexto:** Adição de controllers REST no Gateway para facilitar integração frontend

---

## Visão Geral

O `sagnus-api-gateway` agora expõe endpoints REST que delegam para UseCases dos BCs, seguindo o padrão **Edge/BFF** e respeitando **ADR-0011**.

## Conformidade com ADRs

### ✅ ADR-0011: API Gateway — Agregação Read-Only

**O que foi implementado:**
- Controllers REST que **apenas delegam** para UseCases dos BCs
- **Sem lógica de domínio** no Gateway
- **Sem persistência própria** no Gateway
- Apenas **routing/agregação** (Edge/BFF pattern)

**Exemplo:**

```java
@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthGatewayController {
    private final AutenticarUseCase autenticarUseCase; // Do BC-AUTH
    
    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest req) {
        // Apenas delega para o UseCase do BC-AUTH
        return ResponseEntity.ok(
            autenticarUseCase.execute(req.getUsername(), req.getPassword())
        );
    }
}
```

### ✅ ADR-0003: Contratos entre BCs

**O que foi implementado:**
- Gateway depende de **UseCases** dos BCs via injeção de dependência
- Comunicação **in-process** (mesmo monorepo)
- **Sem acoplamento direto** ao domínio ou persistência dos BCs

---

## Controllers Implementados

### 1. AuthGatewayController

**Endpoint:** `/auth/*`  
**BC:** `sagnus-bc-auth`  
**Porta Gateway:** `8080`

**Endpoints:**
- `POST /auth/login` → `AutenticarUseCase`
- `POST /auth/refresh` → `RefreshTokenUseCase`
- `GET /auth/me` → `ObterUsuarioResumoUseCase`

**Responsabilidade:** Apenas delega para BC-AUTH

### 2. AdmGatewayController

**Endpoint:** `/api/v1/adm/*`  
**BC:** `sagnus-bc-adm`  
**Porta Gateway:** `8080`

**Endpoints:**

**Parâmetros:**
- `GET /api/v1/adm/parametros` → `GetParametrosUseCase`
- `PUT /api/v1/adm/parametros` → `UpsertParametrosUseCase`

**Módulos:**
- `GET /api/v1/adm/modulos` → `ListModulosUseCase`
- `POST /api/v1/adm/modulos` → `CreateModuloUseCase`

**Agenda:**
- `GET /api/v1/adm/agenda/categorias` → `ListCategoriasUseCase`
- `POST /api/v1/adm/agenda/categorias` → `CreateCategoriaUseCase`
- `GET /api/v1/adm/agenda/compromissos` → `ListCompromissosUseCase`
- `POST /api/v1/adm/agenda/compromissos` → `CreateCompromissoUseCase`

**Responsabilidade:** Apenas delega para BC-ADM

---

## Dependências Adicionadas

### pom.xml do Gateway

```xml
<!-- BC-AUTH para endpoints REST -->
<dependency>
    <groupId>com.slifesys.sagnus</groupId>
    <artifactId>sagnus-bc-auth</artifactId>
    <version>${project.version}</version>
</dependency>

<!-- BC-ADM para endpoints REST -->
<dependency>
    <groupId>com.slifesys.sagnus</groupId>
    <artifactId>sagnus-bc-adm</artifactId>
    <version>${project.version}</version>
</dependency>

<!-- Spring Web MVC para REST (além de WebFlux para GraphQL) -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>
```

---

## Configuração

### application.yml

```yaml
server:
  port: ${SAGNUS_GATEWAY_PORT:8080}  # Porta unificada
```

### Banco de Dados

O Gateway **não** acessa banco diretamente. Os UseCases dos BCs (injetados) cuidam da persistência.

---

## Como Usar

### Opção 1: BCs Standalone (desenvolvimento)

```bash
# Terminal 1
mvn -pl sagnus-bc-auth -am spring-boot:run
# → localhost:8080 (AUTH)

# Terminal 2
mvn -pl sagnus-bc-adm -am spring-boot:run
# → localhost:8083 (ADM)
```

**Frontend:** configurar URLs separadas em `app-config.ts`

```typescript
authBaseUrl: 'http://localhost:8080',
admBaseUrl: 'http://localhost:8083',
```

### Opção 2: Gateway Unificado (produção)

```bash
# Terminal único
mvn -pl sagnus-api-gateway -am spring-boot:run
# → localhost:8080 (Gateway + GraphQL + REST)
```

**Frontend:** configurar mesma URL em `app-config.ts`

```typescript
authBaseUrl: 'http://localhost:8080',
admBaseUrl: 'http://localhost:8080',
```

---

## Vantagens

### Para Desenvolvimento
- **Flexibilidade:** pode rodar BCs individualmente ou via Gateway
- **Debug:** mais fácil debugar BCs standalone
- **Performance:** sem overhead de routing no dev

### Para Produção
- **Single endpoint:** frontend consome tudo de `localhost:8080`
- **CORS simplificado:** um único origin
- **Deploy unificado:** Gateway + todos os BCs em um único JAR
- **GraphQL + REST:** ambos disponíveis no mesmo endereço

---

## Limitações e Trade-offs

### Acoplamento In-Process
- Gateway depende diretamente dos BCs (Maven dependencies)
- Não há isolamento de deploy (todos no mesmo JAR)
- **Solução futura:** trocar por HTTP/gRPC quando migrar para microservices

### Compatibilidade Web MVC + WebFlux
- Gateway agora tem **ambos** (MVC para REST, Flux para GraphQL)
- Funciona, mas aumenta complexidade
- **Trade-off aceitável:** facilita integração frontend

---

## Conformidade ADR

| ADR | Status | Comentário |
|-----|--------|-----------|
| **ADR-0011** | ✅ CONFORME | Gateway apenas delega, sem domínio próprio |
| **ADR-0003** | ✅ CONFORME | Usa contratos Java in-process |
| **ADR-0004** | ✅ CONFORME | Domínio puro preservado nos BCs |

---

## Próximos Passos

### Curto Prazo
- [ ] Adicionar endpoints CORP (pessoas, produtos)
- [ ] Adicionar endpoint NFe (emitir nota)
- [ ] CORS configurável por ambiente

### Médio Prazo
- [ ] Cache Redis para queries frequentes
- [ ] Rate limiting por endpoint
- [ ] Métricas por BC (Micrometer)

### Longo Prazo
- [ ] Migrar para comunicação HTTP entre Gateway e BCs
- [ ] Service discovery (Consul/Eureka)
- [ ] Circuit breaker (Resilience4j)

---

## Referências

- [ADR-0011: API Gateway Agregação Read-Only](adr/ADR-0011-api-gateway-agregacao-read-only.md)
- [ADR-0003: Contratos API Java entre BCs](adr/ADR-0003-contratos-api-java-entre-bcs.md)
- [Frontend README](../frontend/README.md)

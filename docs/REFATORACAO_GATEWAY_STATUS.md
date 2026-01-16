# Status da Refatoração do sagnus-api-gateway

## ✅ O Que Foi Completado

### 1. sagnus-bc-corp (Backend)

✅ **PessoaRepository** - Adicionado método `findAll` com filtros  
✅ **ListarPessoasUseCase** - Criado Use Case para listagem paginada  
✅ **PessoaRepositoryAdapter** - Implementado método `findAll` usando Specification  
✅ **PessoaSpringDataRepository** - Adicionado `JpaSpecificationExecutor`

### 2. sagnus-api-gateway (Gateway)

✅ **PessoaGatewayMapper** - Criado mapper para converter entre DTOs  
✅ **GatewayPessoaController** - Refatorado para usar Use Cases do BC  
✅ **PessoaService** - Removido (duplicação)  
✅ **PessoaMapper** - Removido (substituído por PessoaGatewayMapper)

## ⚠️ Pendências Identificadas

### 1. Código Duplicado Ainda Existe

**Motivo:** `ClienteController` e `ClienteService` ainda usam código duplicado:

- ⚠️ `application/cadastro/pessoa/ClienteService.java` - **AINDA EM USO**
- ⚠️ `infrastructure/persistence/cadastro/pessoa/CadPessoa*` - **AINDA EM USO** (via ClienteService)
- ⚠️ `infrastructure/persistence/cadastro/pessoa/CadCliente*` - **AINDA EM USO**
- ⚠️ `domain/cadastro/pessoa/` - Pode estar indiretamente em uso

**Arquivos que PODEM ser removidos (sem dependências):**
- ❓ `infrastructure/persistence/cadastro/pessoa/PessoaDomainMapper.java` - Verificar se usado apenas por PessoaService (já removido)
- ❓ `infrastructure/persistence/cadastro/pessoa/PessoaSpecifications.java` - Verificar se usado apenas por PessoaService
- ❓ `infrastructure/persistence/cadastro/pessoa/repository/CadPessoaRepository.java` - Verificar se usado apenas por PessoaService

**Arquivos que NÃO PODEM ser removidos (ainda em uso):**
- ✅ `core/exception/BusinessException.java` - Usado por ClienteService e GatewayGlobalExceptionHandler
- ✅ `infrastructure/persistence/cadastro/pessoa/CadCliente*` - Usado por ClienteService
- ✅ `infrastructure/persistence/cadastro/pessoa/repository/CadPessoaRepository.java` - Usado por ClienteService

### 2. Campo Documento no PessoaDTO

**Problema:** `PessoaDTO` não tem campo `documento`, mas `CadastrarPessoaCommand` precisa.

**Status:** Mapper retorna `null` temporariamente (comentário indica ajuste necessário)

**Solução:** Adicionar campo `documento` ao `PessoaDTO` ou ajustar BC

### 3. ClienteController Precisa Refatoração

**Status:** `ClienteController` ainda usa `ClienteService` próprio

**Recomendação:** 
- Verificar se existe Use Cases de Cliente no `sagnus-bc-corp`
- Se não existir, criar Use Cases no BC
- Refatorar `ClienteController` para usar Use Cases do BC
- Depois remover `ClienteService` e código duplicado relacionado

## 📋 Próximos Passos Recomendados

### Opção 1: Remover Apenas o Seguro (Conservador)

1. Verificar se `PessoaDomainMapper` é usado apenas por PessoaService (já removido)
2. Verificar se `PessoaSpecifications` é usado apenas por PessoaService
3. Remover apenas os arquivos que não têm dependências
4. Deixar ClienteController para refatoração futura

### Opção 2: Refatorar ClienteController Agora (Completo)

1. Verificar/criar Use Cases de Cliente no sagnus-bc-corp
2. Refatorar ClienteController para usar Use Cases
3. Remover ClienteService
4. Remover todo código duplicado (domain/infrastructure)

### Opção 3: Manter Como Está (Parcial)

1. GatewayPessoaController já refatorado ✅
2. ClienteController permanece como está (para refatoração futura)
3. Código duplicado mantido (usado por ClienteController)

## 🎯 Status Atual

| Componente | Status | Observação |
|------------|--------|------------|
| GatewayPessoaController | ✅ Refatorado | Delega para Use Cases do BC |
| PessoaGatewayMapper | ✅ Criado | Converte DTOs do gateway ↔ BC |
| PessoaService | ✅ Removido | Substituído por Use Cases |
| ListarPessoasUseCase | ✅ Criado | No sagnus-bc-corp |
| ClienteController | ⚠️ Pendente | Ainda usa ClienteService |
| Código Duplicado | ⚠️ Parcial | Removido apenas do PessoaService |

## ✅ Benefícios Alcançados

1. ✅ **GatewayPessoaController** segue arquitetura DDD/Hexagonal
2. ✅ **Eliminação parcial de duplicação** (PessoaService removido)
3. ✅ **Lógica de Pessoa centralizada** no bc-corp
4. ✅ **Gateway não possui lógica própria** para Pessoa
5. ✅ **Facilita manutenção** e evolução

## 🔍 Validação

Para validar:
```bash
cd sagnus-api-gateway
mvn clean compile
mvn test
```

Testar endpoints:
- GET `/api/pessoas` (listar)
- GET `/api/pessoas/{id}` (buscar)
- POST `/api/pessoas` (criar)
- PUT `/api/pessoas/{id}` (atualizar)

## 📝 Decisão Necessária

**Escolher uma das opções:**
1. Remover apenas código seguro (conservador)
2. Refatorar ClienteController agora (completo)
3. Manter como está (parcial)

Qual abordagem deseja seguir?


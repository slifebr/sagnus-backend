# Refatoração Completa do sagnus-api-gateway

## ✅ O Que Foi Implementado

### 1. No sagnus-bc-corp

#### ✅ PessoaRepository (Porta)
- Adicionado método `findAll(String nomeFiltro, String tipoFiltro, Boolean ativaFiltro, Pageable pageable)`
- Implementado no `PessoaRepositoryAdapter` usando Specification do Spring Data JPA
- Adicionado `JpaSpecificationExecutor` ao `PessoaSpringDataRepository`

#### ✅ ListarPessoasUseCase
- Criado Use Case para listagem paginada com filtros
- Retorna `Page<PessoaResult>`
- Localização: `sagnus-bc-corp/src/main/java/com/slifesys/sagnus/corp/application/usecase/ListarPessoasUseCase.java`

### 2. No sagnus-api-gateway

#### ✅ PessoaGatewayMapper
- Criado mapper para converter entre DTOs do gateway e Commands/Results do BC
- Métodos:
  - `toDTO(PessoaResult)` - converte Result do BC para DTO do gateway
  - `toCadastrarCommand(PessoaDTO, String usuario)` - converte DTO para Command de criação
  - `toAlterarCommand(PessoaDTO, Long id)` - converte DTO para Command de alteração
- Localização: `sagnus-api-gateway/src/main/java/com/slifesys/sagnus/api/cadastro/pessoa/mapper/PessoaGatewayMapper.java`

#### ✅ GatewayPessoaController (Refatorado)
- **Substituído** o controller antigo pelo novo que delega para Use Cases do BC
- Métodos:
  - `listar()` - delega para `ListarPessoasUseCase`
  - `buscarPorId()` - delega para `ObterPessoaUseCase`
  - `criar()` - delega para `CadastrarPessoaUseCase`
  - `atualizar()` - delega para `AlterarPessoaUseCase`
  - `excluir()` - retorna NOT_IMPLEMENTED (Use Case não existe no BC)
- **Removido** dependência de `PessoaService`
- Localização: `sagnus-api-gateway/src/main/java/com/slifesys/sagnus/api/cadastro/pessoa/GatewayPessoaController.java`

#### ✅ Código Removido
- ❌ `application/cadastro/pessoa/PessoaService.java` - deletado
- ❌ `api/cadastro/pessoa/mapper/PessoaMapper.java` - deletado (substituído por PessoaGatewayMapper)
- ❌ `api/cadastro/pessoa/GatewayPessoaControllerRefatorado.java` - deletado (já substituído)

## ⚠️ Pendências

### 1. Campos do PessoaDTO

**Problema:** `PessoaDTO` não possui campo `documento`, mas `CadastrarPessoaCommand` requer.

**Solução Temporária:** 
- Mapper retorna `null` para documento (comentário indicando ajuste necessário)
- **Recomendação:** Adicionar campo `documento` ao `PessoaDTO` ou tornar opcional no BC

### 2. Código Duplicado Restante

Os seguintes packages ainda existem mas **não são mais usados** pelo `GatewayPessoaController`:

**Pode ser removido (usado apenas por PessoaService que foi deletado):**
- ❌ `domain/cadastro/pessoa/` - Domain models duplicados
  - `Pessoa.java`
  - `TipoPessoa.java`
- ❌ `infrastructure/persistence/cadastro/pessoa/` - JPA entities e repositories
  - `CadPessoa.java` e entidades relacionadas
  - `PessoaDomainMapper.java`
  - `CadPessoaRepository.java`
  - `PessoaSpecifications.java`

**AINDA ESTÁ EM USO (não remover agora):**
- ⚠️ `application/cadastro/pessoa/ClienteService.java` - usado por `ClienteController`
- ⚠️ `infrastructure/persistence/cadastro/pessoa/CadCliente.java` - usado por ClienteService
- ⚠️ `core/exception/BusinessException.java` - usado por ClienteService e GatewayGlobalExceptionHandler
- ⚠️ `domain/seguranca/UsuarioSistema.java` - precisa verificar uso
- ⚠️ `infrastructure/persistence/seguranca/UsuarioSistemaRepository.java` - precisa verificar uso

### 3. ClienteController

O `ClienteController` ainda usa `ClienteService`, que por sua vez usa:
- Domain models próprios
- Infrastructure/JPA próprios

**Recomendação:** Refatorar `ClienteController` da mesma forma (delegar para Use Cases do BC).

## 📋 Checklist de Limpeza (Próximos Passos)

### Alta Prioridade

- [ ] Adicionar campo `documento` ao `PessoaDTO` ou ajustar BC
- [ ] Remover `domain/cadastro/pessoa/` (Pessoa.java, TipoPessoa.java)
- [ ] Remover `infrastructure/persistence/cadastro/pessoa/CadPessoa*` (todas as entidades JPA)
- [ ] Remover `infrastructure/persistence/cadastro/pessoa/mapper/PessoaDomainMapper.java`
- [ ] Remover `infrastructure/persistence/cadastro/pessoa/repository/CadPessoaRepository.java`
- [ ] Remover `infrastructure/persistence/cadastro/pessoa/spec/PessoaSpecifications.java`

### Média Prioridade

- [ ] Substituir `BusinessException` (core) por `sagnus-shared-api-error` no GatewayGlobalExceptionHandler
- [ ] Verificar uso de `domain/seguranca/UsuarioSistema.java` e `infrastructure/persistence/seguranca/`
- [ ] Refatorar `ClienteController` para usar Use Cases do BC

### Baixa Prioridade

- [ ] Remover `core/exception/` se não for mais usado
- [ ] Documentar decisões arquiteturais

## 🎯 Resultado Final Esperado

```
sagnus-api-gateway/
├── api/                    # Controllers REST (delega para BCs)
│   ├── cadastro/
│   │   └── pessoa/
│   │       ├── GatewayPessoaController.java  ✅ Refatorado
│   │       ├── ClienteController.java        ⚠️ Pendente
│   │       ├── dto/
│   │       └── mapper/
│   │           └── PessoaGatewayMapper.java  ✅ Novo
│   └── error/
├── config/                 # Configurações
└── SagnusApplication.java

❌ Remover:
- application/              # Lógica vai para BCs
- domain/                   # Domain fica nos BCs  
- infrastructure/persistence/  # Persistência fica nos BCs
- core/exception/           # Usar sagnus-shared-api-error
```

## ✅ Benefícios Alcançados

1. ✅ **GatewayPessoaController** agora delega para Use Cases do BC
2. ✅ **Eliminação de duplicação** entre gateway e bc-corp (parcialmente)
3. ✅ **Arquitetura consistente** - gateway não possui lógica própria
4. ✅ **Lógica centralizada** no bc-corp
5. ✅ **Facilita manutenção** e evolução

## 🔍 Validação

Para validar a refatoração:
1. Compilar o projeto: `mvn clean compile`
2. Executar testes: `mvn test`
3. Testar endpoints do `GatewayPessoaController`:
   - GET `/api/pessoas` (listar)
   - GET `/api/pessoas/{id}` (buscar)
   - POST `/api/pessoas` (criar)
   - PUT `/api/pessoas/{id}` (atualizar)


# Proposta de Refatoração do sagnus-api-gateway

## 📋 Situação Atual

O `sagnus-api-gateway` possui estrutura completa que **viola a arquitetura DDD/Hexagonal**:

```
sagnus-api-gateway/
├── domain/          ❌ Domain models próprios (duplicação)
├── application/     ❌ Services com lógica de negócio
├── infrastructure/  ❌ JPA entities e repositories (acesso direto ao BD)
└── api/            ✅ Controllers (correto, mas usa services próprios)
```

**Problemas:**
- ❌ Duplicação de código com `sagnus-bc-corp`
- ❌ Violação da regra: "Um BC não acessa o banco do outro"
- ❌ Gateway tem lógica de negócio própria
- ❌ Gateway tem persistência própria

## 🎯 Objetivo

Transformar o gateway em um **agregador fino** que apenas:
1. Expõe endpoints REST unificados
2. Delega para Use Cases dos BCs
3. Faz mapeamento de DTOs (se necessário)
4. **NÃO** possui lógica de negócio
5. **NÃO** possui persistência
6. **NÃO** possui domain models

## 🔧 Solução Proposta

### Estrutura Nova

```
sagnus-api-gateway/
├── api/
│   ├── pessoa/
│   │   ├── PessoaGatewayController.java  # Delega para sagnus-bc-corp
│   │   └── dto/
│   │       └── PessoaGatewayDTO.java     # Se necessário (mapeamento)
│   └── error/
│       └── GatewayGlobalExceptionHandler.java
├── config/
│   └── SecurityConfig.java
└── SagnusApplication.java
```

### Passos de Implementação

#### 1. Verificar Use Cases disponíveis no `sagnus-bc-corp`

✅ Existentes:
- `ObterPessoaUseCase` - GET por ID
- `CadastrarPessoaUseCase` - POST
- `AlterarPessoaUseCase` - PUT

❌ Faltando:
- `ListarPessoasUseCase` - GET com paginação e filtros
- `ExcluirPessoaUseCase` - DELETE (se necessário)

#### 2. Criar Use Case faltante no `sagnus-bc-corp`

```java
// sagnus-bc-corp/src/main/java/.../ListarPessoasUseCase.java
@Service
public class ListarPessoasUseCase {
    private final PessoaRepository repo;
    
    public Page<PessoaResult> execute(String nome, String tipo, Boolean ativo, Pageable pageable) {
        // Implementação usando repository
    }
}
```

#### 3. Refatorar GatewayPessoaController

```java
@RestController
@RequestMapping("/api/pessoas")
public class PessoaGatewayController {
    
    private final ListarPessoasUseCase listarPessoas;      // do sagnus-bc-corp
    private final ObterPessoaUseCase obterPessoa;          // do sagnus-bc-corp
    private final CadastrarPessoaUseCase cadastrarPessoa;  // do sagnus-bc-corp
    private final AlterarPessoaUseCase alterarPessoa;      // do sagnus-bc-corp
    // private final ExcluirPessoaUseCase excluirPessoa;   // se necessário
    
    @GetMapping
    public Page<PessoaGatewayDTO> listar(...) {
        Page<PessoaResult> result = listarPessoas.execute(...);
        return result.map(this::toDTO);
    }
    
    // Outros métodos delegam para Use Cases...
}
```

#### 4. Remover código duplicado

**Deletar:**
- ❌ `application/cadastro/pessoa/PessoaService.java`
- ❌ `application/cadastro/pessoa/ClienteService.java`
- ❌ `infrastructure/persistence/` (todo o package)
- ❌ `domain/cadastro/pessoa/`
- ❌ `domain/seguranca/UsuarioSistema.java`
- ❌ `core/exception/BusinessException.java` (usar `sagnus-shared-api-error`)

#### 5. Ajustar dependências

O `pom.xml` do gateway já depende de `sagnus-bc-corp` ✅

## 📊 Comparação: Antes vs Depois

### Antes (❌ Violação)
```
Gateway → PessoaService → CadPessoaRepository (JPA) → Banco
                    ↓
                Domain (Pessoa, TipoPessoa)
```

### Depois (✅ Correto)
```
Gateway → Use Cases (sagnus-bc-corp) → Repository Port → Infrastructure → Banco
                                      ↓
                                  Domain (nos BCs)
```

## ⚠️ Considerações

1. **DTOs**: Pode ser necessário criar DTOs específicos do gateway ou reutilizar os do BC
2. **Mapeamento**: Se os DTOs forem diferentes, criar mappers simples no gateway
3. **Testes**: Refatorar testes para mockar Use Cases ao invés de repositories
4. **Migração gradual**: Pode ser feita feature por feature (pessoa primeiro, depois outros)

## ✅ Benefícios

- ✅ Arquitetura consistente com DDD/Hexagonal
- ✅ Eliminação de duplicação
- ✅ Gateway mais simples e fácil de manter
- ✅ Lógica centralizada nos BCs
- ✅ Facilita evolução independente

## 🚀 Próximos Passos

1. Criar `ListarPessoasUseCase` no `sagnus-bc-corp`
2. Refatorar `GatewayPessoaController` para usar Use Cases
3. Testar funcionalidade de pessoa
4. Remover código duplicado (domain/application/infrastructure)
5. Repetir para outras funcionalidades (Cliente, etc.)


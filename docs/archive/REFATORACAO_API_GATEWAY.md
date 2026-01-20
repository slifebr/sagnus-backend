# Refatoração do sagnus-api-gateway

## Problema Identificado

O `sagnus-api-gateway` possui estrutura completa de **domain/application/infrastructure**, violando a arquitetura de Bounded Contexts:

- ❌ `infrastructure/persistence` - JPA entities e repositories próprios
- ❌ `application/cadastro/pessoa/PessoaService` - Lógica de negócio duplicada
- ❌ `domain/cadastro/pessoa` - Entidades de domínio próprias
- ❌ Acesso direto a banco de dados via JPA

Isso viola as regras:
- "Um Bounded Context não acessa o banco do outro"
- "api-gateway deve apenas agregar endpoints dos BCs"
- "Gateway não deve ter lógica de negócio própria"

## Solução Proposta

O `sagnus-api-gateway` deve ser um **agregador fino** que:
1. ✅ Expõe endpoints REST unificados
2. ✅ Delega para Use Cases dos BCs (`sagnus-bc-corp`, `sagnus-bc-auth`, etc.)
3. ✅ Faz mapeamento de DTOs quando necessário
4. ❌ **NÃO** possui lógica de negócio
5. ❌ **NÃO** possui persistência própria
6. ❌ **NÃO** possui domain models próprios

## Estrutura Proposta

```
sagnus-api-gateway/
├── api/                    # Controllers REST (agregação)
│   ├── pessoa/
│   │   ├── PessoaGatewayController.java  # Delega para sagnus-bc-corp
│   │   └── dto/
│   │       └── PessoaGatewayDTO.java     # DTOs específicos do gateway (se necessário)
│   └── error/
│       └── GatewayGlobalExceptionHandler.java
├── config/                 # Configurações do gateway
│   └── SecurityConfig.java
└── SagnusApplication.java
```

**Remover:**
- ❌ `application/` (toda lógica vai para os BCs)
- ❌ `domain/` (domain models ficam nos BCs)
- ❌ `infrastructure/` (persistência fica nos BCs)
- ❌ `core/` (erros compartilhados já existem em `sagnus-shared-api-error`)

## Passos de Refatoração

### 1. Criar novo GatewayPessoaController que delega para BCs

```java
@RestController
@RequestMapping("/api/pessoas")
public class PessoaGatewayController {
    
    private final ObterPessoaUseCase obterPessoa;      // do sagnus-bc-corp
    private final CadastrarPessoaUseCase cadastrarPessoa;
    private final AlterarPessoaUseCase alterarPessoa;
    // TODO: ListarPessoaUseCase (criar no bc-corp se não existir)
    
    // Delegação direta para Use Cases do BC
}
```

### 2. Migrar funcionalidades

- **Listagem paginada**: Criar `ListarPessoasUseCase` no `sagnus-bc-corp`
- **Buscar por ID**: Usar `ObterPessoaUseCase` existente
- **Criar**: Usar `CadastrarPessoaUseCase` existente
- **Atualizar**: Usar `AlterarPessoaUseCase` existente
- **Excluir**: Criar `ExcluirPessoaUseCase` no `sagnus-bc-corp` (se necessário)

### 3. Remover código duplicado

- Deletar `application/cadastro/pessoa/PessoaService.java`
- Deletar `infrastructure/persistence/` (todo o package)
- Deletar `domain/cadastro/pessoa/`
- Deletar `core/exception/BusinessException.java` (usar `sagnus-shared-api-error`)

### 4. Ajustar dependências

- Gateway já depende de `sagnus-bc-corp` ✅
- Usar Use Cases diretamente (não Services)
- Mapear DTOs do BC para DTOs do gateway (se necessário)

## Impacto

### Benefícios
- ✅ Arquitetura consistente com DDD/Hexagonal
- ✅ Eliminação de duplicação de código
- ✅ Gateway torna-se mais simples (apenas agregação)
- ✅ Lógica de negócio centralizada nos BCs
- ✅ Fácil manutenção e evolução

### Desafios
- ⚠️ Precisa criar `ListarPessoasUseCase` no `sagnus-bc-corp`
- ⚠️ Possível necessidade de ajustar DTOs
- ⚠️ Testes precisam ser refatorados

## Próximos Passos

1. Verificar se `ListarPessoasUseCase` existe no `sagnus-bc-corp`
2. Criar novo `PessoaGatewayController` que delega para BCs
3. Migrar funcionalidades uma a uma
4. Remover código duplicado
5. Testar e validar


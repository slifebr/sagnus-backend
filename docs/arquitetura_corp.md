sagnus-bc-corp
 └── src/main/java/com/slifesys/sagnus/corp
     ├── domain
     │   ├── pessoa
     │   │   ├── Pessoa.java            (Aggregate Root)
     │   │   ├── PessoaFisica.java
     │   │   ├── PessoaJuridica.java
     │   │   ├── Endereco.java          (Value Object)
     │   │   ├── Telefone.java          (Value Object)
     │   │   ├── PessoaRepository.java
     │   │   └── PessoaService.java
     │   │
     │   ├── produto
     │   │   ├── Produto.java           (Aggregate Root)
     │   │   ├── UnidadeProduto.java
     │   │   ├── GrupoProduto.java
     │   │   ├── MarcaProduto.java
     │   │   ├── FichaTecnica.java
     │   │   └── ProdutoRepository.java
     │   │
     │   └── common
     │       ├── Ncm.java
     │       ├── Cnae.java
     │       └── Municipio.java
     │
     ├── application
     │   ├── pessoa
     │   │   ├── CreatePessoaUseCase.java
     │   │   └── UpdatePessoaUseCase.java
     │   └── produto
     │       ├── CreateProdutoUseCase.java
     │       └── UpdateProdutoUseCase.java
     │
     ├── infrastructure
     │   ├── persistence
     │   │   ├── jpa
     │   │   │   ├── PessoaJpaEntity.java
     │   │   │   ├── ProdutoJpaEntity.java
     │   │   │   └── repositories
     │   │   └── Flyway/Liquibase
     │   │
     │   └── mapper (MapStruct)
     │
     └── api
         ├── pessoa
         │   └── PessoaController.java
         └── produto
             └── ProdutoController.java

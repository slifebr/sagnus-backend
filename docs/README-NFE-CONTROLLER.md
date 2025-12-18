# NfeController mínimo (v1)

Conteúdo:
- `POST /nfe/emitir` chamando `EmitirNfeUseCase`
- DTOs de request/response com validação (jakarta.validation)

## Onde colocar
Copie para o módulo real `sagnus-bc-nfe`:
- `src/main/java/com/slifesys/sagnus/nfe/api/...`

## Dependências necessárias no bc-nfe
- spring-boot-starter-web
- spring-boot-starter-validation
- lombok

## Exemplo de request (modo local com StubCorpPessoaGatewayAdapter)
- emitentePessoaId=1
- destinatarioPessoaId=2

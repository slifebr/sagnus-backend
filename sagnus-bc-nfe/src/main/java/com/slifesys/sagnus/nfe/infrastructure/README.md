# Adapters mínimos — BC NFe (v1)

Conteúdo deste pacote:
- `InMemoryNfeRepositoryAdapter` (fallback) — permite rodar o UseCase sem banco.
- `CorpPessoaGatewayAdapter` — integra com CORP via contrato Java (`CorpPessoaQueryPort`) quando CORP estiver carregado.
- `StubCorpPessoaGatewayAdapter` — fallback **somente** no profile `local` (para rodar NFe sem CORP).

## Outbox (Transporte)
O BC NFe usa Outbox transacional (tabela) e um *transport adapter*.

Opção 1 (fila de trabalho): RabbitMQ
- Ative com: `sagnus.nfe.outbox.transport=RABBIT`
- Config: `sagnus.nfe.outbox.rabbit.*`

Default (DEV): LOG
- `sagnus.nfe.outbox.transport=LOG` (ou omita a property)

## Onde colocar
Copie a pasta `sagnus-bc-nfe/src/main/java/...` para o seu módulo real `sagnus-bc-nfe`.

## Como rodar no modo local (sem CORP)
- Suba o NFe com `--spring.profiles.active=local`
- O stub vai responder:
  - pessoaId=1 (Emitente) e pessoaId=2 (Destinatário)

## Como rodar integrado (com CORP no mesmo contexto)
- Garanta que existe um bean `CorpPessoaQueryPort` (implementado pelo CORP)
- O adapter real sobe automaticamente via `@ConditionalOnBean`

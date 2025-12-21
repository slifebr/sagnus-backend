# NFE_STATE (Sagnus)

## Objetivo do módulo
- Emitir NF-e (MVP end-to-end) + base DDD

## Status atual (2025-12-17)
- Build: OK (1 bean único para `NfeXmlGeneratorPort` via feature-flag)
- Testes: OK (JUnit Jupiter via `spring-boot-starter-test`)

## Decisões importantes
- ICMS como classe (complexo), PIS/COFINS/IPI como record
- Fiscal v2: IBS/CBS no domínio em `com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs`
- IBS/CBS no XML:
  - Layout NFE40: transportado em `<infAdProd>` (schema-safe) + soma no `vTotTrib`
  - Layout RTC2025: emitido no grupo `<imposto><IBSCBS>` + soma no `vTotTrib`
- Seleção de layout por feature-flag:
  - `sagnus.nfe.xml.layout=NFE40` (default)
  - `sagnus.nfe.xml.layout=RTC2025`

## Últimas mudanças relevantes
- Plug RTC no domínio:
  - `CstIbsCbs` (3 dígitos)
  - `CClassTrib` (6 dígitos)
  - `TributosItem` agora suporta `Optional<CstIbsCbs>` e `Optional<CClassTrib>`
- Plug RTC no XML:
  - `NfeXmlGeneratorNfe40Adapter`: **não** emite tags RTC; usa `infAdProd`
  - `NfeXmlGeneratorRtc2025Adapter`: emite `<IBSCBS>` quando existe IBS/CBS

## Arquivos-chave
- `domain/model/imposto/TributosItem.java`
- `domain/model/imposto/ibscbs/*`
- `infrastructure/xml/NfeXmlGeneratorNfe40Adapter.java`
- `infrastructure/xml/NfeXmlGeneratorRtc2025Adapter.java`
- `README-NFE-XML.md`

## Problemas/pendências (próximos passos)
- Persistência IBS/CBS: **implementada** via coluna `nfe_item.tributacao_json` (JSON em TEXT) + rehidratação via `TributosItemJsonMapper`
- Cálculo IBS/CBS: **implementado** (auto-completa 2 de 3 campos: base/aliquota/valor)
- Reconciliação IBS/CBS: **implementada** quando os 3 campos são informados; se divergência > `sagnus.nfe.rtc.valorTolerance`:
  - `LENIENT`: ajusta `valor` para o calculado (base+alíquota)
  - `STRICT`: lança `NfeDomainException`
- Ajustar XML RTC para aderir ao XSD/NT (Grupo UB completo + totais W03, quando formos validar por schema)


### RTC — Reconciliação 3/3 (base+aliquota+valor)
- `sagnus.nfe.rtc.valorTolerance`: tolerância em R$
- `sagnus.nfe.rtc.reconcileStrategy`: BASE_ALIQUOTA | BASE_VALOR | ALIQUOTA_VALOR | AUTO_MIN_ADJUST (default)


### Observabilidade/Auditoria RTC (IBS/CBS)
- Quando houver reconciliação (LENIENT + diff > tolerância), o sistema:
  - registra log WARN com before/after + estratégia
  - publica o DomainEvent `RtcIbsCbsReconciledEvent` (com `correlationId` quando houver)

### Auditoria Persistida (DomainEvents)
- CorrelationId por request via headers `X-Correlation-Id`/`X-Request-Id` (fallback UUID)
- Persistência de DomainEvents em `nfe_audit_event` (Flyway V3)
  - property: `sagnus.nfe.audit.enabled=true|false`

### Outbox transacional (DomainEvents)
- Outbox real implementado para mensageria distribuída:
  - tabela: `nfe_outbox_event` (Flyway V4)
  - writer: `DomainEventOutboxWriterListener` (grava PENDING na mesma transação)
  - dispatcher: `NfeOutboxDispatcher` (polling) + `NfeOutboxService`
    - lock concorrente com PostgreSQL `SKIP LOCKED`
    - retries com backoff exponencial; marca DEAD após `maxAttempts`
  - transporte default: `LOG` (`LogOutboxTransportAdapter`)

Config local:
```yaml
sagnus:
  nfe:
    outbox:
      enabled: true
      transport: LOG
      pollIntervalMs: 2000
      batchSize: 50
      maxAttempts: 10
      lockTtlSeconds: 300
      backoffInitialMs: 1000
      backoffMultiplier: 2.0
      backoffMaxMs: 600000
```

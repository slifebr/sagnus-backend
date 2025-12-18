# BC NFe — Geração de XML (v1)

Pipeline:
**EmitirNfeUseCase -> NfeEmitidaEvent -> NfeEmitidaToXmlListener -> XML -> Store**

## O que foi criado
- Ports (Application):
  - `NfeFinderPort`
  - `NfeXmlGeneratorPort`
  - `NfeXmlStorePort`
- Adapters (Infrastructure):
  - `NfeXmlGeneratorNfe40Adapter` (XML mínimo NF-e 4.00)
  - `FileSystemNfeXmlStoreAdapter` (filesystem)
  - `NfeEmitidaToXmlListener` (listener do evento)

## Config (application.yml do BC NFe)
```yaml
sagnus:
  nfe:
    xml:
      # NFE40 (default) | RTC2025
      layout: NFE40
      store: filesystem
      dir: ./var/nfe/xml
```

### Feature-flag de layout
- `layout: NFE40` (default) -> habilita `NfeXmlGeneratorNfe40Adapter`
- `layout: RTC2025` -> habilita `NfeXmlGeneratorRtc2025Adapter`

Obs.: os adapters são controlados por `@ConditionalOnProperty`, então somente um bean de `NfeXmlGeneratorPort`
fica ativo por vez, evitando ambiguidade de injeção.

## Integração necessária
Você precisa de pelo menos 1 implementação de `NfeFinderPort`.
- InMemory: retorna do Map
- JPA: repo.findById + mapper Entity->Domain

Se quiser, eu já te entrego o `NfeFinderPort` pronto (InMemory + JPA) alinhado ao seu código atual.

## RTC IBS/CBS — Entrada + Validação (MVP)
O endpoint `/nfe/emitir` passou a aceitar (por item) os campos:
- `cstIbsCbs` (3 dígitos)
- `cClassTrib` (6 dígitos)
- `ibsBase`, `ibsAliquota`, `ibsValor`
- `cbsBase`, `cbsAliquota`, `cbsValor`
- `regimeIbsCbs` (ex.: `REGULAR`, `ISENCAO`, `DIFERIMENTO`)

Regras MVP implementadas:
- IBS/CBS: pode informar **2 de 3** campos (`base`, `aliquota`, `valor`). O sistema calcula o terceiro automaticamente.
- Se IBS ou CBS estiver presente:
  - Em `LENIENT` (default): se `cstIbsCbs` ou `cClassTrib` não vierem, aplica default.
  - Em `STRICT`: se faltar `cstIbsCbs` ou `cClassTrib`, a emissão falha.

Configuração:
```yaml
sagnus:
  nfe:
    rtc:
      validation: LENIENT # ou STRICT
      defaultCst: "000"
      defaultCClassTrib: "000000"
```


### RTC: reconciliação base/alíquota/valor (LENIENT)

Quando os 3 campos (`base`, `aliquota`, `valor`) são informados e não fecham dentro de `valorTolerance`, o modo **LENIENT** reconcilia conforme `sagnus.nfe.rtc.reconcileStrategy`:

- `BASE_ALIQUOTA`: ajusta **valor**
- `BASE_VALOR`: ajusta **aliquota**
- `ALIQ_VALOR`: ajusta **base**
- `AUTO_MIN_ADJUST` (default): escolhe automaticamente o menor ajuste relativo

# NFE_STATE (Sagnus)

## Objetivo do módulo
- Emitir NF-e (MVP end-to-end) + base DDD

## Status atual (2025-12-17)
- Build: OK (1 bean único para `NfeXmlGeneratorPort` via feature-flag)
- Testes: OK (JUnit Jupiter via `spring-boot-starter-test`)

## Decisões importantes
- ICMS como classe (complexo), PIS/COFINS/IPI como record
- Fiscal v2: IBS/CBS no domínio em `com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs`
- IBS/CBS no XML: emitido no grupo `<imposto><IBSCBS>` (MVP) + soma no `vTotTrib`
- Seleção de layout por feature-flag:
  - `sagnus.nfe.xml.layout=NFE40` (default)
  - `sagnus.nfe.xml.layout=RTC2025`

## Últimas mudanças relevantes
- Plug RTC no domínio:
  - `CstIbsCbs` (3 dígitos)
  - `CClassTrib` (6 dígitos)
  - `TributosItem` agora suporta `Optional<CstIbsCbs>` e `Optional<CClassTrib>`
- Plug RTC no XML:
  - `NfeXmlGeneratorNfe40Adapter` gera `<IBSCBS>` quando existe IBS/CBS
  - `NfeXmlGeneratorRtc2025Adapter` habilitável por propriedade

## Arquivos-chave
- `domain/model/imposto/TributosItem.java`
- `domain/model/imposto/ibscbs/*`
- `infrastructure/xml/NfeXmlGeneratorNfe40Adapter.java`
- `infrastructure/xml/NfeXmlGeneratorRtc2025Adapter.java`
- `README-NFE-XML.md`

## Problemas/pendências (próximos passos)
- Persistência IBS/CBS (JSON coluna vs tabela normalizada)
- Evoluir cálculo tributário (service de cálculo / policy)
- Ajustar XML RTC para aderir ao XSD/NT (Grupo UB completo + totais W03, quando formos validar por schema)

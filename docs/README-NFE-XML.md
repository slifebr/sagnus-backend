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
      store: filesystem
      dir: ./var/nfe/xml
```

## Integração necessária
Você precisa de pelo menos 1 implementação de `NfeFinderPort`.
- InMemory: retorna do Map
- JPA: repo.findById + mapper Entity->Domain

Se quiser, eu já te entrego o `NfeFinderPort` pronto (InMemory + JPA) alinhado ao seu código atual.

## Reforma Tributária (RTC) — IBS/CBS (stub)

O domínio já possui `Ibs` / `Cbs` em `TributosItem` (Fiscal v2). Neste MVP, o `NfeXmlGeneratorNfe40Adapter` **não gera ainda o Grupo UB oficial (det/imposto/IBSCBS)**.

O que já foi plugado:
- Se existir IBS/CBS no item, o adapter preenche `<det><prod><infAdProd>` com uma string curta (`RTC:IBS[...] ; CBS[...]`) limitada a 500 chars.
- O `<det><imposto><vTotTrib>` passa a somar também IBS + CBS (além dos tributos legados quando presentes no domínio).

Próximo passo (quando for aderir ao schema RTC / NT 2025.002):
- Modelar `CST-IBS/CBS` e `cClassTrib` no domínio.
- Gerar efetivamente `<det><imposto><IBSCBS>...` com IBSUF/IBSMun/CBS e totalizadores W03.

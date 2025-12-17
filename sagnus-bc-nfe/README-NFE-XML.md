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

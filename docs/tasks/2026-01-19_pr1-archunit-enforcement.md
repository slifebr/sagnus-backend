# Task: Fix Architectural Violations (Comprehensive)

## PR-0: Baseline Artifacts (DONE)
- [x] Create .ai-context/ folder
- [x] Update .agent/rules.md to reference .ai-context
- [x] Verify .ai-context content

## PR-1: Architecture Enforcement (ArchUnit)
- [x] Fix ArchUnit in bc-estoque (JUnit4 → JUnit5)
- [x] Add ArchUnit to bc-corp
- [x] Add ArchUnit to bc-adm
- [x] Add ArchUnit to bc-nfe
- [x] Add ArchUnit to bc-auth
- [/] Add CI gate for architecture tests

## PR-2: Remove JPA from bc-corp Domain
- [ ] Create ProdutoEntity in infrastructure
- [ ] Create ProdutoMapper (MapStruct)
- [ ] Remove JPA from domain Produto
- [ ] Update repository adapter

## PR-3: Move Repository Ports to Domain (bc-corp)
- [ ] Move PessoaRepository to domain.repository
- [ ] Move other repository ports to domain
- [ ] Update use cases imports
- [ ] Update adapters

## PR-4: Break estoque → corp Coupling
- [ ] Remove bc-corp dependency from estoque pom.xml
- [ ] Add bc-corp-contracts dependency
- [ ] Replace Produto imports with ProdutoId
- [ ] Remove JPA from estoque domain models
- [ ] Create estoque persistence entities
- [ ] Create estoque mappers

## PR-5: Fix bc-adm Layering
- [ ] Remove Spring from domain services
- [ ] Create domain ports for repositories
- [ ] Implement infrastructure adapters
- [ ] Update application services to use ports

## PR-6: Normalize bc-adm API Packages
- [ ] Move controllers from interfaces.web to api
- [ ] Update ArchUnit rules
- [ ] Verify routes stability

## PR-7: Gateway Dependency Strategy
- [ ] Document gateway-to-BC coupling strategy
- [ ] Create ADR refinement
- [ ] Implement chosen strategy

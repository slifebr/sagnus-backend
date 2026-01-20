# Análise de Inconsistências do Projeto Sagnus ERP

**Data:** 2025-01-26  
**Analista:** Arquiteto de Software Sênior

---

## Resumo Executivo

Esta análise identifica inconsistências arquiteturais e de implementação em relação aos padrões definidos no projeto:
- Arquitetura Hexagonal (Domain, Application, Infrastructure)
- Independência de Banco (Spring Data JPA)
- Centralização de lógica fiscal de IVA Dual
- Uso correto de BigDecimal com RoundingMode.HALF_UP
- Separação de responsabilidades (Domain Services, Entities, Repositories)

---

## 1. INCONSISTÊNCIAS CRÍTICAS

### 1.1 ❌ **CalculadoraIvaService não existe**

**Problema:**  
As regras do projeto especificam que "Toda lógica fiscal de IVA Dual deve ser centralizada em CalculadoraIvaService", porém este serviço não existe no projeto.

**Evidência:**
- Busca por `CalculadoraIvaService` retornou 0 resultados
- Lógica de cálculo de IVA Dual (IBS/CBS) está espalhada em:
  - `RtcIbsCbsNormalizer` (application/service)
  - `EmitirNfeUseCase` (application/usecase)
  - Vários Value Objects no domain (Ibs, Cbs, etc.)

**Impacto:**  
- Violação das regras de negócio definidas
- Dificuldade de manutenção e evolução da lógica fiscal
- Risco de inconsistências em cálculos

**Recomendação:**  
Criar `CalculadoraIvaService` no pacote `domain/service` ou `application/service` (conforme padrão DDD) e centralizar toda lógica de cálculo de IVA Dual (IBS/CBS).

---

### 1.2 ❌ **Uso de BigDecimal.ROUND_HALF_UP (deprecated)**

**Problema:**  
O código usa `BigDecimal.ROUND_HALF_UP` que é uma constante deprecated desde Java 9. O correto é usar `RoundingMode.HALF_UP`.

**Evidência:**
```116:122:sagnus-bc-nfe/src/main/java/com/slifesys/sagnus/nfe/infrastructure/xml/NfeXmlGeneratorNfe40Adapter.java
    private static String fmt(BigDecimal v) {
        if (v == null) return "0.00";
        return v.setScale(2, BigDecimal.ROUND_HALF_UP).toPlainString();
    }


    private static String fmtAliq(BigDecimal v) {
        if (v == null) return "0.0000";
        return v.setScale(4, BigDecimal.ROUND_HALF_UP).toPlainString();
```

**Impacto:**  
- Uso de API deprecated pode causar problemas em versões futuras do Java
- Inconsistência com o padrão definido (RoundingMode.HALF_UP)

**Recomendação:**  
Substituir `BigDecimal.ROUND_HALF_UP` por `RoundingMode.HALF_UP` em todos os locais.

---

### 1.3 ⚠️ **sagnus-api-gateway viola arquitetura de Bounded Contexts**

**Problema:**  
O módulo `sagnus-api-gateway` possui sua própria estrutura de domínio, application e infrastructure, duplicando funcionalidades que deveriam estar nos Bounded Contexts.

**Evidência:**
- `sagnus-api-gateway` tem:
  - `domain/cadastro/pessoa/Pessoa.java`
  - `application/cadastro/pessoa/PessoaService.java`
  - `infrastructure/persistence/cadastro/pessoa/...`
- Isso duplica funcionalidades do `sagnus-bc-corp`

**Impacto:**  
- Violação da regra: "Um Bounded Context não acessa o banco do outro"
- Duplicação de código e lógica
- Dificuldade de manutenção
- Risco de inconsistências de dados

**Recomendação:**  
- O `sagnus-api-gateway` deve ser apenas um agregador de endpoints dos BCs
- Remover toda lógica de domínio, application e persistence do gateway
- Gateway deve apenas orquestrar chamadas aos BCs via contratos (ports)

---

## 2. INCONSISTÊNCIAS ARQUITETURAIS

### 2.1 ⚠️ **Lógica de cálculo de IVA espalhada**

**Problema:**  
A lógica de cálculo de IVA Dual (IBS/CBS) está distribuída em múltiplos pontos, não centralizada.

**Evidência:**
- `RtcIbsCbsNormalizer` (application/service) - normalização de triplas
- `EmitirNfeUseCase` (application/usecase) - montagem de tributos
- Value Objects no domain (Ibs, Cbs) - encapsulam dados mas não lógica de cálculo

**Impacto:**  
- Dificulta manutenção e evolução
- Risco de inconsistências
- Violação do princípio DRY

**Recomendação:**  
Centralizar toda lógica de cálculo em um Domain Service `CalculadoraIvaService` conforme especificado nas regras.

---

### 2.2 ✅ **Uso correto de nativeQuery (aceitável)**

**Problema:**  
Encontrado uso de `nativeQuery` em `NfeOutboxEventJpaRepositoryImpl`.

**Análise:**  
Este uso é **aceitável** porque:
- Está na camada Infrastructure (adapter)
- É necessário para operação específica de lock (SKIP LOCKED do PostgreSQL)
- Não viola a regra de "não usar lógica de banco de dados" pois é apenas uma otimização de infraestrutura

**Status:** ✅ **Conforme** - Não requer correção

---

### 2.3 ✅ **Separação de camadas Domain correta**

**Verificação:**  
- Domain não possui dependências de Spring/JPA ✅
- Domain não possui Services ✅
- Domain possui apenas Entities, Value Objects e Exceptions ✅

**Status:** ✅ **Conforme**

---

### 2.4 ✅ **Uso correto de RoundingMode.HALF_UP na maioria dos locais**

**Evidência:**  
A maioria do código já usa `RoundingMode.HALF_UP` corretamente:
- `Dinheiro.java`
- `Percentual.java`
- `Quantidade.java`
- `RtcIbsCbsNormalizer.java`

**Problema:**  
Apenas `NfeXmlGeneratorNfe40Adapter.java` ainda usa a constante deprecated.

**Status:** ⚠️ **Parcialmente Conforme** - Requer correção pontual

---

## 3. INCONSISTÊNCIAS DE DEPENDÊNCIAS

### 3.1 ✅ **Dependências entre BCs corretas**

**Verificação:**  
- `sagnus-bc-nfe` depende apenas de `sagnus-bc-corp-contracts` (contrato) ✅
- `sagnus-bc-nfe` não depende diretamente de `sagnus-bc-corp` ✅
- Não há imports de `com.slifesys.sagnus.corp.domain` em outros BCs ✅

**Status:** ✅ **Conforme**

---

### 3.2 ⚠️ **sagnus-api-gateway depende diretamente de BCs**

**Problema:**  
O `sagnus-api-gateway` depende diretamente dos BCs (`sagnus-bc-corp`, `sagnus-bc-auth`, `sagnus-bc-nfe`), o que pode violar o isolamento.

**Evidência:**
```44:59:sagnus-api-gateway/pom.xml
        <dependency>
            <groupId>com.slifesys.sagnus</groupId>
            <artifactId>sagnus-bc-auth</artifactId>
        </dependency>
        <dependency>
            <groupId>com.slifesys.sagnus</groupId>
            <artifactId>sagnus-bc-corp</artifactId>
        </dependency>
        <dependency>
            <groupId>com.slifesys.sagnus</groupId>
            <artifactId>sagnus-bc-corp-contracts</artifactId>
        </dependency>
        <dependency>
            <groupId>com.slifesys.sagnus</groupId>
            <artifactId>sagnus-bc-nfe</artifactId>
        </dependency>
```

**Análise:**  
Se o gateway for apenas um agregador de endpoints, isso pode ser aceitável. Porém, se o gateway tiver lógica própria (como visto em `PessoaService`), isso viola a arquitetura.

**Recomendação:**  
- Se gateway é apenas agregador: manter dependências, mas remover toda lógica própria
- Se gateway precisa de lógica: considerar criar um BC específico ou mover lógica para os BCs apropriados

---

## 4. INCONSISTÊNCIAS DE CÓDIGO

### 4.1 ⚠️ **Services no application layer (aceitável)**

**Evidência:**  
Encontrados Services na camada Application:
- `RtcIbsCbsNormalizer` (application/service)
- `OutboxEventDispatcher` (application/service)
- `AuthTokenService`, `RefreshTokenService` (bc-auth/application)

**Análise:**  
Isso é **aceitável** em DDD/Hexagonal quando:
- O Service orquestra múltiplos repositórios/ports
- Não é uma regra de negócio pura (que ficaria no Domain)
- É uma lógica de aplicação (application service)

**Status:** ✅ **Conforme** - Padrão DDD permite Application Services

---

## 5. RECOMENDAÇÕES PRIORITÁRIAS

### 🔴 **Prioridade ALTA**

1. **Criar CalculadoraIvaService**
   - Localização: `sagnus-bc-nfe/src/main/java/com/slifesys/sagnus/nfe/domain/service/CalculadoraIvaService.java`
   - Mover toda lógica de cálculo de IVA Dual para este serviço
   - Refatorar `RtcIbsCbsNormalizer` e `EmitirNfeUseCase` para usar o serviço

2. **Corrigir uso de BigDecimal.ROUND_HALF_UP**
   - Substituir por `RoundingMode.HALF_UP` em `NfeXmlGeneratorNfe40Adapter.java`

3. **Refatorar sagnus-api-gateway**
   - Remover toda estrutura de domain/application/infrastructure própria
   - Gateway deve apenas agregar endpoints dos BCs
   - Mover lógica de `PessoaService` para `sagnus-bc-corp` ou criar endpoints que delegam aos BCs

### 🟡 **Prioridade MÉDIA**

4. **Documentar decisão sobre gateway**
   - Definir claramente se gateway é apenas agregador ou se precisa de lógica própria
   - Se precisa de lógica, criar BC específico ou mover para BCs existentes

5. **Revisar centralização de lógica fiscal**
   - Verificar se há outras lógicas fiscais espalhadas além de IVA Dual
   - Considerar criar módulo compartilhado de serviços fiscais se necessário

### 🟢 **Prioridade BAIXA**

6. **Padronizar nomenclatura de Services**
   - Verificar se todos os Application Services seguem padrão de nomenclatura
   - Considerar renomear `RtcIbsCbsNormalizer` para algo mais descritivo se necessário

---

## 6. PONTOS POSITIVOS

✅ **Separação de camadas Domain correta** - Domain não possui dependências de framework  
✅ **Uso correto de contratos entre BCs** - BCs se comunicam via ports/contratos  
✅ **Uso correto de RoundingMode.HALF_UP** na maioria dos locais  
✅ **Estrutura Hexagonal bem definida** nos BCs principais  
✅ **NativeQuery usado apenas em casos justificados** (infrastructure layer)

---

## 7. CONCLUSÃO

O projeto apresenta uma arquitetura sólida em geral, com boa separação de camadas e isolamento de Bounded Contexts. As principais inconsistências são:

1. **Falta de CalculadoraIvaService** (crítico - viola regra de negócio)
2. **Uso de API deprecated** (médio - pode causar problemas futuros)
3. **Estrutura duplicada no api-gateway** (alto - viola arquitetura de BCs)

Recomenda-se priorizar a correção desses pontos para manter a consistência arquitetural e facilitar a evolução do sistema.

---

**Próximos Passos:**
1. Criar CalculadoraIvaService
2. Corrigir uso de BigDecimal.ROUND_HALF_UP
3. Refatorar api-gateway
4. Revisar e validar com equipe



package com.slifesys.sagnus.adm; // <- ajuste para o pacote do seu BC

import com.tngtech.archunit.core.domain.JavaClasses;
import com.tngtech.archunit.lang.ArchRule;

import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.*;

public final class ArchitectureRules {

    private ArchitectureRules() {}

    /**
     * Ajuste estes "roots" conforme sua estrutura real.
     * Se você usa "interfaces.web" em vez de "api", inclua também.
     */
    public static final String DOMAIN = "..domain..";
    public static final String APPLICATION = "..application..";
    public static final String INFRA = "..api..";
    public static final String API = "com.slifesys.sagnus.adm.api";
    public static final String INTERFACES = "..interfaces.."; // caso exista


    /**
     * Frameworks proibidos no domínio
     */
    public static ArchRule domain_must_be_framework_free() {
        return noClasses()
                .that().resideInAPackage(DOMAIN)
                .should().dependOnClassesThat()
                .resideInAnyPackage(
                        "org.springframework..",
                        "jakarta.persistence..",
                        "javax.persistence..",
                        "org.hibernate..",
                        "com.fasterxml.jackson..",
                        //"lombok..",          // opcional: muitos times permitem Lombok no domínio
                        "org.mapstruct.."    // opcional: normalmente mappers ficam fora do domínio
                )
                .because("ADR-0001: Domain deve ser Java puro (sem Spring/JPA/Jackson/Hibernate/etc).");
    }

    /**
     * Application não deve depender de Infrastructure
     */
    public static ArchRule application_must_not_depend_on_infrastructure() {
        return noClasses()
                .that().resideInAPackage(APPLICATION)
                .should().dependOnClassesThat().resideInAPackage(INFRA)
                .because("Hexagonal: Application orquestra e depende apenas de PORTS, não de adapters de infraestrutura.");
    }

    /**
     * API não deve depender diretamente de persistence/repositories de infraestrutura.
     * (permite depender de Application)
     */
    public static ArchRule api_must_not_touch_infrastructure() {
        return noClasses()
                .that().resideInAnyPackage(API, INTERFACES)
                .should().dependOnClassesThat().resideInAPackage(INFRA)
                .because("API deve chamar UseCases/Application, nunca persistence/infra direto.");
    }

    /**
     * Opcional: impedir que domain dependa de application/api/infra
     * (mantém o domínio "no centro")
     */
    public static ArchRule domain_must_not_depend_on_outer_layers() {
        return noClasses()
                .that().resideInAPackage(DOMAIN)
                .should().dependOnClassesThat().resideInAnyPackage(APPLICATION, INFRA, API, INTERFACES)
                .because("Hexagonal: Domain não depende das camadas externas.");
    }

    /**
     * Regra de acoplamento entre BCs:
     * - Proíbe importar qualquer outro BC (com.slifesys.sagnus.<outro>..)
     * - Permite SOMENTE contracts e shared-kernel (ajuste nomes conforme seu repo)
     *
     * Importante: essa regra é por BC. Ela bloqueia casos como:
     * com.slifesys.sagnus.estoque -> com.slifesys.sagnus.corp.domain...
     */
    public static ArchRule bc_must_not_depend_on_other_bcs(String thisBcPrefix) {
        // Ex: thisBcPrefix = "com.slifesys.sagnus.estoque"
        // Bloqueia dependências para com.slifesys.sagnus.* (outros BCs),
        // exceto contracts/shared.
        return noClasses()
                .that().resideInAPackage(thisBcPrefix + "..")
                .should().dependOnClassesThat()
                .resideInAPackage("com.slifesys.sagnus..")
                .andShould().dependOnClassesThat()
                .resideOutsideOfPackages(
                        thisBcPrefix + "..",
                        "com.slifesys.sagnus.shared..",
                        "com.slifesys.sagnus.contracts..",
                        "com.slifesys.sagnus.common.."
                )
                .because("ADR-0001: BCs não devem depender de outros BCs (somente via contracts/shared).");
    }

    /**
     * Alternativa mais simples (e geralmente mais correta) para a regra BC->BC:
     * Proíbe explicitamente dependência de pacotes de outros BCs.
     *
     * Você pode manter uma lista fixa aqui conforme seu monorepo.
     */
    public static ArchRule bc_forbid_dependencies_to_known_other_bcs(String thisBcPrefix) {
        return noClasses()
                .that().resideInAPackage(thisBcPrefix + "..")
                .should().dependOnClassesThat().resideInAnyPackage(
                        "com.slifesys.sagnus.corp..",
                        "com.slifesys.sagnus.adm..",
                        "com.slifesys.sagnus.fina..",
                        "com.slifesys.sagnus.nfe..",
                        "com.slifesys.sagnus.auth.."
                )
                .because("ADR-0001: dependência direta entre BCs é proibida (use contracts).");
    }

    /**
     * Helper para rodar um conjunto mínimo por BC.
     */
    public static void assertMinimal(JavaClasses classes, String thisBcPrefix) {
        domain_must_be_framework_free().check(classes);
        application_must_not_depend_on_infrastructure().check(classes);
        api_must_not_touch_infrastructure().check(classes);
        domain_must_not_depend_on_outer_layers().check(classes);
        // Use UMA das regras abaixo (a de lista fixa costuma ser menos “pegadinha”):
        bc_forbid_dependencies_to_known_other_bcs(thisBcPrefix).check(classes);
    }
}

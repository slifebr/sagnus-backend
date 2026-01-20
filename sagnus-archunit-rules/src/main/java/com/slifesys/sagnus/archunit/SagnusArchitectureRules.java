package com.slifesys.sagnus.archunit;

import com.tngtech.archunit.lang.ArchRule;

import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.noClasses;

/**
 * Single source of truth for architecture rules.
 *
 * Aligned with:
 * - ADR-0001 (Architectural Baseline): DDD + Hexagonal + DB-agnostic domain
 * - ADR-0002 (Contracts between BCs): no direct BC-to-BC dependencies (only contracts/shared)
 */
public final class SagnusArchitectureRules {

    private SagnusArchitectureRules() {}

    // Generic package matchers (works across all BCs)
    public static final String DOMAIN = "..domain..";
    public static final String APPLICATION = "..application..";
    public static final String INFRA = "..infrastructure..";
    public static final String API = "..api..";

    /**
     * ADR-0001: Domain must be framework-free (pure Java).
     * Note: Lombok is intentionally allowed (project standard). MapStruct is typically kept outside Domain.
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
                "org.mapstruct.."
            )
            .because("ADR-0001: Domain deve ser Java puro (sem Spring/JPA/Hibernate/Jackson/MapStruct).");
    }

    /**
     * Hexagonal: Application must not depend on Infrastructure.
     */
    public static ArchRule application_must_not_depend_on_infrastructure() {
        return noClasses()
            .that().resideInAPackage(APPLICATION)
            .should().dependOnClassesThat().resideInAPackage(INFRA)
            .because("Hexagonal: Application depende de ports e casos de uso, nao de adapters de infraestrutura.");
    }

    /**
     * API must not reach Infrastructure directly (must call Application layer).
     */
    public static ArchRule api_must_not_touch_infrastructure() {
        return noClasses()
            .that().resideInAPackage(API)
            .should().dependOnClassesThat().resideInAPackage(INFRA)
            .because("API deve chamar Application; detalhes tecnicos ficam em Infrastructure.");
    }

//    /**
//     * ADR-0002: Forbid direct BC-to-BC dependencies.
//     *
//     * @param thisBcPrefix ex: "com.slifesys.sagnus.adm"
//     */
//    public static ArchRule bc_must_not_depend_on_other_bcs(String thisBcPrefix) {
//        final String root = "com.slifesys.sagnus";
//        return noClasses()
//            .that().resideInAPackage(thisBcPrefix + "..")
//            .should().dependOnClassesThat()
//            .resideInAPackage(root + "..")
//            .andShould().dependOnClassesThat()
//                .resideOutsideOfPackages(
//                // allow own BC
//                thisBcPrefix + "..",
//                // allow contracts + shared kernel (if approved)
//                root + ".contracts..",
//                root + ".shared..",
//                root + ".common.."
//            )
//            .because("ADR-0002: BCs nao podem depender diretamente de outros BCs; use Contracts/shared aprovados.");
 //   }
    
    /**
     * ADR-0003: Forbid direct BC-to-BC dependencies.
     *
     * @param thisBcPrefix ex: "com.slifesys.sagnus.adm"
     */
    public static ArchRule bc_must_not_depend_on_other_bcs_blacklist(String thisBcPrefix) {
        String[] allBcs = {
            "com.slifesys.sagnus.corp..",
            "com.slifesys.sagnus.adm..",
            "com.slifesys.sagnus.estoque..",
            "com.slifesys.sagnus.nfe..",
            "com.slifesys.sagnus.fina..",
            "com.slifesys.sagnus.auth.."
        };

        return noClasses()
            .that().resideInAPackage(thisBcPrefix + "..")
            .should().dependOnClassesThat()
            .resideInAnyPackage(allBcs)
            .allowEmptyShould(true)
            .because("ADR-0003: dependência direta entre BCs é proibida (use contracts/shared).");
        
    }

    /**
     * ADR-0004: Contracts must be framework-free (pure DTOs/events).
     */
    public static ArchRule contracts_must_be_framework_free() {
        return noClasses()
            .that().resideInAPackage("com.slifesys.sagnus.contracts..")
            .should().dependOnClassesThat()
            .resideInAnyPackage(
                "org.springframework..",
                "jakarta.persistence..",
                "javax.persistence..",
                "org.hibernate.."
        )
        .because("ADR-0004: Contracts devem ser DTOs/eventos puros, sem framework.");
    }

    /**
     * ADR-0005: Gateway must not depend on BC internals.
     */
    public static ArchRule gateway_must_not_depend_on_bc_internals() {
    return noClasses()
        .that().resideInAnyPackage(
            "com.slifesys.sagnus.api..",
            "com.slifesys.sagnus.graphql..",
            "com.slifesys.sagnus.security..",
            "com.slifesys.sagnus.config.."
        )
        .should().dependOnClassesThat()
        .resideInAnyPackage(
            // corp
            "com.slifesys.sagnus.corp.domain..",
            "com.slifesys.sagnus.corp.application..",

            // adm
            "com.slifesys.sagnus.adm.domain..",
            "com.slifesys.sagnus.adm.application..",

            // estoque
            "com.slifesys.sagnus.estoque.domain..",
            "com.slifesys.sagnus.estoque.application..",

            // nfe
            "com.slifesys.sagnus.nfe.domain..",
            "com.slifesys.sagnus.nfe.application..",

            // fina
            "com.slifesys.sagnus.fina.domain..",
            "com.slifesys.sagnus.fina.application..",

            // auth
            "com.slifesys.sagnus.auth.domain..",
            "com.slifesys.sagnus.auth.application.."
        )
        .because(
            "ADR-0005: API Gateway é BFF. "
          + "Deve consumir apenas Contracts, nunca Domain ou Application dos BCs."
        );
}


}

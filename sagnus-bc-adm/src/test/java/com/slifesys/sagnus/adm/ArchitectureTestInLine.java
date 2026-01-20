package com.slifesys.sagnus.adm;

import com.tngtech.archunit.core.domain.JavaClasses;
import com.tngtech.archunit.core.importer.ClassFileImporter;
import org.junit.jupiter.api.Test;

import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.noClasses;

/**
 * ArchUnit enforcement for bc-adm.
 *
 * - ADR-0001: DDD + Hexagonal (dependency direction)
 * - ADR-0002: BC boundaries (cross-BC dependencies only via contracts/shared-kernel)
 */
class ArchitectureTestInLine {

    private static final String BC = "com.slifesys.sagnus.adm";
    private static final String ROOT = "com.slifesys.sagnus";

    private static final String DOMAIN = "..domain..";
    private static final String APPLICATION = "..application..";
    private static final String INFRA = "..infrastructure..";
    private static final String API = "..api..";

    private static final String[] FORBIDDEN_IN_DOMAIN = {
            "org.springframework..",
            "jakarta.persistence..",
            "org.hibernate..",
            "com.fasterxml.jackson.."
    };

    @Test
    void domain_must_be_framework_free() {
        JavaClasses classes = new ClassFileImporter().importPackages(BC);

        noClasses()
                .that().resideInAnyPackage(DOMAIN)
                .should().dependOnClassesThat().resideInAnyPackage(FORBIDDEN_IN_DOMAIN)
                .because("ADR-0001: Domain deve ser Java puro, sem dependencias de frameworks.")
                .check(classes);
    }

    @Test
    void application_must_not_depend_on_infrastructure() {
        JavaClasses classes = new ClassFileImporter().importPackages(BC);

        noClasses()
                .that().resideInAnyPackage(APPLICATION)
                .should().dependOnClassesThat().resideInAnyPackage(INFRA)
                .because("ADR-0001: Application orquestra casos de uso e ports, mas nao depende de infraestrutura.")
                .check(classes);
    }

    @Test
    void api_must_not_touch_infrastructure_directly() {
        JavaClasses classes = new ClassFileImporter().importPackages(BC);

        noClasses()
                .that().resideInAnyPackage(API)
                .should().dependOnClassesThat().resideInAnyPackage(INFRA)
                .because("ADR-0001: API deve chamar Application; detalhes tecnicos ficam em Infrastructure.")
                .check(classes);
    }

    @Test
    void forbid_direct_bc_dependencies_except_contracts_and_shared_kernel() {
        JavaClasses classes = new ClassFileImporter().importPackages(BC);

        noClasses()
                .that().resideInAPackage(BC + "..")
                .should().dependOnClassesThat()
                .resideInAPackage(ROOT + "..")
                .andShould().dependOnClassesThat()
                .resideOutsideOfPackages(
                        // allow own bc
                        BC + "..",
                        // allow contracts + shared kernel
                        ROOT + ".contracts..",
                        ROOT + ".shared.."
                )
                .because("ADR-0002: BCs nao podem depender diretamente de outros BCs; use Contracts.")
                .check(classes);
    }
}

package com.slifesys.sagnus.adm;


import com.tngtech.archunit.lang.ArchRule;

import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.classes;
import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.noClasses;

import com.tngtech.archunit.core.domain.JavaClasses;
import com.tngtech.archunit.core.importer.ClassFileImporter;
import com.tngtech.archunit.junit.AnalyzeClasses;
import com.tngtech.archunit.junit.ArchTest;
import org.junit.jupiter.api.Test;

/**
 * Regras de arquitetura para BC ADM (DDD + Hexagonal).
 * 
 * Enforce ADR-0001: Domain puro, camadas isoladas, sem acoplamento entre BCs.
 */
@AnalyzeClasses(packages = "com.slifesys.sagnus.adm")
public class ArchitectureTest {

    private static final String BASE = "com.slifesys.sagnus.adm..";

    private static final String BC_PREFIX = "com.slifesys.sagnus.adm..";
    private static final String ROOT = "com.slifesys.sagnus";

    @ArchTest
    static final ArchRule domain_must_not_depend_on_spring =
            noClasses().that().resideInAPackage(BASE + "domain..")
                    .should().dependOnClassesThat().resideInAnyPackage(
                            "org.springframework..",
                            "org.springframework.security.."
                    )
                    .because("Domain must be framework-agnostic (ADR-0001, ADR-0004)");

    @ArchTest
    static final ArchRule domain_must_not_depend_on_jpa =
            noClasses().that().resideInAPackage(BASE + "domain..")
                    .should().dependOnClassesThat().resideInAnyPackage(
                            "jakarta.persistence..",
                            "javax.persistence..",
                            "org.hibernate.."
                    )
                    .because("Domain must not depend on JPA (ADR-0001, ADR-0004)");

    @ArchTest
    static final ArchRule domain_must_not_depend_on_api_or_infrastructure =
            noClasses().that().resideInAPackage(BASE + "domain..")
                    .should().dependOnClassesThat().resideInAnyPackage(
                            BASE + "api..",
                            BASE + "infrastructure.."
                    )
                    .because("Domain must not depend on outer layers (Hexagonal)");

    @ArchTest
    static final ArchRule application_must_not_depend_on_infrastructure =
            noClasses().that().resideInAPackage(BASE + "application..")
                    .should().dependOnClassesThat().resideInAPackage(BASE + "infrastructure..")
                    .because("Application must depend on domain ports, not infrastructure (ADR-0001)");

    @ArchTest
    static final ArchRule application_must_not_depend_on_api =
            noClasses().that().resideInAPackage(BASE + "application..")
                    .should().dependOnClassesThat().resideInAPackage(BASE + "api..")
                    .because("Application must not depend on API layer");

    @ArchTest
    static final ArchRule no_bc_to_bc_imports =
            noClasses().that().resideInAPackage(BASE)
                    .should().dependOnClassesThat().resideInAnyPackage(
                            "com.slifesys.sagnus.corp..",
                            "com.slifesys.sagnus.nfe..",
                            "com.slifesys.sagnus.auth..",
                            "com.slifesys.sagnus.estoque.."
                    )
                    .because("BCs must communicate via contracts only (ADR-0003)");

    @ArchTest
    static final ArchRule controllers_should_reside_in_api_or_interfaces =
            classes().that().areAnnotatedWith(org.springframework.web.bind.annotation.RestController.class)
                    .should().resideInAnyPackage(
                            BASE + "api..",
                            BASE + "interfaces.."  // Temporary: will be removed in PR-6
                    )
                    .andShould().haveSimpleNameEndingWith("Controller")
                    .because("Controllers must be in API layer (will enforce api.. only after PR-6)");

    @ArchTest
    static final ArchRule use_cases_should_end_with_use_case =
            classes().that().resideInAPackage(BASE + "application.usecase..")
                    .and().areNotInterfaces()
                    .should().haveSimpleNameEndingWith("UseCase")
                    .because("Use cases must follow naming convention (ADR-0007)");



    @Test
    void adr0002_forbid_direct_bc_dependencies_except_contracts_and_shared() {
        JavaClasses classes = new ClassFileImporter().importPackages(BC_PREFIX);

        noClasses()
            .that().resideInAPackage(BC_PREFIX + "..")
            .should().dependOnClassesThat()
            .resideInAPackage(ROOT + "..")
            .andShould().dependOnClassesThat()
            .resideOutsideOfPackages(
                // permite depender de si mesmo
                BC_PREFIX + "..",
                // permite contracts e shared-kernel
                ROOT + ".contracts..",
                ROOT + ".shared.."
            )
            .because("ADR-0002: BCs não podem depender diretamente de outros BCs; use Contracts (e shared-kernel se aprovado).")
            .check(classes);
    }
}

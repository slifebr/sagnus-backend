package com.slifesys.sagnus.adm;

import com.tngtech.archunit.junit5.AnalyzeClasses;
import com.tngtech.archunit.junit5.ArchTest;
import com.tngtech.archunit.lang.ArchRule;

import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.classes;
import static com.tngtech.archunit.lang.syntax.ArchRuleDefinition.noClasses;

/**
 * Regras mínimas para manter o BC ADM seguindo DDD / Ports & Adapters.
 */
@AnalyzeClasses(packages = "com.slifesys.sagnus.adm")
class ArchitectureTest {

    private static final String BASE = "com.slifesys.sagnus.adm..";

    @ArchTest
    static final ArchRule domain_must_not_depend_on_spring_or_persistence =
            noClasses().that().resideInAPackage(BASE + "domain..")
                    .should().dependOnClassesThat().resideInAnyPackage(
                            "org.springframework..",
                            "jakarta.persistence..",
                            "javax.persistence..",
                            "org.hibernate..",
                            "org.springframework.security.."
                    );

    @ArchTest
    static final ArchRule domain_must_not_depend_on_api_or_infrastructure =
            noClasses().that().resideInAPackage(BASE + "domain..")
                    .should().dependOnClassesThat().resideInAnyPackage(
                            BASE + "api..",
                            BASE + "infrastructure.."
                    );

    @ArchTest
    static final ArchRule application_must_not_depend_on_api_or_infrastructure =
            noClasses().that().resideInAPackage(BASE + "application..")
                    .should().dependOnClassesThat().resideInAnyPackage(
                            BASE + "api..",
                            BASE + "infrastructure.."
                    );

    @ArchTest
    static final ArchRule api_should_not_be_used_by_other_layers =
            noClasses().that().resideOutsideOfPackage(BASE + "api..")
                    .should().dependOnClassesThat().resideInAPackage(BASE + "api.."
                    );

    @ArchTest
    static final ArchRule controllers_should_reside_in_api_and_be_named =
            classes().that().areAnnotatedWith(org.springframework.web.bind.annotation.RestController.class)
                    .should().resideInAPackage(BASE + "api..")
                    .andShould().haveSimpleNameEndingWith("Controller");
}

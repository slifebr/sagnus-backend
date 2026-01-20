package com.slifesys.sagnus.adm;

import com.slifesys.sagnus.archunit.SagnusArchitectureRules;
import com.tngtech.archunit.core.domain.JavaClasses;
import com.tngtech.archunit.core.importer.ClassFileImporter;
import org.junit.jupiter.api.Test;

/**
 * ArchUnit enforcement for bc-adm.
 *
 * Executed via JUnit5 @Test (explicit), so it cannot silently stop running due to runner/engine mismatch.
 *
 * Aligns with:
 * - ADR-0001: Architectural Baseline (DDD + Hexagonal)
 * - ADR-0002: Contracts strategy between BCs
 */
class ArchitectureTest {

    private static final String BC = "com.slifesys.sagnus.adm";

    @Test
    void enforce_architecture() {
        JavaClasses classes = new ClassFileImporter().importPackages(BC);

        SagnusArchitectureRules.domain_must_be_framework_free().check(classes);
        SagnusArchitectureRules.application_must_not_depend_on_infrastructure().check(classes);
        SagnusArchitectureRules.api_must_not_touch_infrastructure().check(classes);
        SagnusArchitectureRules.bc_must_not_depend_on_other_bcs(BC).check(classes);
    }
}

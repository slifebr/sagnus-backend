package com.slifesys.sagnus.fina.base;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Template oficial de Bounded Context (BC) para o Sagnus ERP.
 *
 * Como usar:
 *  - Copie o módulo sagnus-bc-fina-base para sagnus-bc-<seu-bc>
 *  - Renomeie packages (com.slifesys.sagnus.<seu-bc>) e artefacts no pom.xml
 *  - Mantenha a separação: api -> application -> domain -> infrastructure
 */
@SpringBootApplication
public class TemplateApplication {

    public static void main(String[] args) {
        SpringApplication.run(TemplateApplication.class, args);
    }
}

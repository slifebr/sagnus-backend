package com.slifesys.sagnus.nfe.application.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Getter
@Setter
@Configuration
@ConfigurationProperties(prefix = "sagnus.nfe.audit")
public class NfeAuditProperties {

    /**
     * Habilita persistência de auditoria de DomainEvents.
     *
     * Default: true (MVP). Se quiser desligar, setar false.
     */
    private boolean enabled = true;
}

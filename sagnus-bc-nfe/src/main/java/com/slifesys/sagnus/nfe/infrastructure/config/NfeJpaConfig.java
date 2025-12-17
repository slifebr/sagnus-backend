package com.slifesys.sagnus.nfe.infrastructure.config;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EntityScan(basePackages = "com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity")
@EnableJpaRepositories(basePackages = "com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository")
public class NfeJpaConfig {
}

package com.slifesys.sagnus.adm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.slifesys.sagnus.adm.infrastructure.persistence.repository")
public class SagnusBcAdmApplication {

    public static void main(String[] args) {
        SpringApplication.run(SagnusBcAdmApplication.class, args);
    }

}

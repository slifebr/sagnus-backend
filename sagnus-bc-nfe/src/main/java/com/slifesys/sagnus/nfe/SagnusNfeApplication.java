package com.slifesys.sagnus.nfe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@org.springframework.boot.context.properties.ConfigurationPropertiesScan
@EnableScheduling
public class SagnusNfeApplication {
    public static void main(String[] args) {
        SpringApplication.run(SagnusNfeApplication.class, args);
    }
}

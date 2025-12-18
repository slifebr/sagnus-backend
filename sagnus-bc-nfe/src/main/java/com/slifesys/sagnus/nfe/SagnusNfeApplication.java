package com.slifesys.sagnus.nfe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@org.springframework.boot.context.properties.ConfigurationPropertiesScan
public class SagnusNfeApplication {
    public static void main(String[] args) {
        SpringApplication.run(SagnusNfeApplication.class, args);
    }
}

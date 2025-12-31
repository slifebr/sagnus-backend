package com.slifesys.sagnus.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.slifesys.sagnus")
public class SagnusAuthApplication {
    public static void main(String[] args) {
        SpringApplication.run(SagnusAuthApplication.class, args);
    }
}

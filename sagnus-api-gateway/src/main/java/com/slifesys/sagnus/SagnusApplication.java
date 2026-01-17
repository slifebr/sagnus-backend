package com.slifesys.sagnus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.slifesys.sagnus.config", "com.slifesys.sagnus.controller", "com.slifesys.sagnus.security", "com.slifesys.sagnus.service"})
public class SagnusApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(SagnusApplication.class, args);
    }

}

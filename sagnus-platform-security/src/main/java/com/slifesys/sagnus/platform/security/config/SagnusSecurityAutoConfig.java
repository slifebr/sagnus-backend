package com.slifesys.sagnus.platform.security.config;

import com.slifesys.sagnus.platform.security.jwt.JwtProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableConfigurationProperties(JwtProperties.class)
public class SagnusSecurityAutoConfig {
}

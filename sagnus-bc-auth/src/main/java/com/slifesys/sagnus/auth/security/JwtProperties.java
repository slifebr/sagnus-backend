package com.slifesys.sagnus.auth.security;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Data
@ConfigurationProperties(prefix = "jwt")
public class JwtProperties {
    private String secret;
    private long accessMinutes = 30;
    private long refreshDays = 7;
    private String issuer = "sagnus";
}

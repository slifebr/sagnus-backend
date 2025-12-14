package com.slifesys.sagnus.platform.security.jwt;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Getter
@Setter
@ConfigurationProperties(prefix = "sagnus.security.jwt")
public class JwtProperties {
    /** secret (min. 32 chars recomendado) */
    private String secret;
    /** issuer */
    private String issuer = "sagnus";
    /** access token validity in minutes */
    private long accessTokenMinutes = 30;
}

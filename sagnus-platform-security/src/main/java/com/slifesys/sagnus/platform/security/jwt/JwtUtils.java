package com.slifesys.sagnus.platform.security.jwt;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.Date;
import java.util.Map;

/**
 * Utilitário de JWT (geração/parse).
 * OBS: Validação de tokenVersion/roles normalmente ocorre no filtro/provider.
 */
@Component
public class JwtUtils {

    private final JwtProperties props;
    private final SecretKey key;

    public JwtUtils(JwtProperties props) {
        this.props = props;
        String secret = props.getSecret();
        if (secret == null || secret.length() < 32) {
            throw new IllegalStateException("sagnus.security.jwt.secret deve ter pelo menos 32 caracteres.");
        }

        this.key = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));

    }

    public String generateAccessToken(String subject, Map<String, Object> claims, Instant expiresAt) {
        JwtBuilder b = Jwts.builder()
                .subject(subject)
                .issuer(props.getIssuer())
                .issuedAt(new Date())
                .expiration(Date.from(expiresAt))
                .signWith(key);

        if (claims != null) {
            b.claims(claims);
        }
        return b.compact();
    }

    public Jws<Claims> parse(String token) {
        JwtParser parser = Jwts.parser().verifyWith(key).build();
        return parser.parseSignedClaims(token);



    }
}

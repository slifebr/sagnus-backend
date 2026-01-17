package com.slifesys.sagnus.security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Component("gatewayJwtUtils")
public class JwtUtils {

    // Lidos do application.properties
    @Value("${jwt.secret}")
    private String secret;

    @Value("${jwt.access-token-expiration}")
    private long accessTokenExpirationMillis;

    @Value("${jwt.refresh-token-expiration}")
    private long refreshTokenExpirationMillis;

    // ====== ACCESS TOKEN ======
    public String gerarAccessToken(String username,
            List<String> roles,
            int tokenVersion) {

        Date agora = new Date();
        Date expira = new Date(agora.getTime() + accessTokenExpirationMillis);

        return Jwts.builder()
                .subject(username)
                .issuedAt(agora)
                .expiration(expira)
                .claims(Map.of(
                        "roles", roles,
                        "tv", tokenVersion // tokenVersion
                ))
                .signWith(getKeys())
                .compact();
    }

    // ====== REFRESH TOKEN ======
    public String gerarRefreshToken(String username, int tokenVersion) {
        Date agora = new Date();
        Date expira = new Date(agora.getTime() + refreshTokenExpirationMillis);

        return Jwts.builder()
                .subject(username)
                .issuedAt(agora)
                .expiration(expira)
                .claims(Map.of(
                        "tv", tokenVersion))
                .signWith(getKeys())
                .compact();
    }

    // ====== Validação genérica ======
    /*
     * public boolean isTokenValido(String token) {
     * try {
     * Claims claims = getClaims(token);
     * Date exp = claims.getExpiration();
     * return exp != null && exp.after(new Date());
     * } catch (Exception e) {
     * return false;
     * }
     * }
     */
    public boolean isTokenValido(String token) {
        try {
            var jws = parseToken(token);
            Date exp = jws.getPayload().getExpiration();
            return exp != null && exp.after(new Date());
        } catch (Exception e) {
            return false;
        }
    }

    public String getUsername(String token) {
        return getClaims(token).getSubject();
    }

    @SuppressWarnings("unchecked")
    public List<String> getRoles(String token) {
        Object roles = getClaims(token).get("roles");
        if (roles instanceof List<?> list) {
            return (List<String>) list;
        }
        return List.of();
    }

    public int getTokenVersion(String token) {
        Object tv = getClaims(token).get("tv");
        if (tv instanceof Integer i)
            return i;
        if (tv instanceof Number n)
            return n.intValue();
        return 0;
    }

    private Claims getClaims(String token) {
        return Jwts.parser()
                .verifyWith(getKeys())
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }

    public long getAccessTokenExpirationSeconds() {
        return accessTokenExpirationMillis / 1000;
    }

    public Jws<Claims> parseToken(String token) {
        return Jwts.parser()
                .verifyWith(getKeys())
                .build()
                .parseSignedClaims(token);
    }

    private SecretKey getKeys() {
        return Keys.hmacShaKeyFor(secret.getBytes());
    }

}

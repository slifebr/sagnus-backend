package com.slifesys.sagnus.auth.security;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class TokenService {

    private final JwtProperties props;
    private final JwtUtils jwtUtils;

    public long accessExpiresSeconds() {
        return props.getAccessMinutes() * 60;
    }

    public long refreshExpiresSeconds() {
        return props.getRefreshDays() * 24 * 60 * 60;
    }

    public String createAccessToken(String username, Set<String> roles) {
        var claims = new HashMap<String, Object>();
        claims.put("roles", roles);
        claims.put("typ", "access");
        return jwtUtils.generateAccessToken(username, claims, accessExpiresSeconds());
    }

    public String createRefreshToken(String username) {
        return jwtUtils.generateRefreshToken(username, refreshExpiresSeconds());
    }
}

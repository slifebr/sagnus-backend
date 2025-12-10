package com.slifesys.sagnus.security;

import com.slifesys.sagnus.domain.seguranca.UsuarioSistema;
import com.slifesys.sagnus.infrastructure.persistence.seguranca.UsuarioSistemaRepository;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class TokenService {

    private final JwtUtils jwtUtils;
    private final UsuarioSistemaRepository usuarioRepository;

    public TokenService(JwtUtils jwtUtils,
                        UsuarioSistemaRepository usuarioRepository) {
        this.jwtUtils = jwtUtils;
        this.usuarioRepository = usuarioRepository;
    }

    // DTO de retorno (usado no login e no /auth/refresh)
    public record TokenPair(String accessToken,
                            String refreshToken,
                            long expiresIn) {
    }

    // ========= Usado no LOGIN =========
    public TokenPair generateTokensOnLogin(String username,
                                        Collection<? extends GrantedAuthority> authorities) {

        UsuarioSistema usuario = usuarioRepository.findByLogin(username)
                .orElseThrow(() -> new IllegalStateException(
                        "Usuário não encontrado ao gerar tokens: " + username));

        Integer tokenVersion = Optional.ofNullable(usuario.getTokenVersion()).orElse(0);

        // Roles vindas do próprio Authentication (UserDetails)
        List<String> roles = authorities.stream()
                .map(GrantedAuthority::getAuthority)
                .toList();

        String accessToken = jwtUtils.gerarAccessToken(username, roles, tokenVersion);
        String refreshToken = jwtUtils.gerarRefreshToken(username, tokenVersion);

        return new TokenPair(
                accessToken,
                refreshToken,
                jwtUtils.getAccessTokenExpirationSeconds()
        );
    }

    // ========= Usado no /auth/refresh =========
    public TokenPair refreshTokens(String refreshToken) {

        if (!jwtUtils.isTokenValido(refreshToken)) {
            throw new RuntimeException("Refresh token inválido ou expirado");
        }

        String username = jwtUtils.getUsername(refreshToken);
        int tokenVersion = jwtUtils.getTokenVersion(refreshToken);

        UsuarioSistema usuario = usuarioRepository.findByLogin(username)
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado no refresh: " + username));

        Integer currentVersion = Optional.ofNullable(usuario.getTokenVersion()).orElse(0);
        if (currentVersion != tokenVersion) {
            throw new RuntimeException("Refresh token inválido (versão)");
        }

        // Roles atuais do usuário avaliando o flag administrador
        List<String> roles = buildRolesFromUsuario(usuario);

        String newAccessToken = jwtUtils.gerarAccessToken(username, roles, currentVersion);
        String newRefreshToken = jwtUtils.gerarRefreshToken(username, currentVersion);

        return new TokenPair(
                newAccessToken,
                newRefreshToken,
                jwtUtils.getAccessTokenExpirationSeconds()
        );
    }

    // ========= Usado no JWTAuthorizationFilter =========
    public UsernamePasswordAuthenticationToken getAuthenticationFromToken(String token) {

        if (!jwtUtils.isTokenValido(token)) {
            return null;
        }

        String username = jwtUtils.getUsername(token);
        int tokenVersion = jwtUtils.getTokenVersion(token);

        UsuarioSistema usuario = usuarioRepository.findByLogin(username)
                .orElse(null);

        if (usuario == null) {
            return null;
        }

        Integer currentVersion = Optional.ofNullable(usuario.getTokenVersion()).orElse(0);
        if (currentVersion != tokenVersion) {
            // token antigo / invalidado
            return null;
        }

        List<String> roles = buildRolesFromUsuario(usuario);

        var authorities = roles.stream()
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());

        return new UsernamePasswordAuthenticationToken(username, null, authorities);
    }

    // ========= Helper: monta roles a partir do UsuarioSistema =========
    private List<String> buildRolesFromUsuario(UsuarioSistema usuario) {
        // regra simples: todo mundo é ROLE_USER, admins também ganham ROLE_ADMIN
        if ("S".equalsIgnoreCase(usuario.getAdministrador())) {
            return List.of("ROLE_USER", "ROLE_ADMIN");
        }
        return List.of("ROLE_USER");
    }
}

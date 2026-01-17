package com.slifesys.sagnus.auth.application.usecase;

import com.slifesys.sagnus.auth.api.auth.dto.RefreshResponse;
import com.slifesys.sagnus.auth.domain.usuario.AuthUsuarioStatus;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repo.UsuarioSpringDataRepository;
import com.slifesys.sagnus.auth.security.JwtUtils;
import com.slifesys.sagnus.auth.security.TokenService;
import com.slifesys.sagnus.shared.error.BusinessException;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RefreshTokenUseCase {

    private final JwtUtils jwtUtils;
    private final TokenService tokenService;
    private final UsuarioSpringDataRepository usuarioJpa;

    public RefreshResponse execute(String refreshToken) {
        if (refreshToken == null || refreshToken.isBlank()) {
            throw new BusinessException("AUTH-400", "Refresh token é obrigatório.");
        }

        Jws<Claims> jws = jwtUtils.parse(refreshToken);
        if (!jwtUtils.isRefreshToken(jws)) {
            throw new BusinessException("AUTH-401", "Token inválido.");
        }

        String username = jws.getBody().getSubject();
        var u = usuarioJpa.findByLogin(username.trim().toLowerCase())
                .orElseThrow(() -> new BusinessException("AUTH-401", "Token inválido."));

        if (!AuthUsuarioStatus.ATIVO.name().equals(u.getStatus())) {
            throw new BusinessException("AUTH-401", "Usuário inativo.");
        }

        var roles = u.getPerfis().stream().map(p -> p.getNome()).collect(Collectors.toSet());

        String newAccess = tokenService.createAccessToken(u.getLogin(), roles);

        return RefreshResponse.builder()
                .accessToken(newAccess)
                .tokenType("Bearer")
                .expiresInSeconds(tokenService.accessExpiresSeconds())
                .build();
    }
}

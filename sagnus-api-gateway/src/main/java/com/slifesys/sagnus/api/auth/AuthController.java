package com.slifesys.sagnus.api.auth;

import com.slifesys.sagnus.api.auth.dto.LoginRequest;
import com.slifesys.sagnus.api.auth.dto.RefreshRequest;
import com.slifesys.sagnus.api.auth.dto.TokenResponse;
import com.slifesys.sagnus.api.error.ErrorType;
import com.slifesys.sagnus.core.exception.BusinessException;
import com.slifesys.sagnus.security.TokenService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;

import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final TokenService tokenService;

    public AuthController(AuthenticationManager authenticationManager,
                          TokenService tokenService) {
        this.authenticationManager = authenticationManager;
        this.tokenService = tokenService;
    }

    // ================== LOGIN ==================
    @PostMapping(
            value = "/login",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public TokenResponse login(@Valid @RequestBody LoginRequest request) {

        try {
            Authentication auth = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            request.username(),
                            request.password()
                    )
            );

            User user = (User) auth.getPrincipal();

            TokenService.TokenPair pair = tokenService.generateTokensOnLogin(
                    user.getUsername(),
                    user.getAuthorities()
            );

            return new TokenResponse(
                    pair.accessToken(),
                    pair.refreshToken(),
                    pair.expiresIn(),
                    "Bearer"
            );

        } catch (BadCredentialsException e) {
            // Erro de usuário/senha padronizado no JSON ERP
            throw new BusinessException(
                    "Usuário ou senha inválidos.",
                    "ERP-AUTH-LOGIN-001",
                    HttpStatus.UNAUTHORIZED,
                    ErrorType.AUTH_ERROR
            );
        }
    }

    // ================== REFRESH ==================
    @PostMapping(
            value = "/refresh",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public TokenResponse refresh(@Valid @RequestBody RefreshRequest request) {

        try {
            TokenService.TokenPair pair = tokenService.refreshTokens(request.refreshToken());

            return new TokenResponse(
                    pair.accessToken(),
                    pair.refreshToken(),
                    pair.expiresIn(),
                    "Bearer" //pair.tokenType()
            );

        } catch (RuntimeException ex) {
            // Aqui você está capturando as RuntimeException lançadas pelo TokenService
            // ("Refresh token inválido ou expirado", "Refresh token inválido (versão)", etc.)
            throw new BusinessException(
                    ex.getMessage() != null ? ex.getMessage() : "Falha ao renovar o token.",
                    "ERP-AUTH-REFRESH-001",
                    HttpStatus.UNAUTHORIZED,
                    ErrorType.AUTH_ERROR
            );
        }
    }

    // ================== PERFIL ==================
    @GetMapping(value = "/me", produces = MediaType.APPLICATION_JSON_VALUE)
    public Object me(@AuthenticationPrincipal User user) {
        return java.util.Map.of(
                "username", user.getUsername(),
                "roles", user.getAuthorities()
                        .stream()
                        .map(a -> a.getAuthority())
                        .collect(Collectors.toList())
        );
    }
}

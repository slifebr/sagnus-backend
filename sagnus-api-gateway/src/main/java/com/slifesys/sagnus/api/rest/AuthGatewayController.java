package com.slifesys.sagnus.api.rest;

import com.slifesys.sagnus.auth.api.auth.dto.LoginRequest;
import com.slifesys.sagnus.auth.api.auth.dto.LoginResponse;
import com.slifesys.sagnus.auth.api.auth.dto.RefreshRequest;
import com.slifesys.sagnus.auth.api.auth.dto.RefreshResponse;
import com.slifesys.sagnus.auth.api.usuario.dto.UsuarioResumoResponse;
import com.slifesys.sagnus.auth.application.usecase.AutenticarUseCase;
import com.slifesys.sagnus.auth.application.usecase.ObterUsuarioResumoUseCase;
import com.slifesys.sagnus.auth.application.usecase.RefreshTokenUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

/**
 * Gateway REST Controller para AUTH.
 * 
 * Padrão Edge/BFF: delega para UseCases do BC-AUTH sem lógica própria.
 * Conforme ADR-0011: Gateway apenas roteia/delega, sem domínio/persistência.
 */
@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthGatewayController {

    private final AutenticarUseCase autenticarUseCase;
    private final RefreshTokenUseCase refreshTokenUseCase;
    private final ObterUsuarioResumoUseCase obterUsuarioResumoUseCase;

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest req) {
        return ResponseEntity.ok(autenticarUseCase.execute(req.getUsername(), req.getPassword()));
    }

    @PostMapping("/refresh")
    public ResponseEntity<RefreshResponse> refresh(@RequestBody RefreshRequest req) {
        return ResponseEntity.ok(refreshTokenUseCase.execute(req.getRefreshToken()));
    }

    @GetMapping("/me")
    public ResponseEntity<UsuarioResumoResponse> me(Authentication authentication) {
        return ResponseEntity.ok(UsuarioResumoResponse.from(obterUsuarioResumoUseCase.execute(authentication.getName())));
    }
}

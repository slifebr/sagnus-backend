package com.slifesys.sagnus.auth.api.auth;

import com.slifesys.sagnus.auth.api.auth.dto.*;
import com.slifesys.sagnus.auth.application.auth.AuthTokenService;
import com.slifesys.sagnus.auth.application.auth.RefreshTokenService;
import com.slifesys.sagnus.auth.application.corp.PessoaPort;
import com.slifesys.sagnus.auth.application.usuario.AuthUsuarioAppService;
import com.slifesys.sagnus.auth.domain.usuario.AuthUsuario;
import com.slifesys.sagnus.shared.error.BusinessException;
import com.slifesys.sagnus.shared.error.ErrorType;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Set;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthUsuarioAppService usuarioService;
    private final PasswordEncoder passwordEncoder;
    private final AuthTokenService tokenService;
    private final RefreshTokenService refreshTokenService;
    private final PessoaPort pessoaPort;

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody @Valid LoginRequest req) {
        AuthUsuario u = usuarioService.buscarPorLogin(req.getLogin())
                .orElseThrow(() -> new BusinessException("AUTH-404", "Usuário não encontrado.", ErrorType.AUTH_ERROR));
        if (u.getSenhaHash() == null || !passwordEncoder.matches(req.getSenha(), u.getSenhaHash()))
            throw new BusinessException("AUTH-401", "Usuário ou senha inválidos.", ErrorType.AUTH_ERROR);

        long tokenVersion = u.getTokenVersion() != null ? u.getTokenVersion() : 0L;
        String access = tokenService.gerarAccessToken(u.getId(), tokenVersion, u.getRoles());
        String refresh = refreshTokenService.emitirRefreshToken(u.getId(), 30);

        return ResponseEntity.ok(LoginResponse.builder().accessToken(access).refreshToken(refresh).tokenType("Bearer").build());
    }

    @PostMapping("/refresh")
    public ResponseEntity<RefreshResponse> refresh(@RequestBody @Valid RefreshRequest req) {
        var current = refreshTokenService.validarRefreshToken(req.getRefreshToken());
        refreshTokenService.revogar(current.getId());
        String newRefresh = refreshTokenService.emitirRefreshToken(current.getUsuarioId(), 30);

        AuthUsuario u = usuarioService.buscarPorId(current.getUsuarioId(), "AUTH");
        long tokenVersion = u.getTokenVersion() != null ? u.getTokenVersion() : 0L;
        String newAccess = tokenService.gerarAccessToken(u.getId(), tokenVersion, u.getRoles());

        return ResponseEntity.ok(RefreshResponse.builder().accessToken(newAccess).refreshToken(newRefresh).tokenType("Bearer").build());
    }

    @GetMapping("/me")
    public ResponseEntity<MeResponse> me() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || auth.getName() == null)
            throw new BusinessException("AUTH-401", "Não autenticado.", ErrorType.AUTH_ERROR);

        Long userId;
        try {
            userId = Long.valueOf(auth.getName());
        } catch (Exception e) {
            throw new BusinessException("AUTH-401", "Identidade inválida no token.", ErrorType.AUTH_ERROR);
        }

        AuthUsuario u = usuarioService.buscarPorId(userId, "AUTH");

        Set<String> roles = auth.getAuthorities() != null
                ? auth.getAuthorities().stream().map(a -> a.getAuthority()).collect(Collectors.toSet())
                : Set.of();

        return ResponseEntity.ok(MeResponse.builder()
                .usuarioId(u.getId()).login(u.getLogin()).pessoaId(u.getPessoaId())
                .tokenVersion(u.getTokenVersion()).roles(roles).build());
    }

    @PostMapping("/users")
    @PreAuthorize("hasAuthority('ROLE_AUTH_ADMIN')")
    public ResponseEntity<CreateUserResponse> criarUsuario(@RequestBody @Valid CreateUserRequest req) {

        if (req.getPessoaId() != null) {
            pessoaPort.buscarPessoaId(req.getPessoaId())
                    .orElseThrow(() -> new BusinessException("AUTH-400", "Pessoa não encontrada para vínculo.", ErrorType.BAD_REQUEST));
        }

        Set<String> perfis = normalizarPerfis(req.getPerfis());
        // garante que o próprio perfil de admin auth pode ser atribuído (se desejar)
        AuthUsuario criado = usuarioService.criarUsuario(req.getLogin(), req.getSenha(), req.getPessoaId(), perfis, "AUTH", "SYSTEM");

        return ResponseEntity.ok(CreateUserResponse.builder()
                .usuarioId(criado.getId()).login(criado.getLogin()).pessoaId(criado.getPessoaId()).build());
    }

    private Set<String> normalizarPerfis(Set<String> perfis) {
        if (perfis == null) return Set.of();
        return perfis.stream().map(String::trim).filter(s -> !s.isBlank()).map(String::toUpperCase).collect(Collectors.toSet());
    }
}

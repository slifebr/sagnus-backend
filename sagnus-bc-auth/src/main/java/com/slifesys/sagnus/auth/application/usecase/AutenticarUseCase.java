package com.slifesys.sagnus.auth.application.usecase;

import com.slifesys.sagnus.auth.api.auth.dto.LoginResponse;
import com.slifesys.sagnus.auth.infrastructure.integration.CorpPessoaGateway;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repo.UsuarioSpringDataRepository;
import com.slifesys.sagnus.auth.security.TokenService;
import com.slifesys.sagnus.shared.error.BusinessException;

import com.slifesys.sagnus.corp.api.contract.pessoa.PessoaResumoDTO;

import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AutenticarUseCase {

    private final AuthenticationManager authManager;
    private final UsuarioSpringDataRepository usuarioJpa;
    private final TokenService tokenService;
    private final CorpPessoaGateway corpPessoaGateway;

    public LoginResponse execute(String username, String password) {
        if (username == null || username.isBlank() || password == null || password.isBlank()) {
            throw new BusinessException("AUTH-400", "Usuário e senha são obrigatórios.");
        }

        Authentication auth = authManager.authenticate(
                new UsernamePasswordAuthenticationToken(username.trim().toLowerCase(), password)
        );

        var u = usuarioJpa.findByUsername(username.trim().toLowerCase())
                .orElseThrow(() -> new BadCredentialsException("Usuário/senha inválidos"));

        String access = tokenService.createAccessToken(u.getUsername(), java.util.Set.of(u.getRole()));
        String refresh = tokenService.createRefreshToken(u.getUsername());

        var pessoaOpt = (u.getPessoaId() != null)
                ? corpPessoaGateway.obterResumoPorPessoaId(u.getPessoaId())
                : java.util.Optional.<PessoaResumoDTO>empty();

        return LoginResponse.builder()
                .accessToken(access)
                .refreshToken(refresh)
                .tokenType("Bearer")
                .expiresInSeconds(tokenService.accessExpiresSeconds())
                .username(u.getUsername())
                .roles(java.util.Set.of(u.getRole()))
                .pessoaId(u.getPessoaId())
                .pessoaNome(pessoaOpt.map(p -> p.getNome()).orElse(null))
                .pessoaTipo(pessoaOpt.map(p -> p.getTipo()).orElse(null))
                .pessoaDocumento(pessoaOpt.map(p -> p.getDocumento()).orElse(null))
                .build();
    }
}

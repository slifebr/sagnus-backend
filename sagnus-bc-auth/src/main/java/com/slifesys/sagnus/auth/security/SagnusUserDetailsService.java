package com.slifesys.sagnus.auth.security;

import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repo.UsuarioSpringDataRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SagnusUserDetailsService implements UserDetailsService {

    private final UsuarioSpringDataRepository jpa;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        var u = jpa.findByUsername(username.trim().toLowerCase())
                .orElseThrow(() -> new UsernameNotFoundException("Usuário não encontrado"));

        if (!Boolean.TRUE.equals(u.getAtivo())) {
            throw new DisabledException("Usuário inativo");
        }

        var auths = List.of(new SimpleGrantedAuthority(u.getRole()));
        return User.withUsername(u.getUsername())
                .password(u.getSenhaHash())
                .authorities(auths)
                .build();
    }
}

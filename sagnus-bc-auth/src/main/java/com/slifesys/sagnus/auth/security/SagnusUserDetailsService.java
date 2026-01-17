package com.slifesys.sagnus.auth.security;

import com.slifesys.sagnus.auth.domain.usuario.AuthUsuarioStatus;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.entity.AuthUsuarioJpaEntity;
import com.slifesys.sagnus.auth.infrastructure.persistence.jpa.repo.UsuarioSpringDataRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SagnusUserDetailsService implements UserDetailsService {

    private final UsuarioSpringDataRepository jpa;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        var u = jpa.findByLogin(username.trim().toLowerCase())
                .orElseThrow(() -> new UsernameNotFoundException("Usuário não encontrado"));

        if (!AuthUsuarioStatus.ATIVO.name().equals(u.getStatus())) {
            throw new DisabledException("Usuário inativo");
        }

        var auths = u.getPerfis().stream().map(p -> new SimpleGrantedAuthority(p.getNome()))
          .collect(Collectors.toList());

        return User.withUsername(u.getLogin())
                .password(u.getSenhaHash())
                .authorities(auths)
                .build();
    }
}

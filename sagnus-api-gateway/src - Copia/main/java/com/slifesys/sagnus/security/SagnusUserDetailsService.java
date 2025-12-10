package com.slifesys.sagnus.security;

import com.slifesys.sagnus.domain.seguranca.UsuarioSistema;
import com.slifesys.sagnus.infrastructure.persistence.seguranca.UsuarioSistemaRepository;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SagnusUserDetailsService implements UserDetailsService {

    private final UsuarioSistemaRepository usuarioRepository;

    public SagnusUserDetailsService(UsuarioSistemaRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        UsuarioSistema usuario = usuarioRepository.findByLogin(username)
                .orElseThrow(() -> new UsernameNotFoundException("Usuário não encontrado: " + username));

        List<GrantedAuthority> authorities = new ArrayList<>();

        // regra simples: todo mundo é ROLE_USER, admins também ganham ROLE_ADMIN
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        if ("S".equalsIgnoreCase(usuario.getAdministrador())) {
            authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        }

        // aqui não tratamos bloqueio/expiração, mas já deixamos pronto
        return User.builder()
                .username(usuario.getLogin())
                .password(usuario.getSenha()) // já deve estar codificada (BCrypt)
                .authorities(authorities)
                .accountExpired(false)
                .accountLocked(false)
                .credentialsExpired(false)
                .disabled(false) // se tiver campo EH_ATIVO, dá pra ligar aqui depois
                .build();
    }
}

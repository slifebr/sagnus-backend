package com.slifesys.sagnus.corp.infrastructure.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

public final class CorpSecurityUtils {

    private CorpSecurityUtils() {
    }

    /**
     * Retorna o nome do usuário logado ou "SYSTEM" se não houver contexto/anônimo.
     */
    public static String getCurrentUser() {
        return Optional.ofNullable(SecurityContextHolder.getContext().getAuthentication())
                .map(Authentication::getName)
                .filter(name -> !name.isBlank())
                .orElse("SYSTEM");
    }
}

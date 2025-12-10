package com.slifesys.sagnus.api.cadastro;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PerfilController {

    // Qualquer usuário autenticado (ADMIN ou USER)
    @GetMapping("/api/me")
    public String me() {
        return "Endpoint para qualquer usuário autenticado.";
    }

    // Somente ADMIN
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/api/admin/info")
    public String adminInfo() {
        return "Somente ADMIN pode ver isso.";
    }

    // Somente USER (não admin)
    @PreAuthorize("hasRole('USER') and !hasRole('ADMIN')")
    @GetMapping("/api/user/info")
    public String userInfo() {
        return "Somente USER (não admin) pode ver isso.";
    }
}

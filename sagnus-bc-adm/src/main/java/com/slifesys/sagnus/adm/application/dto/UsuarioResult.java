package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;
import java.util.List;

@Getter
@Builder
public class UsuarioResult {
    private Long id;
    private String username;
    private String nome;
    private String email;
    private boolean ativo;
    private List<PerfilResult> perfis;

    public UsuarioResult() {}

    public UsuarioResult(Long id, String username, String nome, String email, boolean ativo, List<PerfilResult> perfis) {
        this.id = id;
        this.username = username;
        this.nome = nome;
        this.email = email;
        this.ativo = ativo;
        this.perfis = perfis;
    }

    public static Builder builder() { return new Builder(); }

    public Long getId() { return id; }
    public String getUsername() { return username; }
    public String getNome() { return nome; }
    public String getEmail() { return email; }
    public boolean isAtivo() { return ativo; }
    public List<PerfilResult> getPerfis() { return perfis; }

    public static class Builder {
        private Long id;
        private String username;
        private String nome;
        private String email;
        private boolean ativo;
        private List<PerfilResult> perfis;

        public Builder id(Long id) { this.id = id; return this; }
        public Builder username(String username) { this.username = username; return this; }
        public Builder nome(String nome) { this.nome = nome; return this; }
        public Builder email(String email) { this.email = email; return this; }
        public Builder ativo(boolean ativo) { this.ativo = ativo; return this; }
        public Builder perfis(List<PerfilResult> perfis) { this.perfis = perfis; return this; }

        public UsuarioResult build() {
            return new UsuarioResult(id, username, nome, email, ativo, perfis);
        }
    }
}

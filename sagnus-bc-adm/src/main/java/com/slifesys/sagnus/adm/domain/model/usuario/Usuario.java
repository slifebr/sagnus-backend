package com.slifesys.sagnus.adm.domain.model.usuario;

import java.util.Set;

// Removing annotations manually because Lombok processing failed
public class Usuario {
    private Long id;
    private Long empresaId;
    private String username;
    private String nome;
    private String email;
    private boolean ativo;
    private Set<Perfil> perfis;

    public Usuario() {}

    public Usuario(Long id, Long empresaId, String username, String nome, String email, boolean ativo, Set<Perfil> perfis) {
        this.id = id;
        this.empresaId = empresaId;
        this.username = username;
        this.nome = nome;
        this.email = email;
        this.ativo = ativo;
        this.perfis = perfis;
    }

    public static Builder builder() { return new Builder(); }

    public static class Builder {
        private Long id;
        private Long empresaId;
        private String username;
        private String nome;
        private String email;
        private boolean ativo;
        private Set<Perfil> perfis;

        public Builder id(Long id) { this.id = id; return this; }
        public Builder empresaId(Long empresaId) { this.empresaId = empresaId; return this; }
        public Builder username(String username) { this.username = username; return this; }
        public Builder nome(String nome) { this.nome = nome; return this; }
        public Builder email(String email) { this.email = email; return this; }
        public Builder ativo(boolean ativo) { this.ativo = ativo; return this; }
        public Builder perfis(Set<Perfil> perfis) { this.perfis = perfis; return this; }

        public Usuario build() {
            return new Usuario(id, empresaId, username, nome, email, ativo, perfis);
        }
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getEmpresaId() { return empresaId; }
    public void setEmpresaId(Long empresaId) { this.empresaId = empresaId; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public boolean isAtivo() { return ativo; }
    public void setAtivo(boolean ativo) { this.ativo = ativo; }

    public Set<Perfil> getPerfis() { return perfis; }
    public void setPerfis(Set<Perfil> perfis) { this.perfis = perfis; }
}

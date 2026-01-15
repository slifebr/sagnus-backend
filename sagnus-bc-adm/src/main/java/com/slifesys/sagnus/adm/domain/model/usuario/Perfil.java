package com.slifesys.sagnus.adm.domain.model.usuario;

import java.util.Set;

// Lombok annotations removed manually
public class Perfil {
    private Long id;
    private String nome;
    private boolean ativo;
    private Set<Permissao> permissoes;

    public Perfil() {}

    public Perfil(Long id, String nome, boolean ativo, Set<Permissao> permissoes) {
        this.id = id;
        this.nome = nome;
        this.ativo = ativo;
        this.permissoes = permissoes;
    }

    public static Builder builder() { return new Builder(); }

    public static class Builder {
        private Long id;
        private String nome;
        private boolean ativo;
        private Set<Permissao> permissoes;

        public Builder id(Long id) { this.id = id; return this; }
        public Builder nome(String nome) { this.nome = nome; return this; }
        public Builder ativo(boolean ativo) { this.ativo = ativo; return this; }
        public Builder permissoes(Set<Permissao> permissoes) { this.permissoes = permissoes; return this; }

        public Perfil build() {
            return new Perfil(id, nome, ativo, permissoes);
        }
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public boolean isAtivo() { return ativo; }
    public void setAtivo(boolean ativo) { this.ativo = ativo; }

    public Set<Permissao> getPermissoes() { return permissoes; }
    public void setPermissoes(Set<Permissao> permissoes) { this.permissoes = permissoes; }
}

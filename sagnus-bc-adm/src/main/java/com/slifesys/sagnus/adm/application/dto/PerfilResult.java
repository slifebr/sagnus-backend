package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;
import java.util.List;

@Getter
@Builder
public class PerfilResult {
    private Long id;
    private String nome;
    private boolean ativo;
    private List<String> permissoes; 

    public PerfilResult() {}

    public PerfilResult(Long id, String nome, boolean ativo, List<String> permissoes) {
        this.id = id;
        this.nome = nome;
        this.ativo = ativo;
        this.permissoes = permissoes;
    }

    public static Builder builder() { return new Builder(); }

    public Long getId() { return id; }
    public String getNome() { return nome; }
    public boolean isAtivo() { return ativo; }
    public List<String> getPermissoes() { return permissoes; }

    public static class Builder {
        private Long id;
        private String nome;
        private boolean ativo;
        private List<String> permissoes;

        public Builder id(Long id) { this.id = id; return this; }
        public Builder nome(String nome) { this.nome = nome; return this; }
        public Builder ativo(boolean ativo) { this.ativo = ativo; return this; }
        public Builder permissoes(List<String> permissoes) { this.permissoes = permissoes; return this; }

        public PerfilResult build() {
            return new PerfilResult(id, nome, ativo, permissoes);
        }
    }
}

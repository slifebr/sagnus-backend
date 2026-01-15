package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class EmpresaResult {
    private Long id;
    private String nome;
    private String nif;
    private boolean ativo;

    public EmpresaResult() {}

    public EmpresaResult(Long id, String nome, String nif, boolean ativo) {
        this.id = id;
        this.nome = nome;
        this.nif = nif;
        this.ativo = ativo;
    }

    public static Builder builder() { return new Builder(); }

    public Long getId() { return id; }
    public String getNome() { return nome; }
    public String getNif() { return nif; }
    public boolean isAtivo() { return ativo; }

    public static class Builder {
        private Long id;
        private String nome;
        private String nif;
        private boolean ativo;

        public Builder id(Long id) { this.id = id; return this; }
        public Builder nome(String nome) { this.nome = nome; return this; }
        public Builder nif(String nif) { this.nif = nif; return this; }
        public Builder ativo(boolean ativo) { this.ativo = ativo; return this; }

        public EmpresaResult build() {
            return new EmpresaResult(id, nome, nif, ativo);
        }
    }
}

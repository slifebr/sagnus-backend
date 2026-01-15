package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ParametroResult {
    private Long id;
    private String chave;
    private String valor;
    private String escopo;
    private boolean ativo;

    public ParametroResult() {}

    public ParametroResult(Long id, String chave, String valor, String escopo, boolean ativo) {
        this.id = id;
        this.chave = chave;
        this.valor = valor;
        this.escopo = escopo;
        this.ativo = ativo;
    }

    public static Builder builder() { return new Builder(); }

    public Long getId() { return id; }
    public String getChave() { return chave; }
    public String getValor() { return valor; }
    public String getEscopo() { return escopo; }
    public boolean isAtivo() { return ativo; }

    public static class Builder {
        private Long id;
        private String chave;
        private String valor;
        private String escopo;
        private boolean ativo;

        public Builder id(Long id) { this.id = id; return this; }
        public Builder chave(String chave) { this.chave = chave; return this; }
        public Builder valor(String valor) { this.valor = valor; return this; }
        public Builder escopo(String escopo) { this.escopo = escopo; return this; }
        public Builder ativo(boolean ativo) { this.ativo = ativo; return this; }

        public ParametroResult build() {
            return new ParametroResult(id, chave, valor, escopo, ativo);
        }
    }
}

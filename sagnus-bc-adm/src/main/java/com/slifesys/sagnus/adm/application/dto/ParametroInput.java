package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ParametroInput {
    private String chave;
    private String valor;
    private String escopo;

    public ParametroInput() {}

    public ParametroInput(String chave, String valor, String escopo) {
        this.chave = chave;
        this.valor = valor;
        this.escopo = escopo;
    }

    public static Builder builder() { return new Builder(); }

    public String getChave() { return chave; }
    public String getValor() { return valor; }
    public String getEscopo() { return escopo; }

    public static class Builder {
        private String chave;
        private String valor;
        private String escopo;

        public Builder chave(String chave) { this.chave = chave; return this; }
        public Builder valor(String valor) { this.valor = valor; return this; }
        public Builder escopo(String escopo) { this.escopo = escopo; return this; }

        public ParametroInput build() {
            return new ParametroInput(chave, valor, escopo);
        }
    }
}

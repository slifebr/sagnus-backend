package com.slifesys.sagnus.adm.domain.model.parametro;

// Lombok annotations removed manually
public class ParametroSistema {
    private Long id;
    private String chave;
    private String valor;
    private String escopo; // EMPRESA, FILIAL, GLOBAL
    private boolean ativo;

    public ParametroSistema() {}

    public ParametroSistema(Long id, String chave, String valor, String escopo, boolean ativo) {
        this.id = id;
        this.chave = chave;
        this.valor = valor;
        this.escopo = escopo;
        this.ativo = ativo;
    }

    public static Builder builder() { return new Builder(); }

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

        public ParametroSistema build() {
            return new ParametroSistema(id, chave, valor, escopo, ativo);
        }
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getChave() { return chave; }
    public void setChave(String chave) { this.chave = chave; }

    public String getValor() { return valor; }
    public void setValor(String valor) { this.valor = valor; }

    public String getEscopo() { return escopo; }
    public void setEscopo(String escopo) { this.escopo = escopo; }

    public boolean isAtivo() { return ativo; }
    public void setAtivo(boolean ativo) { this.ativo = ativo; }
}

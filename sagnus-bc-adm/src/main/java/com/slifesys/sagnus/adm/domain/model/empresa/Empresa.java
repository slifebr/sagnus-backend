package com.slifesys.sagnus.adm.domain.model.empresa;

// Lombok annotations removed manually
public class Empresa {
    private Long id;
    private String nome;
    private String nif;
    private boolean ativo;

    public Empresa() {}

    public Empresa(Long id, String nome, String nif, boolean ativo) {
        this.id = id;
        this.nome = nome;
        this.nif = nif;
        this.ativo = ativo;
    }

    public static Builder builder() { return new Builder(); }

    public static class Builder {
        private Long id;
        private String nome;
        private String nif;
        private boolean ativo;

        public Builder id(Long id) { this.id = id; return this; }
        public Builder nome(String nome) { this.nome = nome; return this; }
        public Builder nif(String nif) { this.nif = nif; return this; }
        public Builder ativo(boolean ativo) { this.ativo = ativo; return this; }

        public Empresa build() {
            return new Empresa(id, nome, nif, ativo);
        }
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getNif() { return nif; }
    public void setNif(String nif) { this.nif = nif; }

    public boolean isAtivo() { return ativo; }
    public void setAtivo(boolean ativo) { this.ativo = ativo; }
}

package com.slifesys.sagnus.adm.domain.model.usuario;

// Lombok annotations removed manually
public class Permissao {
    private Long id;
    private String codigo;
    private String descricao;

    public Permissao() {}

    public Permissao(Long id, String codigo, String descricao) {
        this.id = id;
        this.codigo = codigo;
        this.descricao = descricao;
    }

    public static Builder builder() { return new Builder(); }

    public static class Builder {
        private Long id;
        private String codigo;
        private String descricao;

        public Builder id(Long id) { this.id = id; return this; }
        public Builder codigo(String codigo) { this.codigo = codigo; return this; }
        public Builder descricao(String descricao) { this.descricao = descricao; return this; }

        public Permissao build() {
            return new Permissao(id, codigo, descricao);
        }
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
}

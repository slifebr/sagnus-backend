package com.slifesys.sagnus.adm.domain.model.empresa;

// Lombok annotations removed manually
public class Filial {
    private Long id;
    private Long empresaId;
    private String nome;
    private String codigo;
    private boolean ativo;

    public Filial() {}

    public Filial(Long id, Long empresaId, String nome, String codigo, boolean ativo) {
        this.id = id;
        this.empresaId = empresaId;
        this.nome = nome;
        this.codigo = codigo;
        this.ativo = ativo;
    }

    public static Builder builder() { return new Builder(); }

    public static class Builder {
        private Long id;
        private Long empresaId;
        private String nome;
        private String codigo;
        private boolean ativo;

        public Builder id(Long id) { this.id = id; return this; }
        public Builder empresaId(Long empresaId) { this.empresaId = empresaId; return this; }
        public Builder nome(String nome) { this.nome = nome; return this; }
        public Builder codigo(String codigo) { this.codigo = codigo; return this; }
        public Builder ativo(boolean ativo) { this.ativo = ativo; return this; }

        public Filial build() {
            return new Filial(id, empresaId, nome, codigo, ativo);
        }
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getEmpresaId() { return empresaId; }
    public void setEmpresaId(Long empresaId) { this.empresaId = empresaId; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }

    public boolean isAtivo() { return ativo; }
    public void setAtivo(boolean ativo) { this.ativo = ativo; }
}

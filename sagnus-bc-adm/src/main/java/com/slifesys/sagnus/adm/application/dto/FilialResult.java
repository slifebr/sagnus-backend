package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class FilialResult {
    private Long id;
    private Long empresaId;
    private String nome;
    private String codigo;
    private boolean ativo;

    public FilialResult() {}

    public FilialResult(Long id, Long empresaId, String nome, String codigo, boolean ativo) {
        this.id = id;
        this.empresaId = empresaId;
        this.nome = nome;
        this.codigo = codigo;
        this.ativo = ativo;
    }

    public static Builder builder() { return new Builder(); }

    public Long getId() { return id; }
    public Long getEmpresaId() { return empresaId; }
    public String getNome() { return nome; }
    public String getCodigo() { return codigo; }
    public boolean isAtivo() { return ativo; }

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

        public FilialResult build() {
            return new FilialResult(id, empresaId, nome, codigo, ativo);
        }
    }
}

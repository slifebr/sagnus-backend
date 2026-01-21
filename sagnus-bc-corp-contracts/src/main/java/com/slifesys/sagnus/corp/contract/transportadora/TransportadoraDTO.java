package com.slifesys.sagnus.corp.contract.transportadora;



public class TransportadoraDTO {
    private final Long id;
    private final Long idPessoa;
    private final String placaVeiculo;
    private final String rntc;
    private final java.time.Instant criadoEm;
    private final String usuCriacao;
    private final java.time.Instant atualizadoEm;
    private final String usuAlteracao;

    private TransportadoraDTO(Builder builder) {
        this.id = builder.id;
        this.idPessoa = builder.idPessoa;
        this.placaVeiculo = builder.placaVeiculo;
        this.rntc = builder.rntc;
        this.criadoEm = builder.criadoEm;
        this.usuCriacao = builder.usuCriacao;
        this.atualizadoEm = builder.atualizadoEm;
        this.usuAlteracao = builder.usuAlteracao;
    }

    public static Builder builder() {
        return new Builder();
    }

    public Long getId() { return id; }
    public Long getIdPessoa() { return idPessoa; }
    public String getPlacaVeiculo() { return placaVeiculo; }
    public String getRntc() { return rntc; }
    public java.time.Instant getCriadoEm() { return criadoEm; }
    public String getUsuCriacao() { return usuCriacao; }
    public java.time.Instant getAtualizadoEm() { return atualizadoEm; }
    public String getUsuAlteracao() { return usuAlteracao; }

    public static class Builder {
        private Long id;
        private Long idPessoa;
        private String placaVeiculo;
        private String rntc;
        private java.time.Instant criadoEm;
        private String usuCriacao;
        private java.time.Instant atualizadoEm;
        private String usuAlteracao;

        public Builder id(Long id) { this.id = id; return this; }
        public Builder idPessoa(Long idPessoa) { this.idPessoa = idPessoa; return this; }
        public Builder placaVeiculo(String placaVeiculo) { this.placaVeiculo = placaVeiculo; return this; }
        public Builder rntc(String rntc) { this.rntc = rntc; return this; }
        public Builder criadoEm(java.time.Instant criadoEm) { this.criadoEm = criadoEm; return this; }
        public Builder usuCriacao(String usuCriacao) { this.usuCriacao = usuCriacao; return this; }
        public Builder atualizadoEm(java.time.Instant atualizadoEm) { this.atualizadoEm = atualizadoEm; return this; }
        public Builder usuAlteracao(String usuAlteracao) { this.usuAlteracao = usuAlteracao; return this; }

        public TransportadoraDTO build() {
            return new TransportadoraDTO(this);
        }
    }
}

package com.slifesys.sagnus.nfe.domain.model.nfe;


public final class Emitente {

    private final Long pessoaId;
    private final String nome;
    private final DocumentoFiscal documento;

    public Emitente(Long pessoaId, String nome, DocumentoFiscal documento) {
        this.pessoaId = pessoaId;
        this.nome = nome;
        this.documento = documento;
    }

    public Long getPessoaId() {
        return pessoaId;
    }

    public String getNome() {
        return nome;
    }

    public DocumentoFiscal getDocumento() {
        return documento;
    }
}

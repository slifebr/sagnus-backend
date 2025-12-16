package com.slifesys.sagnus.nfe.domain.model.nfe;

public final class Destinatario {

    private final Long pessoaId;
    private final String nome;
    private final DocumentoFiscal documento;

    public Destinatario(Long pessoaId, String nome, DocumentoFiscal documento) {
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

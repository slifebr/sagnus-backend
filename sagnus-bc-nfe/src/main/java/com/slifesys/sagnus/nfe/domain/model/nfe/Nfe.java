package com.slifesys.sagnus.nfe.domain.model.nfe;

import com.slifesys.sagnus.nfe.domain.exception.NfeDomainException;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Dinheiro;

import java.time.Instant;

public class Nfe {

    private final NfeId id;
    private final Emitente emitente;
    private final Destinatario destinatario;
    private final Instant criadaEm;

    private NfeStatus status;

    public Nfe(Emitente emitente, Destinatario destinatario) {
        if (emitente == null || destinatario == null) {
            throw new NfeDomainException("Emitente e destinatário são obrigatórios");
        }

        this.id = NfeId.novo();
        this.emitente = emitente;
        this.destinatario = destinatario;
        this.criadaEm = Instant.now();
        this.status = NfeStatus.RASCUNHO;
    }

    public void validar() {
        if (status != NfeStatus.RASCUNHO) {
            throw new NfeDomainException("NFe não pode ser validada neste estado");
        }
        status = NfeStatus.VALIDADA;
    }

    public void emitir() {
        if (status != NfeStatus.VALIDADA) {
            throw new NfeDomainException("NFe deve estar VALIDADA para emitir");
        }
        status = NfeStatus.EMITIDA;
    }
    private final java.util.List<NfeItem> itens = new java.util.ArrayList<>();

    public void adicionarItem(NfeItem item) {
        if (status != NfeStatus.RASCUNHO) {
            throw new NfeDomainException("Só pode alterar itens no status RASCUNHO");
        }
        if (item == null) throw new IllegalArgumentException("Item é obrigatório");
        itens.add(item);
    }

    public java.util.List<NfeItem> getItens() {
        return java.util.Collections.unmodifiableList(itens);
    }

    public NfeTotais calcularTotais() {
        var vProd = Dinheiro.zero();
        var vDesc = Dinheiro.zero();
        var vFrete = Dinheiro.zero();
        var vSeg   = Dinheiro.zero();
        var vOutro = Dinheiro.zero();

        for (var it : itens) {
            vProd = vProd.add(it.getValorBruto());
            vDesc = vDesc.add(it.getDesconto());
            vFrete = vFrete.add(it.getFrete());
            vSeg = vSeg.add(it.getSeguro());
            vOutro = vOutro.add(it.getOutras());
        }

        var vNF = vProd.sub(vDesc).add(vFrete).add(vSeg).add(vOutro);
        return new NfeTotais(vProd, vDesc, vFrete, vSeg, vOutro, vNF);
    }

    public NfeId getId() { return id; }
    public NfeStatus getStatus() { return status; }
}

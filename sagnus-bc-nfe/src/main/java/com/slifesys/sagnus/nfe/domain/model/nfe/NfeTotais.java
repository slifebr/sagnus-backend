package com.slifesys.sagnus.nfe.domain.model.nfe;

import com.slifesys.sagnus.nfe.domain.model.fiscal.Dinheiro;

public final class NfeTotais {
    private final Dinheiro vProd;
    private final Dinheiro vDesc;
    private final Dinheiro vFrete;
    private final Dinheiro vSeg;
    private final Dinheiro vOutro;
    private final Dinheiro vNF;

    public NfeTotais(Dinheiro vProd, Dinheiro vDesc, Dinheiro vFrete, Dinheiro vSeg, Dinheiro vOutro, Dinheiro vNF) {
        this.vProd = vProd;
        this.vDesc = vDesc;
        this.vFrete = vFrete;
        this.vSeg = vSeg;
        this.vOutro = vOutro;
        this.vNF = vNF;
    }

    public Dinheiro getvProd(){ return vProd; }
    public Dinheiro getvDesc(){ return vDesc; }
    public Dinheiro getvFrete(){ return vFrete; }
    public Dinheiro getvSeg(){ return vSeg; }
    public Dinheiro getvOutro(){ return vOutro; }
    public Dinheiro getvNF(){ return vNF; }
}

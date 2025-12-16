package com.slifesys.sagnus.nfe.domain.model.imposto;

public final class TributosItem {
    private final Icms icms;
    private final Ipi ipi;
    private final Pis pis;
    private final Cofins cofins;

    public TributosItem(Icms icms, Ipi ipi, Pis pis, Cofins cofins) {
        this.icms = icms;
        this.ipi = ipi;
        this.pis = pis;
        this.cofins = cofins;
    }

    public Icms getIcms(){ return icms; }
    public Ipi getIpi(){ return ipi; }
    public Pis getPis(){ return pis; }
    public Cofins getCofins(){ return cofins; }
}

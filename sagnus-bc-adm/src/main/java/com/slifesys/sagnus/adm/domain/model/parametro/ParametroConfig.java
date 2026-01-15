package com.slifesys.sagnus.adm.domain.model.parametro;

import com.slifesys.sagnus.adm.domain.model.audit.Audit;

public class ParametroConfig {
    private Long id; // Can be null if represented by independent rows
    private Long finParcelaAberto;
    private Long finParcelaQuitado;
    private Long finParcelaQuitadoParcial;
    private Long finTipoRecebimentoEdi;
    private Long compraFinDocOrigem;
    private Long compraContaCaixa;
    private Audit audit;

    public ParametroConfig() {}

    public ParametroConfig(Long id, Long finParcelaAberto, Long finParcelaQuitado, Long finParcelaQuitadoParcial,
                           Long finTipoRecebimentoEdi, Long compraFinDocOrigem, Long compraContaCaixa, Audit audit) {
        this.id = id;
        this.finParcelaAberto = finParcelaAberto;
        this.finParcelaQuitado = finParcelaQuitado;
        this.finParcelaQuitadoParcial = finParcelaQuitadoParcial;
        this.finTipoRecebimentoEdi = finTipoRecebimentoEdi;
        this.compraFinDocOrigem = compraFinDocOrigem;
        this.compraContaCaixa = compraContaCaixa;
        this.audit = audit;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getFinParcelaAberto() { return finParcelaAberto; }
    public void setFinParcelaAberto(Long finParcelaAberto) { this.finParcelaAberto = finParcelaAberto; }
    public Long getFinParcelaQuitado() { return finParcelaQuitado; }
    public void setFinParcelaQuitado(Long finParcelaQuitado) { this.finParcelaQuitado = finParcelaQuitado; }
    public Long getFinParcelaQuitadoParcial() { return finParcelaQuitadoParcial; }
    public void setFinParcelaQuitadoParcial(Long finParcelaQuitadoParcial) { this.finParcelaQuitadoParcial = finParcelaQuitadoParcial; }
    public Long getFinTipoRecebimentoEdi() { return finTipoRecebimentoEdi; }
    public void setFinTipoRecebimentoEdi(Long finTipoRecebimentoEdi) { this.finTipoRecebimentoEdi = finTipoRecebimentoEdi; }
    public Long getCompraFinDocOrigem() { return compraFinDocOrigem; }
    public void setCompraFinDocOrigem(Long compraFinDocOrigem) { this.compraFinDocOrigem = compraFinDocOrigem; }
    public Long getCompraContaCaixa() { return compraContaCaixa; }
    public void setCompraContaCaixa(Long compraContaCaixa) { this.compraContaCaixa = compraContaCaixa; }
    public Audit getAudit() { return audit; }
    public void setAudit(Audit audit) { this.audit = audit; }
}

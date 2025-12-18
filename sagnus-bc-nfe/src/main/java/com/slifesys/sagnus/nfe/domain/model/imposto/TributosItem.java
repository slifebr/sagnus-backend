package com.slifesys.sagnus.nfe.domain.model.imposto;

import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.CClassTrib;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.Cbs;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.CstIbsCbs;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.Ibs;

import java.util.Optional;

/**
 * Tributos do item da NFe.
 *
 * Compatível com o construtor legado (ICMS/PIS/COFINS/IPI) e estendido no v2 com IBS/CBS.
 *
 * v3 (RTC): adiciona CST IBS/CBS e cClassTrib (por item).
 */
public class TributosItem {

    private final Icms icms;
    private final Pis pis;
    private final Cofins cofins;
    private final Ipi ipi;

    // V2 (IBS/CBS)
    private final Optional<Ibs> ibs;
    private final Optional<Cbs> cbs;

    // V3 (RTC)
    private final Optional<CstIbsCbs> cstIbsCbs;
    private final Optional<CClassTrib> cClassTrib;

    // Construtor legado
    public TributosItem(Icms icms, Pis pis, Cofins cofins, Ipi ipi) {
        this(icms, pis, cofins, ipi, Optional.empty(), Optional.empty(), Optional.empty(), Optional.empty());
    }

    // Construtor v2 (IBS/CBS)
    public TributosItem(Icms icms, Pis pis, Cofins cofins, Ipi ipi, Optional<Ibs> ibs, Optional<Cbs> cbs) {
        this(icms, pis, cofins, ipi, ibs, cbs, Optional.empty(), Optional.empty());
    }

    // Construtor v3 (RTC completo)
    public TributosItem(
            Icms icms,
            Pis pis,
            Cofins cofins,
            Ipi ipi,
            Optional<Ibs> ibs,
            Optional<Cbs> cbs,
            Optional<CstIbsCbs> cstIbsCbs,
            Optional<CClassTrib> cClassTrib
    ) {
        // MVP: estes tributos podem vir nulos enquanto o cálculo legado não estiver plugado
this.icms = icms;
        this.pis = pis;
        this.cofins = cofins;
        this.ipi = ipi;

        this.ibs = ibs == null ? Optional.empty() : ibs;
        this.cbs = cbs == null ? Optional.empty() : cbs;

        this.cstIbsCbs = cstIbsCbs == null ? Optional.empty() : cstIbsCbs;
        this.cClassTrib = cClassTrib == null ? Optional.empty() : cClassTrib;
    }

    public Icms getIcms() { return icms; }
    public Pis getPis() { return pis; }
    public Cofins getCofins() { return cofins; }
    public Ipi getIpi() { return ipi; }

    public Optional<Ibs> getIbs() { return ibs; }
    public Optional<Cbs> getCbs() { return cbs; }

    public Optional<CstIbsCbs> getCstIbsCbs() { return cstIbsCbs; }
    public Optional<CClassTrib> getCClassTrib() { return cClassTrib; }
}

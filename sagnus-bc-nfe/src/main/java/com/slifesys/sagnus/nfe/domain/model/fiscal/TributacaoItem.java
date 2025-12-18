package com.slifesys.sagnus.nfe.domain.model.fiscal;

import com.slifesys.sagnus.nfe.domain.model.imposto.Cofins;
import com.slifesys.sagnus.nfe.domain.model.imposto.Icms;
import com.slifesys.sagnus.nfe.domain.model.imposto.Ipi;
import com.slifesys.sagnus.nfe.domain.model.imposto.Pis;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.Cbs;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.Ibs;

import java.util.Optional;

/**
 * Snapshot de tributaÃ§Ã£o do item.
 * V2 jÃ¡ suporta IBS/CBS sem quebrar o legado.
 */
public record TributacaoItem(
        Optional<Icms> icms,
        Optional<Pis> pis,
        Optional<Cofins> cofins,
        Optional<Ipi> ipi,
        Optional<Ibs> ibs,
        Optional<Cbs> cbs
) {
    public TributacaoItem {
        icms   = icms   == null ? Optional.empty() : icms;
        pis    = pis    == null ? Optional.empty() : pis;
        cofins = cofins == null ? Optional.empty() : cofins;
        ipi    = ipi    == null ? Optional.empty() : ipi;
        ibs    = ibs    == null ? Optional.empty() : ibs;
        cbs    = cbs    == null ? Optional.empty() : cbs;
    }

    public static TributacaoItem vazio() {
        return new TributacaoItem(Optional.empty(), Optional.empty(), Optional.empty(),
                Optional.empty(), Optional.empty(), Optional.empty());
    }
}
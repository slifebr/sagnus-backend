package com.slifesys.sagnus.nfe.infrastructure.xml;

import com.slifesys.sagnus.nfe.domain.model.imposto.TributosItem;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;


/**
 * Adapter RTC (Reforma Tributária do Consumo).
 *
 * Nesta fase ele reutiliza o mesmo gerador XML mínimo (NF-e 4.00) e mantém o ganho principal:
 * - habilitar/desabilitar por feature-flag (application.yml)
 * - evoluir depois com regras/validações e grupos adicionais do RTC
 */
@ConditionalOnProperty(prefix = "sagnus.nfe.xml", name = "layout", havingValue = "RTC2025")
@Component
public class NfeXmlGeneratorRtc2025Adapter extends NfeXmlGeneratorNfe40Adapter {

    @Override
    protected String buildRtcExtraGroups(TributosItem trib) {
        // RTC: emite o grupo próprio (det/imposto/IBSCBS)
        return buildIbsCbsGroup(trib);
    }

    @Override
    protected String buildInfAdProdRtc(TributosItem trib) {
        // RTC: evitamos duplicar IBS/CBS no infAdProd.
        return "";
    }

}

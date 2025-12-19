package com.slifesys.sagnus.nfe.infrastructure.event.spring;

import com.slifesys.sagnus.nfe.application.port.NfeFinderPort;
import com.slifesys.sagnus.nfe.application.port.NfeXmlGeneratorPort;
import com.slifesys.sagnus.nfe.application.port.NfeXmlStorePort;
import com.slifesys.sagnus.nfe.domain.event.NfeEmitidaEvent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@ConditionalOnProperty(prefix = "sagnus.nfe.worker", name = "enabled", havingValue = "false", matchIfMissing = true)
public class NfeEmitidaToXmlListener {

    private final NfeFinderPort finder;
    private final NfeXmlGeneratorPort xmlGenerator;
    private final NfeXmlStorePort xmlStore;

    public NfeEmitidaToXmlListener(NfeFinderPort finder,
                                   NfeXmlGeneratorPort xmlGenerator,
                                   NfeXmlStorePort xmlStore) {
        this.finder = finder;
        this.xmlGenerator = xmlGenerator;
        this.xmlStore = xmlStore;
    }

    @EventListener
    public void on(NfeEmitidaEvent event) {
        String nfeId = event.getNfeId();
        finder.findById(nfeId).ifPresentOrElse(nfe -> {
            String xml = xmlGenerator.generateXml(nfe);
            xmlStore.store(nfeId, xml);
            log.info("[NFE XML] gerado e armazenado: nfeId={}", nfeId);
        }, () -> log.warn("[NFE XML] NFe não encontrada para gerar XML. nfeId={}", nfeId));
    }
}

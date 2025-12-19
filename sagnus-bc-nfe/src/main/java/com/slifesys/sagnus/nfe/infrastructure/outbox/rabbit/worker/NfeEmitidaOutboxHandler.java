package com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit.worker;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.slifesys.sagnus.nfe.application.port.NfeFinderPort;
import com.slifesys.sagnus.nfe.application.port.NfeXmlGeneratorPort;
import com.slifesys.sagnus.nfe.application.port.NfeXmlStorePort;
import com.slifesys.sagnus.nfe.application.port.OutboxMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * Handler: NfeEmitidaEvent -> gerar XML e armazenar.
 */
@Slf4j
@Component
public class NfeEmitidaOutboxHandler implements OutboxWorkerHandler {

    private final ObjectMapper mapper;
    private final NfeFinderPort finder;
    private final NfeXmlGeneratorPort xmlGenerator;
    private final NfeXmlStorePort xmlStore;

    public NfeEmitidaOutboxHandler(ObjectMapper mapper,
                                  NfeFinderPort finder,
                                  NfeXmlGeneratorPort xmlGenerator,
                                  NfeXmlStorePort xmlStore) {
        this.mapper = mapper;
        this.finder = finder;
        this.xmlGenerator = xmlGenerator;
        this.xmlStore = xmlStore;
    }

    @Override
    public boolean supports(String eventType) {
        return "NfeEmitidaEvent".equals(eventType);
    }

    @Override
    public void handle(OutboxMessage message) throws Exception {
        String payload = message.payloadJson();
        if (payload == null || payload.isBlank()) {
            throw new IllegalArgumentException("payloadJson vazio para eventType=" + message.eventType());
        }

        JsonNode root = mapper.readTree(payload);
        String nfeId = text(root, "nfeId");
        if (nfeId == null || nfeId.isBlank()) {
            throw new IllegalArgumentException("payloadJson sem nfeId (eventType=NfeEmitidaEvent)");
        }

        finder.findById(nfeId).ifPresentOrElse(nfe -> {
            String xml = xmlGenerator.generateXml(nfe);
            xmlStore.store(nfeId, xml);
            log.info("[WORKER][NFE XML] gerado e armazenado: nfeId={}, eventId={}", nfeId, message.eventId());
        }, () -> {
            // opção: falhar para retry. Aqui eu prefiro falhar, pois é provável ser timing de persistência.
            throw new IllegalStateException("NFe não encontrada para gerar XML. nfeId=" + nfeId);
        });
    }

    private static String text(JsonNode node, String field) {
        JsonNode v = node.get(field);
        return v == null || v.isNull() ? null : v.asText(null);
    }
}

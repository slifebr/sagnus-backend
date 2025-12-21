package com.slifesys.sagnus.nfe.application.service;

import com.slifesys.sagnus.nfe.application.port.OutboxEventHandler;
import com.slifesys.sagnus.nfe.application.port.OutboxMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Dispatcher de eventos consumidos via Outbox/transportes (Rabbit etc.).
 *
 * - Pluggable: basta criar um bean que implemente {@link OutboxEventHandler}.
 * - Seleção por eventType.
 */
@Slf4j
@Service
public class OutboxEventDispatcher {

    private final Map<String, OutboxEventHandler> handlersByType;

    public OutboxEventDispatcher(List<OutboxEventHandler> handlers) {
        Map<String, OutboxEventHandler> m = new LinkedHashMap<>();
        for (OutboxEventHandler h : handlers) {
            String key = h.eventType();
            if (key == null || key.isBlank()) {
                continue;
            }
            if (m.containsKey(key)) {
                log.warn("[OUTBOX DISPATCH] handler duplicado para eventType={}. Usando o primeiro e ignorando {}", key, h.getClass().getName());
                continue;
            }
            m.put(key, h);
        }
        this.handlersByType = Map.copyOf(m);
        log.info("[OUTBOX DISPATCH] handlers registrados: {}", this.handlersByType.keySet());
    }

    public void dispatch(OutboxMessage msg) throws Exception {
        OutboxEventHandler h = handlersByType.get(msg.eventType());
        if (h == null) {
            log.warn("[OUTBOX DISPATCH] sem handler para eventType={}, eventId={}, correlationId={}",
                    msg.eventType(), msg.eventId(), msg.correlationId());
            return;
        }
        h.handle(msg);
    }
}

package com.slifesys.sagnus.nfe.infrastructure.outbox;

import com.slifesys.sagnus.nfe.application.config.NfeOutboxProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Dispatcher periódico: busca eventos PENDING e envia via transporte.
 */
@Slf4j
@Component
@ConditionalOnProperty(prefix = "sagnus.nfe.outbox", name = "enabled", havingValue = "true", matchIfMissing = true)
public class NfeOutboxDispatcher {

    private final NfeOutboxProperties props;
    private final NfeOutboxService service;

    public NfeOutboxDispatcher(NfeOutboxProperties props, NfeOutboxService service) {
        this.props = props;
        this.service = service;
    }

    @Scheduled(fixedDelayString = "${sagnus.nfe.outbox.pollIntervalMs:2000}")
    public void tick() {
        if (!props.isEnabled()) return;

        try {
            service.dispatchOnce();
        } catch (Exception e) {
            // não derruba o scheduler
            log.warn("[OUTBOX] ciclo falhou: {}", e.getMessage(), e);
        }
    }
}

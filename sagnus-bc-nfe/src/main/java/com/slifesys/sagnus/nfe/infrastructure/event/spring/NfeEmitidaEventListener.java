package com.slifesys.sagnus.nfe.infrastructure.event.spring;

import com.slifesys.sagnus.nfe.domain.event.NfeEmitidaEvent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

/**
 * Listener mínimo para demonstrar o fluxo.
 * Depois vamos substituir por:
 * - gerador XML
 * - client SEFAZ
 * - Outbox publisher
 */
@Slf4j
@Component
public class NfeEmitidaEventListener {

    @EventListener
    public void on(NfeEmitidaEvent event) {
        log.info("[NFE EVENT] {} nfeId={} status={} emitentePessoaId={} destinatarioPessoaId={}",
                //event.eventType(),
                event.getNfeId(),
                event.getStatus(),
                event.getEmitentePessoaId(),
                event.getDestinatarioPessoaId()
        );
    }
}

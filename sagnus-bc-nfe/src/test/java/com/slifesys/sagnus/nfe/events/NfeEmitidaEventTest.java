package com.slifesys.sagnus.nfe.events;

import com.slifesys.sagnus.nfe.domain.event.NfeEmitidaEvent;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class NfeEmitidaEventTest {

    @Test
    void shouldCreateEventWithIdsAndType() {
        NfeEmitidaEvent ev = NfeEmitidaEvent.builder()
                .nfeId("NFE-TEST-1")
                .emitentePessoaId(1L)
                .destinatarioPessoaId(2L)
                .status("EMITIDA")
                .build();

        assertNotNull(ev.getEventId());
        assertNotNull(ev.getOccurredAt());
        assertEquals("NfeEmitidaEvent", ev.getEventType());
        assertEquals("NFE-TEST-1", ev.getNfeId());
    }
}

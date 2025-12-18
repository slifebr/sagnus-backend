package com.slifesys.sagnus.nfe.outbox;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.slifesys.sagnus.nfe.application.config.NfeOutboxRabbitProperties;
import com.slifesys.sagnus.nfe.application.port.OutboxMessage;
import com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit.RabbitOutboxTransportAdapter;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.amqp.rabbit.core.RabbitTemplate;

import java.time.Instant;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class RabbitOutboxTransportAdapterTest {

    @Test
    void devePublicarEnvelopeJsonNoRabbit() throws Exception {
        RabbitTemplate rabbit = mock(RabbitTemplate.class);
        ObjectMapper mapper = new ObjectMapper();

        NfeOutboxRabbitProperties props = new NfeOutboxRabbitProperties();
        props.setExchange("sagnus.nfe.events");
        props.setRoutingKey("nfe.event");

        RabbitOutboxTransportAdapter adapter = new RabbitOutboxTransportAdapter(rabbit, mapper, props);

        OutboxMessage msg = new OutboxMessage(
                "evt-1",
                "NfeEmitidaEvent",
                Instant.parse("2025-12-18T00:00:00Z"),
                "corr-123",
                "{\"nfeId\":\"NFeTEMP\"}"
        );

        adapter.send(msg);

        ArgumentCaptor<String> payloadCaptor = ArgumentCaptor.forClass(String.class);
        verify(rabbit, times(1)).convertAndSend(eq("sagnus.nfe.events"), eq("nfe.event"), payloadCaptor.capture());

        String json = payloadCaptor.getValue();
        assertNotNull(json);
        assertTrue(json.contains("\"eventId\":\"evt-1\""));
        assertTrue(json.contains("\"eventType\":\"NfeEmitidaEvent\""));
        assertTrue(json.contains("\"correlationId\":\"corr-123\""));
        assertTrue(json.contains("\"payloadJson\""));
    }
}

package com.slifesys.sagnus.nfe.outbox;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.slifesys.sagnus.nfe.application.config.NfeOutboxRabbitProperties;
import com.slifesys.sagnus.nfe.application.port.OutboxMessage;
import com.slifesys.sagnus.nfe.infrastructure.outbox.inbox.InboxIdempotencyService;
import com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit.worker.OutboxRabbitWorkerListener;
import com.slifesys.sagnus.nfe.infrastructure.outbox.rabbit.worker.OutboxWorkerHandler;
import com.rabbitmq.client.Channel;
import org.junit.jupiter.api.Test;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.core.RabbitTemplate;

import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.List;
import java.util.Map;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

public class OutboxRabbitWorkerListenerTest {

    @Test
    void quandoJaProcessado_deveAckEParar() throws Exception {
        ObjectMapper mapper = new ObjectMapper().findAndRegisterModules();
        RabbitTemplate rabbit = mock(RabbitTemplate.class);
        InboxIdempotencyService inbox = mock(InboxIdempotencyService.class);
        OutboxWorkerHandler handler = mock(OutboxWorkerHandler.class);
        NfeOutboxRabbitProperties props = new NfeOutboxRabbitProperties();
        props.setQueue("q");

        OutboxRabbitWorkerListener l = new OutboxRabbitWorkerListener(mapper, rabbit, props, inbox, List.of(handler));

        OutboxMessage env = new OutboxMessage("e1", "NfeEmitidaEvent", Instant.now(), "c1", "{}");
        byte[] body = mapper.writeValueAsString(env).getBytes(StandardCharsets.UTF_8);
        MessageProperties mp = new MessageProperties();
        mp.setDeliveryTag(7L);
        Message msg = new Message(body, mp);
        Channel ch = mock(Channel.class);

        when(inbox.alreadyProcessed("e1")).thenReturn(true);

        l.onMessage(msg, ch);

        verify(ch).basicAck(7L, false);
        verifyNoInteractions(rabbit);
        verify(handler, never()).handle(any());
    }

    @Test
    void quandoFalhaMasAindaNaoExcedeu_deveNackParaRetry() throws Exception {
        ObjectMapper mapper = new ObjectMapper().findAndRegisterModules();
        RabbitTemplate rabbit = mock(RabbitTemplate.class);
        InboxIdempotencyService inbox = mock(InboxIdempotencyService.class);
        OutboxWorkerHandler handler = mock(OutboxWorkerHandler.class);
        NfeOutboxRabbitProperties props = new NfeOutboxRabbitProperties();
        props.setQueue("q");
        props.setMaxDeliveries(5);

        OutboxRabbitWorkerListener l = new OutboxRabbitWorkerListener(mapper, rabbit, props, inbox, List.of(handler));

        OutboxMessage env = new OutboxMessage("e2", "NfeEmitidaEvent", Instant.now(), "c2", "{}");
        byte[] body = mapper.writeValueAsString(env).getBytes(StandardCharsets.UTF_8);
        MessageProperties mp = new MessageProperties();
        mp.setDeliveryTag(8L);
        mp.getHeaders().put("x-death", List.of(Map.of("queue", "q", "count", 2L)));
        Message msg = new Message(body, mp);
        Channel ch = mock(Channel.class);

        when(inbox.alreadyProcessed("e2")).thenReturn(false);
        when(handler.supports("NfeEmitidaEvent")).thenReturn(true);
        doThrow(new RuntimeException("boom")).when(handler).handle(any());

        l.onMessage(msg, ch);

        verify(ch).basicNack(8L, false, false);
        // Em falha "ainda dentro" do limite de tentativas, o worker deve apenas NACK (requeue=false)
        // e deixar o DLX+TTL (retryQueue) fazer o redelivery. Não deve publicar em DLQ.
        verify(rabbit, never()).convertAndSend(anyString(), eq(props.getDlqRoutingKey()), anyString());
    }

    @Test
    void quandoExcedeTentativas_deveEnviarParaDlqEAck() throws Exception {
        ObjectMapper mapper = new ObjectMapper().findAndRegisterModules();
        RabbitTemplate rabbit = mock(RabbitTemplate.class);
        InboxIdempotencyService inbox = mock(InboxIdempotencyService.class);
        OutboxWorkerHandler handler = mock(OutboxWorkerHandler.class);
        NfeOutboxRabbitProperties props = new NfeOutboxRabbitProperties();
        props.setQueue("q");
        props.setMaxDeliveries(3);
        props.setDlxExchange("ex");
        props.setDlqRoutingKey("rk.dlq");

        OutboxRabbitWorkerListener l = new OutboxRabbitWorkerListener(mapper, rabbit, props, inbox, List.of(handler));

        OutboxMessage env = new OutboxMessage("e3", "NfeEmitidaEvent", Instant.now(), "c3", "{}");
        byte[] body = mapper.writeValueAsString(env).getBytes(StandardCharsets.UTF_8);
        MessageProperties mp = new MessageProperties();
        mp.setDeliveryTag(9L);
        mp.getHeaders().put("x-death", List.of(Map.of("queue", "q", "count", 2L)));
        Message msg = new Message(body, mp);
        Channel ch = mock(Channel.class);

        when(inbox.alreadyProcessed("e3")).thenReturn(false);
        when(handler.supports("NfeEmitidaEvent")).thenReturn(true);
        doThrow(new RuntimeException("boom")).when(handler).handle(any());

        l.onMessage(msg, ch);

        verify(rabbit).convertAndSend(eq("ex"), eq("rk.dlq"), anyString());
        verify(inbox).markProcessed(eq("e3"), eq("NfeEmitidaEvent"), eq("c3"));
        verify(ch).basicAck(9L, false);
    }
}

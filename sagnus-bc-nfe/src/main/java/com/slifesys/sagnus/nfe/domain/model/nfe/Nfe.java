package com.slifesys.sagnus.nfe.domain.model.nfe;

import lombok.Getter;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Getter
public class Nfe {

    private NfeId id;
    private final Emitente emitente;
    private final Destinatario destinatario;
    private NfeStatus status;
    private Instant createdAt;
    private Instant updatedAt;

    private final List<NfeItem> itens = new ArrayList<>();

    // construtor principal usado no domínio
    public Nfe(Emitente emitente, Destinatario destinatario) {
        this.emitente = emitente;
        this.destinatario = destinatario;
        this.status = NfeStatus.RASCUNHO;
        this.createdAt = Instant.now();
        this.updatedAt = this.createdAt;
    }

    /** usado pelo mapper para “reidratar” a NFe vinda do banco */
    public void rehydrate(NfeId id,
                          NfeStatus status,
                          Instant createdAt,
                          Instant updatedAt) {
        this.id = id;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public void adicionarItem(NfeItem item) {
        this.itens.add(item);
        this.updatedAt = Instant.now();
    }

    /** opcional: para não expor lista mutável */
    public List<NfeItem> getItens() {
        return Collections.unmodifiableList(itens);
    }

    public void validar() {
        // Regras mínimas de consistência (MVP)
        if (emitente == null) throw new IllegalStateException("Emitente é obrigatório.");
        if (destinatario == null) throw new IllegalStateException("Destinatário é obrigatório.");
        if (itens == null || itens.isEmpty()) throw new IllegalStateException("A NFe deve possuir itens.");

        // Você pode acrescentar validações por item aqui (NCM/CFOP etc.)
        // Ex.: validar produto, quantidade > 0, valor unitário >= 0, etc.

        this.status = NfeStatus.VALIDADA;
        this.updatedAt = Instant.now();
    }

    public void emitir() {
        // Regra de transição de estado (DDD)
        if (this.status != NfeStatus.VALIDADA && this.status != NfeStatus.RASCUNHO) {
            throw new IllegalStateException("NFe não pode ser emitida no status: " + this.status);
        }

        // Se permitir emitir direto do rascunho, chama validar
        if (this.status == NfeStatus.RASCUNHO) {
            validar();
        }

        this.status = NfeStatus.EMITIDA;
        this.updatedAt = Instant.now();

        // (Opcional) registrar evento de domínio aqui:
        // domainEvents.add(new NfeEmitidaEvent(...));
    }

}

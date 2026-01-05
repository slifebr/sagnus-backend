package com.slifesys.sagnus.estoque.domain.event;

import com.slifesys.sagnus.shared.domain.event.CorrelatedDomainEvent;
import lombok.Builder;
import lombok.Getter;

@Getter
public class EstoqueLocalCriadoEvent extends CorrelatedDomainEvent {

    private final String estoqueLocalId;
    private final String nome;

    @Builder
    public EstoqueLocalCriadoEvent(String estoqueLocalId, String nome) {
        super();
        this.estoqueLocalId = estoqueLocalId;
        this.nome = nome;
    }
}

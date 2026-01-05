package com.slifesys.sagnus.nfe.domain.event;

import com.slifesys.sagnus.shared.domain.event.CorrelatedDomainEvent;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

/**
 * Evento emitido quando a NFe atinge o status EMITIDA
 * (ou equivalente na sua máquina de estados).
 *
 * Observação: o evento carrega um "snapshot mínimo"
 * para evitar acoplamento com o agregado.
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class NfeEmitidaEvent extends CorrelatedDomainEvent {

    private final String nfeId;
    private final Long emitentePessoaId;
    private final Long destinatarioPessoaId;
    private final String status;

    @Builder
    public NfeEmitidaEvent(String nfeId,
                           Long emitentePessoaId,
                           Long destinatarioPessoaId,
                           String status) {
        super();
        this.nfeId = nfeId;
        this.emitentePessoaId = emitentePessoaId;
        this.destinatarioPessoaId = destinatarioPessoaId;
        this.status = status;
    }
}

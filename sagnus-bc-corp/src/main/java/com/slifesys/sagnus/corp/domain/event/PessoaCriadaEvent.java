package com.slifesys.sagnus.corp.domain.event;

import com.slifesys.sagnus.corp.domain.model.pessoa.PessoaId;
import lombok.Getter;

/**
 * Evento disparado quando uma nova Pessoa é criada.
 */
@Getter
public class PessoaCriadaEvent extends AbstractDomainEvent {

    private final PessoaId pessoaId;
    private final String nome;
    private final String documento;

    public PessoaCriadaEvent(PessoaId pessoaId, String nome, String documento) {
        super();
        this.pessoaId = pessoaId;
        this.nome = nome;
        this.documento = documento;
    }
}

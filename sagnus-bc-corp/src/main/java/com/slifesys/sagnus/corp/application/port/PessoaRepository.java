package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa;
import com.slifesys.sagnus.corp.domain.model.pessoa.PessoaId;
import com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa;

import java.util.Optional;

public interface PessoaRepository {
    Optional<Pessoa> findById(PessoaId id);

    Optional<Pessoa> findByDocumento(String documentoDigits, TipoPessoa tipo);

    Pessoa save(Pessoa pessoa);
}

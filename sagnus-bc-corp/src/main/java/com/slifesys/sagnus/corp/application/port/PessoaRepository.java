package com.slifesys.sagnus.corp.application.port;

import com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa;
import com.slifesys.sagnus.corp.domain.model.pessoa.PessoaId;
import com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;

import java.util.Optional;

public interface PessoaRepository {
    Optional<Pessoa> findById(PessoaId id);

    Optional<Pessoa> findByDocumento(String documentoDigits, TipoPessoa tipo);

    /**
     * Search people for UI lists/autocomplete (read-only). Must remain DB-agnostic.
     */
    PageResult<Pessoa> search(String nome, String documento, PageRequest pageRequest);

    Pessoa save(Pessoa pessoa);
}

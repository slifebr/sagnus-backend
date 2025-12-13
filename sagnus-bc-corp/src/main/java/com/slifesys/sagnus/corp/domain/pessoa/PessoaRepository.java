package com.slifesys.sagnus.corp.domain.pessoa;

import java.util.Optional;

public interface PessoaRepository {
    Optional<Pessoa> findById(Long id);
    Pessoa save(Pessoa pessoa);
}

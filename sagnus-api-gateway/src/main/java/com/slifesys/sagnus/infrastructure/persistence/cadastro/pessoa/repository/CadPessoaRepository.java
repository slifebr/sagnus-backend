package com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.repository;

import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.CadPessoa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface CadPessoaRepository
        extends JpaRepository<CadPessoa, Integer>,
        JpaSpecificationExecutor<CadPessoa> {
    // tudo será feito via Specification.
}

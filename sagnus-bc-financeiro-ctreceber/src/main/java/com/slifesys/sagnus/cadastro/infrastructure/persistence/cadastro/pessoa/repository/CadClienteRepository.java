package com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.repository;

import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.CadCliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface CadClienteRepository
        extends JpaRepository<CadCliente, Integer>,
        JpaSpecificationExecutor<CadCliente> {
    // os métodos derivados que tinha podem ser removidos,
    // porque agora vamos filtrar via Specification
}

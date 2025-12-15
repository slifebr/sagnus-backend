package com.slifesys.sagnus.corp.infrastructure.persistence.jpa.repo;

import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity.PessoaJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PessoaSpringDataRepository extends JpaRepository<PessoaJpaEntity, Long> {
    Optional<PessoaJpaEntity> findByDocumentoAndTipo(String documento, String tipo);
}

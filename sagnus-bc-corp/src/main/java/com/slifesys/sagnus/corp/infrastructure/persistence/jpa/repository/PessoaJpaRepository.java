package com.slifesys.sagnus.corp.infrastructure.persistence.jpa.repository;

import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity.PessoaJpaEntity;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PessoaJpaRepository extends JpaRepository<PessoaJpaEntity, Long> {

    @EntityGraph(attributePaths = {"enderecos","telefones","contatos"})
    Optional<PessoaJpaEntity> findWithChildrenById(Long id);
}

package com.slifesys.sagnus.corp.infrastructure.persistence.jpa.repo;

import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity.PessoaJpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface PessoaSpringDataRepository extends JpaRepository<PessoaJpaEntity, Long> {
    Optional<PessoaJpaEntity> findByDocumentoAndTipo(String documento, String tipo);

    @Query("""
            select p
            from PessoaJpaEntity p
            where (:nome is null or :nome = '' or lower(p.nome) like lower(concat('%', :nome, '%')))
              and (:documento is null or :documento = '' or p.documento like concat('%', :documento, '%'))
            """)
    Page<PessoaJpaEntity> search(@Param("nome") String nome,
                                @Param("documento") String documento,
                                Pageable pageable);
}

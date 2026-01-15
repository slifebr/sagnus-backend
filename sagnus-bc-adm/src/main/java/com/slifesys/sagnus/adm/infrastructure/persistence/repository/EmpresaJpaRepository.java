package com.slifesys.sagnus.adm.infrastructure.persistence.repository;

import com.slifesys.sagnus.adm.infrastructure.persistence.entity.EmpresaEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface EmpresaJpaRepository extends JpaRepository<EmpresaEntity, Long> {

    @Query("SELECT e FROM EmpresaEntity e WHERE (:nome IS NULL OR LOWER(e.nome) LIKE LOWER(CONCAT('%', :nome, '%'))) AND (:nif IS NULL OR e.nif = :nif)")
    Page<EmpresaEntity> findAllByFilter(@Param("nome") String nome, @Param("nif") String nif, Pageable pageable);
}

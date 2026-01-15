package com.slifesys.sagnus.adm.infrastructure.persistence.repository;

import com.slifesys.sagnus.adm.infrastructure.persistence.entity.PerfilEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PerfilJpaRepository extends JpaRepository<PerfilEntity, Long> {
    @Query("SELECT p FROM PerfilEntity p WHERE (:nome IS NULL OR LOWER(p.nome) LIKE LOWER(CONCAT('%', :nome, '%')))")
    Page<PerfilEntity> findAllByFilter(@Param("nome") String nome, Pageable pageable);
}

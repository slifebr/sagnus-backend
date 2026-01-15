package com.slifesys.sagnus.adm.infrastructure.persistence.repository;

import com.slifesys.sagnus.adm.infrastructure.persistence.entity.PermissaoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PermissaoJpaRepository extends JpaRepository<PermissaoEntity, Long> {
    @Query("SELECT p FROM PermissaoEntity p WHERE (:codigo IS NULL OR LOWER(p.codigo) LIKE LOWER(CONCAT('%', :codigo, '%')))")
    Page<PermissaoEntity> findAllByFilter(@Param("codigo") String codigo, Pageable pageable);
}

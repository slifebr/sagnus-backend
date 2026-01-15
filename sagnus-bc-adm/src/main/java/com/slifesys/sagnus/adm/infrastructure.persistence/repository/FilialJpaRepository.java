package com.slifesys.sagnus.adm.infrastructure.persistence.repository;

import com.slifesys.sagnus.adm.infrastructure.persistence.entity.FilialEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface FilialJpaRepository extends JpaRepository<FilialEntity, Long> {
    List<FilialEntity> findByEmpresaId(Long empresaId);

    @Query("SELECT f FROM FilialEntity f WHERE (:empresaId IS NULL OR f.empresa.id = :empresaId) AND (:nome IS NULL OR LOWER(f.nome) LIKE LOWER(CONCAT('%', :nome, '%')))")
    Page<FilialEntity> findAllByFilter(@Param("empresaId") Long empresaId, @Param("nome") String nome,
            Pageable pageable);
}

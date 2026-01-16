package com.slifesys.sagnus.adm.infrastructure.persistence.repository;

import com.slifesys.sagnus.adm.infrastructure.persistence.entity.FilialEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FilialJpaRepository extends JpaRepository<FilialEntity, Long> {
    Optional<FilialEntity> findByCodigo(String codigo);
    
    java.util.List<FilialEntity> findByEmpresaId(Long empresaId);

    @org.springframework.data.jpa.repository.Query("SELECT f FROM FilialEntity f WHERE f.empresa.id = :empresaId AND (:nome IS NULL OR LOWER(f.nome) LIKE LOWER(CONCAT('%', :nome, '%')))")
    org.springframework.data.domain.Page<FilialEntity> findAllByFilter(@org.springframework.data.repository.query.Param("empresaId") Long empresaId, @org.springframework.data.repository.query.Param("nome") String nome, org.springframework.data.domain.Pageable pageable);
}

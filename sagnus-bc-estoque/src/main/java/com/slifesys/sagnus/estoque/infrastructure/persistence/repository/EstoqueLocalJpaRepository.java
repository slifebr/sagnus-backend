package com.slifesys.sagnus.estoque.infrastructure.persistence.repository;

import com.slifesys.sagnus.estoque.infrastructure.persistence.entity.EstoqueLocalEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EstoqueLocalJpaRepository extends JpaRepository<EstoqueLocalEntity, Long> {
}

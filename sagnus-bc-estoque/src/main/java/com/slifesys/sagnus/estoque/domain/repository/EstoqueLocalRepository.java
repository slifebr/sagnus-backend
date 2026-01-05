package com.slifesys.sagnus.estoque.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.slifesys.sagnus.estoque.domain.model.EstoqueLocal;

public interface EstoqueLocalRepository extends JpaRepository<EstoqueLocal, Long> {
}

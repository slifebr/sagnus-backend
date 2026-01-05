package com.slifesys.sagnus.estoque.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.slifesys.sagnus.estoque.domain.model.Sabor;

public interface SaborRepository extends JpaRepository<Sabor, Long> {
}

package com.slifesys.sagnus.estoque.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.slifesys.sagnus.estoque.domain.model.Cor;

public interface CorRepository extends JpaRepository<Cor, Long> {
}

package com.slifesys.sagnus.estoque.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.slifesys.sagnus.estoque.domain.model.Marca;

public interface MarcaRepository extends JpaRepository<Marca, Long> {
}

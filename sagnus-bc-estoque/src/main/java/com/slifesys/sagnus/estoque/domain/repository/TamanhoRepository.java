package com.slifesys.sagnus.estoque.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.slifesys.sagnus.estoque.domain.model.Tamanho;

public interface TamanhoRepository extends JpaRepository<Tamanho, Long> {
}

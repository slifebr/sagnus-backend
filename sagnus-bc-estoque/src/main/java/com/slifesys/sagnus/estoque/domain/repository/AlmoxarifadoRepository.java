package com.slifesys.sagnus.estoque.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.slifesys.sagnus.estoque.domain.model.Almoxarifado;

public interface AlmoxarifadoRepository extends JpaRepository<Almoxarifado, Long> {
}

package com.slifesys.sagnus.adm.infrastructure.repository;

import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ParametroSistemaRepository extends JpaRepository<ParametroSistema, Long> {
}

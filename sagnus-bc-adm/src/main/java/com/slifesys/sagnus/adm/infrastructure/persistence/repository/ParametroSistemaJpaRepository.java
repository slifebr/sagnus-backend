package com.slifesys.sagnus.adm.infrastructure.persistence.repository;

import com.slifesys.sagnus.adm.infrastructure.persistence.entity.ParametroSistemaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface ParametroSistemaJpaRepository extends JpaRepository<ParametroSistemaEntity, Long> {
    Optional<ParametroSistemaEntity> findByChave(String chave);

    List<ParametroSistemaEntity> findByEscopo(String escopo);
}

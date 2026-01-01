package com.slifesys.sagnus.adm.infrastructure.persistence.repository;

import com.slifesys.sagnus.adm.infrastructure.persistence.entity.AdmModuloEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdmModuloJpaRepository extends JpaRepository<AdmModuloEntity, Long> {
}

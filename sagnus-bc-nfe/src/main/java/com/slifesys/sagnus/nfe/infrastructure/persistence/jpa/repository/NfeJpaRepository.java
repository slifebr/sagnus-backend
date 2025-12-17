package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository;

import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NfeJpaRepository extends JpaRepository<NfeEntity, String> {
}

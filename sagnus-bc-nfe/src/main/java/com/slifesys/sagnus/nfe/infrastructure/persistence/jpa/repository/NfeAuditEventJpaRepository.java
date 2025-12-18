package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository;

import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeAuditEventEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NfeAuditEventJpaRepository extends JpaRepository<NfeAuditEventEntity, Long> {
}

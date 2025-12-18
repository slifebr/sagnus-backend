package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository;

import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeOutboxEventEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NfeOutboxEventJpaRepository extends JpaRepository<NfeOutboxEventEntity, Long>, NfeOutboxEventClaimRepository {
}

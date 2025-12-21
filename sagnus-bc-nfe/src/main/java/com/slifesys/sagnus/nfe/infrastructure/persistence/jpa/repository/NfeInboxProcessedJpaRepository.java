package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository;

import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeInboxProcessedEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NfeInboxProcessedJpaRepository extends JpaRepository<NfeInboxProcessedEntity, Long> {
    boolean existsByEventId(String eventId);
}

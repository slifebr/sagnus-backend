package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository;

import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeInboxProcessedEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Repositório Inbox idempotência.
 */
public interface NfeInboxProcessedJpaRepository extends JpaRepository<NfeInboxProcessedEntity, String> {
}

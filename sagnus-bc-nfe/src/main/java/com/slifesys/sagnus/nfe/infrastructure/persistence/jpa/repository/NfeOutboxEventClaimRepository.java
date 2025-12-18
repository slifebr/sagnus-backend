package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository;

import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeOutboxEventEntity;

import java.time.Instant;
import java.util.List;

/**
 * Repositório custom para "claim" (lock + fetch) usando SKIP LOCKED.
 */
public interface NfeOutboxEventClaimRepository {

    List<NfeOutboxEventEntity> claimDueEvents(String workerId,
                                              int batchSize,
                                              Instant now,
                                              Instant lockExpiry);
}

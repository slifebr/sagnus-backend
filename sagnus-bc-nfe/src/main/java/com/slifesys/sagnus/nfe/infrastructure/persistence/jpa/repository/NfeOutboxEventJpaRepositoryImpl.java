package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository;

import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeOutboxEventEntity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

/**
 * Implementação custom de claim usando PostgreSQL + SKIP LOCKED.
 *
 * Importante:
 * - requer transação ativa (o dispatcher chama em @Transactional)
 * - faz lock + marca locked_at/locked_by e retorna as linhas "claimed"
 */
@Repository
public class NfeOutboxEventJpaRepositoryImpl implements NfeOutboxEventClaimRepository {

    @PersistenceContext
    private EntityManager em;

    @Override
    @SuppressWarnings("unchecked")
    public List<NfeOutboxEventEntity> claimDueEvents(String workerId,
                                                     int batchSize,
                                                     Instant now,
                                                     Instant lockExpiry) {

        String sql = """
                WITH cte AS (
                  SELECT id
                    FROM nfe_outbox_event
                   WHERE status = 'PENDING'
                     AND next_attempt_at <= :now
                     AND (locked_at IS NULL OR locked_at < :lockExpiry)
                   ORDER BY occurred_at
                   LIMIT :batchSize
                   FOR UPDATE SKIP LOCKED
                )
                UPDATE nfe_outbox_event o
                   SET locked_at = :now,
                       locked_by = :workerId,
                       updated_at = :now
                  FROM cte
                 WHERE o.id = cte.id
                RETURNING o.*
                """;

        return em.createNativeQuery(sql, NfeOutboxEventEntity.class)
                .setParameter("now", Timestamp.from(now))
                .setParameter("lockExpiry", Timestamp.from(lockExpiry))
                .setParameter("batchSize", batchSize)
                .setParameter("workerId", workerId)
                .getResultList();
    }
}

package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.adapter;

import com.slifesys.sagnus.nfe.application.port.NfeRepository;
import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.mapper.NfeJpaMapper;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository.NfeJpaRepository;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

/**
 * Adapter JPA do BC NFe.
 *
 * Ativação:
 * - por padrão, deixe o InMemory (fallback) funcionar
 * - para ligar JPA, setar: sagnus.nfe.persistence=jpa
 */
@Repository
@ConditionalOnProperty(name = "sagnus.nfe.persistence", havingValue = "jpa")
public class NfeJpaRepositoryAdapter implements NfeRepository {

    private final NfeJpaRepository repo;

    public NfeJpaRepositoryAdapter(NfeJpaRepository repo) {
        this.repo = repo;
    }

    @Override
    @Transactional
    public Nfe save(Nfe nfe) {
        Objects.requireNonNull(nfe, "Nfe é obrigatória");
        var entity = NfeJpaMapper.toEntity(nfe);
        var saved = repo.save(entity);
        // Neste estágio, retornamos o próprio agregado em memória (já com id).
        // Se você quiser garantir read-back, pode fazer: return NfeJpaMapper.toDomain(saved);
        return nfe;
    }
}

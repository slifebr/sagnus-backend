package com.slifesys.sagnus.nfe.infrastructure.persistence.memory;

import com.slifesys.sagnus.nfe.application.port.NfeFinderPort;
import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.stereotype.Component;

import java.util.Optional;

/**
 * Implementação do NfeFinderPort para modo InMemory.
 *
 * Ativa por default quando não existir outro bean de NfeFinderPort (ex.: JPA).
 */
@Component
@ConditionalOnMissingBean(NfeFinderPort.class)
public class InMemoryNfeFinderAdapter implements NfeFinderPort {

    private final InMemoryNfeRepositoryAdapter repo;

    public InMemoryNfeFinderAdapter(InMemoryNfeRepositoryAdapter repo) {
        this.repo = repo;
    }

    @Override
    public Optional<Nfe> findById(String nfeId) {
        return Optional.ofNullable(repo.findById(nfeId));
    }
}

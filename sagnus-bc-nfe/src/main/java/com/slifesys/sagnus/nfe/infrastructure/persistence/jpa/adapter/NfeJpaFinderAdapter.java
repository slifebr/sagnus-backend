package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.adapter;

import com.slifesys.sagnus.nfe.application.port.NfeFinderPort;
import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.mapper.NfeJpaMapper;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.repository.NfeJpaRepository;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

/**
 * Implementação do NfeFinderPort para modo JPA.
 *
 * Ativação:
 *  sagnus.nfe.persistence=jpa
 */
@Component
@ConditionalOnProperty(name = "sagnus.nfe.persistence", havingValue = "jpa")
public class NfeJpaFinderAdapter implements NfeFinderPort {

    private final NfeJpaRepository repo;

    public NfeJpaFinderAdapter(NfeJpaRepository repo) {
        this.repo = repo;
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Nfe> findById(String nfeId) {
        // Observação: assumimos que o mapper tem toDomain(entity).
        // Se seu mapper ainda não tiver, me mande o NfeJpaMapper que eu ajusto em 1 entrega.
        return repo.findById(nfeId).map(NfeJpaMapper::toDomain);
    }
}

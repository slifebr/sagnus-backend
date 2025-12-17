package com.slifesys.sagnus.nfe.infrastructure.persistence.memory;

import com.slifesys.sagnus.nfe.application.port.NfeRepository;
import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.stereotype.Repository;

import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Adapter mínimo para rodar "end-to-end" sem banco.
 *
 * - Fica ativo como fallback quando NÃO existir outro bean de NfeRepository (ex.: JPA).
 * - Guarda os agregados em memória, por NfeId (String).
 */
@Repository
@ConditionalOnMissingBean(NfeRepository.class)
public class InMemoryNfeRepositoryAdapter implements NfeRepository {

    private final Map<String, Nfe> store = new ConcurrentHashMap<>();

    @Override
    public Nfe save(Nfe nfe) {
        Objects.requireNonNull(nfe, "Nfe é obrigatória");
        Objects.requireNonNull(nfe.getId(), "NfeId é obrigatório");
        Objects.requireNonNull(nfe.getId().getValue(), "NfeId.value é obrigatório");

        store.put(nfe.getId().getValue(), nfe);
        return nfe;
    }

    // Helper opcional (debug/local)
    public Nfe findById(String id) {
        return store.get(id);
    }

    public void clear() {
        store.clear();
    }
}

package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.SetorRepository;
import com.slifesys.sagnus.corp.domain.model.setor.Setor;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaSetorRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class SetorRepositoryAdapter implements SetorRepository {

    private final JpaSetorRepository jpa;

    @Override
    public Setor save(Setor setor) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(setor)));
    }

    @Override
    public Optional<Setor> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }
}

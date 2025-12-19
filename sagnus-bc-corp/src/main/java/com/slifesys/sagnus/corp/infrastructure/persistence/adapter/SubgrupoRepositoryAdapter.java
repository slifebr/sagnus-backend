package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.SubgrupoRepository;
import com.slifesys.sagnus.corp.domain.model.subgrupo.Subgrupo;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaSubgrupoRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class SubgrupoRepositoryAdapter implements SubgrupoRepository {

    private final JpaSubgrupoRepository jpa;

    @Override
    public Subgrupo save(Subgrupo subgrupo) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(subgrupo)));
    }

    @Override
    public Optional<Subgrupo> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }
}

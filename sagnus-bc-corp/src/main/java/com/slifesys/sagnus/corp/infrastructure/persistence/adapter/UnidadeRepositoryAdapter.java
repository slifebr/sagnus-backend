package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.UnidadeRepository;
import com.slifesys.sagnus.corp.domain.model.unidade.Unidade;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaUnidadeRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class UnidadeRepositoryAdapter implements UnidadeRepository {

    private final JpaUnidadeRepository jpa;

    @Override
    public Unidade save(Unidade unidade) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(unidade)));
    }

    @Override
    public Optional<Unidade> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }
}

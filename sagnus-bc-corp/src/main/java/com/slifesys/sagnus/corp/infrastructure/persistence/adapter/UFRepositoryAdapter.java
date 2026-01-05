package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.UFRepository;
import com.slifesys.sagnus.corp.domain.model.uf.UF;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaUFRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class UFRepositoryAdapter implements UFRepository {

    private final JpaUFRepository jpa;

    @Override
    public UF save(UF uf) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(uf)));
    }

    @Override
    public Optional<UF> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }

    @Override
    public Optional<UF> findBySigla(String sigla) {
        return jpa.findBySigla(sigla).map(CorpPersistenceMapper::toDomain);
    }
}

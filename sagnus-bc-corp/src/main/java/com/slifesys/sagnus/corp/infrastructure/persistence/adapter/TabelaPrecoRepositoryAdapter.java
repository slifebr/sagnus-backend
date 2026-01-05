package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.TabelaPrecoRepository;
import com.slifesys.sagnus.corp.domain.model.tabelapreco.TabelaPreco;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaTabelaPrecoRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class TabelaPrecoRepositoryAdapter implements TabelaPrecoRepository {

    private final JpaTabelaPrecoRepository jpa;

    @Override
    public TabelaPreco save(TabelaPreco tabelaPreco) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(tabelaPreco)));
    }

    @Override
    public Optional<TabelaPreco> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }
}

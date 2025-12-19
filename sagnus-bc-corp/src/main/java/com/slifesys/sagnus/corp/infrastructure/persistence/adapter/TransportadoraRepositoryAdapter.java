package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.TransportadoraRepository;
import com.slifesys.sagnus.corp.domain.model.transportadora.Transportadora;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaTransportadoraRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class TransportadoraRepositoryAdapter implements TransportadoraRepository {

    private final JpaTransportadoraRepository jpa;

    @Override
    public Transportadora save(Transportadora transportadora) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(transportadora)));
    }

    @Override
    public Optional<Transportadora> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }
}

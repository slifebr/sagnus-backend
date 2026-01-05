package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.MarcaRepository;
import com.slifesys.sagnus.corp.domain.model.marca.Marca;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaMarcaRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class MarcaRepositoryAdapter implements MarcaRepository {

    private final JpaMarcaRepository jpa;

    @Override
    public Marca save(Marca marca) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(marca)));
    }

    @Override
    public Optional<Marca> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }
}

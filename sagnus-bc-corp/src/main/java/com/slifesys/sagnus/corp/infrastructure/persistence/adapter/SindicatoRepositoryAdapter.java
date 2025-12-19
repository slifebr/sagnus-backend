package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.SindicatoRepository;
import com.slifesys.sagnus.corp.domain.model.sindicato.Sindicato;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaSindicatoRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class SindicatoRepositoryAdapter implements SindicatoRepository {

    private final JpaSindicatoRepository jpa;

    @Override
    public Sindicato save(Sindicato sindicato) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(sindicato)));
    }

    @Override
    public Optional<Sindicato> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }
}

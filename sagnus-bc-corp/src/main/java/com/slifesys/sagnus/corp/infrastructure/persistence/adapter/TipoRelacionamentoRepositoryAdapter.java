package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.TipoRelacionamentoRepository;
import com.slifesys.sagnus.corp.domain.model.tiporelacionamento.TipoRelacionamento;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaTipoRelacionamentoRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class TipoRelacionamentoRepositoryAdapter implements TipoRelacionamentoRepository {

    private final JpaTipoRelacionamentoRepository jpa;

    @Override
    public TipoRelacionamento save(TipoRelacionamento tipoRelacionamento) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(tipoRelacionamento)));
    }

    @Override
    public Optional<TipoRelacionamento> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }
}

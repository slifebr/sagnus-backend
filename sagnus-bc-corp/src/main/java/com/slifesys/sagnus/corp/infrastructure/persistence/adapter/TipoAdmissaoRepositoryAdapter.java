package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.TipoAdmissaoRepository;
import com.slifesys.sagnus.corp.domain.model.tipoadmissao.TipoAdmissao;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaTipoAdmissaoRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class TipoAdmissaoRepositoryAdapter implements TipoAdmissaoRepository {

    private final JpaTipoAdmissaoRepository jpa;

    @Override
    public TipoAdmissao save(TipoAdmissao tipoAdmissao) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(tipoAdmissao)));
    }

    @Override
    public Optional<TipoAdmissao> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }
}

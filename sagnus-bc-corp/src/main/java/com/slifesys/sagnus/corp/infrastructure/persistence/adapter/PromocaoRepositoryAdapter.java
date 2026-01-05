package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.PromocaoRepository;
import com.slifesys.sagnus.corp.domain.model.promocao.Promocao;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaPromocaoRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class PromocaoRepositoryAdapter implements PromocaoRepository {

    private final JpaPromocaoRepository jpa;

    @Override
    public Promocao save(Promocao promocao) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(promocao)));
    }

    @Override
    public Optional<Promocao> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }
}

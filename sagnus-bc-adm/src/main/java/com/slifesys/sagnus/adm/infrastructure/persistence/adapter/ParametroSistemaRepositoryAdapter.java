package com.slifesys.sagnus.adm.infrastructure.persistence.adapter;

import com.slifesys.sagnus.adm.application.port.ParametroSistemaRepository;
import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.ParametroSistemaEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.mapper.AdmPersistenceMapper;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.ParametroSistemaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class ParametroSistemaRepositoryAdapter implements ParametroSistemaRepository {

    private final ParametroSistemaJpaRepository jpaRepository;

    @Override
    public ParametroSistema save(ParametroSistema parametro) {
        ParametroSistemaEntity entity = AdmPersistenceMapper.toJpa(parametro);
        ParametroSistemaEntity saved = jpaRepository.save(entity);
        return AdmPersistenceMapper.toDomain(saved);
    }

    @Override
    public Optional<ParametroSistema> findByChave(String chave) {
        return jpaRepository.findByChave(chave).map(AdmPersistenceMapper::toDomain);
    }

    @Override
    public List<ParametroSistema> findByEscopo(String escopo) {
        return jpaRepository.findByEscopo(escopo).stream().map(AdmPersistenceMapper::toDomain).toList();
    }

    @Override
    public List<ParametroSistema> findAll() {
        return jpaRepository.findAll().stream().map(AdmPersistenceMapper::toDomain).toList();
    }
}

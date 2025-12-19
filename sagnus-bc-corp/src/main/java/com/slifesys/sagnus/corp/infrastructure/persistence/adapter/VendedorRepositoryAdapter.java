package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.VendedorRepository;
import com.slifesys.sagnus.corp.domain.model.vendedor.Vendedor;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaVendedorRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class VendedorRepositoryAdapter implements VendedorRepository {

    private final JpaVendedorRepository jpa;

    @Override
    public Vendedor save(Vendedor vendedor) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(vendedor)));
    }

    @Override
    public Optional<Vendedor> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }
}

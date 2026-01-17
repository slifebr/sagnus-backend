package com.slifesys.sagnus.estoque.infrastructure.persistence.adapter;

import com.slifesys.sagnus.estoque.domain.model.EstoqueLocal;
import com.slifesys.sagnus.estoque.domain.repository.EstoqueLocalRepository;
import com.slifesys.sagnus.estoque.infrastructure.persistence.mapper.EstoqueLocalMapper;
import com.slifesys.sagnus.estoque.infrastructure.persistence.repository.EstoqueLocalJpaRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;


@Repository
@RequiredArgsConstructor
public class EstoqueLocalRepositoryImpl implements EstoqueLocalRepository {

    private final EstoqueLocalJpaRepository estoqueLocalJpaRepository;
    private final EstoqueLocalMapper mapper = EstoqueLocalMapper.INSTANCE;

    @Override
    public EstoqueLocal save(EstoqueLocal estoqueLocal) {
        var entity = mapper.toEntity(estoqueLocal);
        var savedEntity = estoqueLocalJpaRepository.save(entity);
        return mapper.toDomain(savedEntity);
    }

    @Override
    public Optional<EstoqueLocal> findById(Long id) {
        return estoqueLocalJpaRepository.findById(id).map(mapper::toDomain);
    }

    @Override
    public List<EstoqueLocal> findAll() {
        return estoqueLocalJpaRepository.findAll().stream()
                .map(mapper::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public void deleteById(Long id) {
        estoqueLocalJpaRepository.deleteById(id);
    }
}

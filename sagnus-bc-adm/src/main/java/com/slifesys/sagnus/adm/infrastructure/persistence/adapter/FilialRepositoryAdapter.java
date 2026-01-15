package com.slifesys.sagnus.adm.infrastructure.persistence.adapter;

import com.slifesys.sagnus.adm.application.port.FilialRepository;
import com.slifesys.sagnus.adm.domain.model.empresa.Filial;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.FilialEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.mapper.AdmPersistenceMapper;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.FilialJpaRepository;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.EmpresaJpaRepository;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import java.util.Optional;
import java.util.List;

@Component
@RequiredArgsConstructor
public class FilialRepositoryAdapter implements FilialRepository {

    private final FilialJpaRepository jpaRepository;
    private final EmpresaJpaRepository empresaRepository;

    @Override
    public Filial save(Filial filial) {
        var empresaEntity = empresaRepository.findById(filial.getEmpresaId()).orElseThrow();
        FilialEntity entity = AdmPersistenceMapper.toJpa(filial, empresaEntity);
        FilialEntity saved = jpaRepository.save(entity);
        return AdmPersistenceMapper.toDomain(saved);
    }

    @Override
    public Optional<Filial> findById(Long id) {
        return jpaRepository.findById(id).map(AdmPersistenceMapper::toDomain);
    }

    @Override
    public List<Filial> findByEmpresaId(Long empresaId) {
        return jpaRepository.findByEmpresaId(empresaId).stream().map(AdmPersistenceMapper::toDomain).toList();
    }

    @Override
    public PageResult<Filial> findAll(Long empresaId, String nome, PageRequest pageRequest) {
        Sort sort = Sort.by(Sort.Direction.fromString(pageRequest.getSortDirection().name()), pageRequest.getSortBy());
        Pageable pageable = org.springframework.data.domain.PageRequest.of(pageRequest.getPage(), pageRequest.getSize(),
                sort);

        Page<FilialEntity> page = jpaRepository.findAllByFilter(empresaId, nome, pageable);

        return PageResult.<Filial>builder()
                .items(page.getContent().stream().map(AdmPersistenceMapper::toDomain).toList())
                .page(page.getNumber())
                .size(page.getSize())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .build();
    }
}

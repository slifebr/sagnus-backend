package com.slifesys.sagnus.adm.infrastructure.persistence.adapter;

import com.slifesys.sagnus.adm.application.port.EmpresaRepository;
import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.EmpresaEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.mapper.AdmPersistenceMapper;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.EmpresaJpaRepository;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class EmpresaRepositoryAdapter implements EmpresaRepository {

    private final EmpresaJpaRepository jpaRepository;

    @Override
    public Empresa save(Empresa empresa) {
        EmpresaEntity entity = AdmPersistenceMapper.toJpa(empresa);
        EmpresaEntity saved = jpaRepository.save(entity);
        return AdmPersistenceMapper.toDomain(saved);
    }

    @Override
    public Optional<Empresa> findById(Long id) {
        return jpaRepository.findById(id).map(AdmPersistenceMapper::toDomain);
    }

    @Override
    public PageResult<Empresa> findAll(String nome, String nif, PageRequest pageRequest) {
        Sort sort = Sort.by(Sort.Direction.fromString(pageRequest.getDirection().name()), pageRequest.getSortBy());
        Pageable pageable = org.springframework.data.domain.PageRequest.of(pageRequest.getPage(), pageRequest.getSize(),
                sort);

        Page<EmpresaEntity> page = jpaRepository.findAllByFilter(nome, nif, pageable);

        return PageResult.<Empresa>builder()
                .items(page.getContent().stream().map(AdmPersistenceMapper::toDomain).toList())
                .page(page.getNumber())
                .size(page.getSize())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .build();
    }
}

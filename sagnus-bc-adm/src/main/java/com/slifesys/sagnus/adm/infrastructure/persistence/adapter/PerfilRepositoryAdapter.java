package com.slifesys.sagnus.adm.infrastructure.persistence.adapter;

import com.slifesys.sagnus.adm.application.port.PerfilRepository;
import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.PerfilEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.mapper.AdmPersistenceMapper;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.PerfilJpaRepository;
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
public class PerfilRepositoryAdapter implements PerfilRepository {

    private final PerfilJpaRepository jpaRepository;

    @Override
    public Perfil save(Perfil perfil) {
        PerfilEntity entity = AdmPersistenceMapper.toJpa(perfil);
        PerfilEntity saved = jpaRepository.save(entity);
        return AdmPersistenceMapper.toDomain(saved);
    }

    @Override
    public Optional<Perfil> findById(Long id) {
        return jpaRepository.findById(id).map(AdmPersistenceMapper::toDomain);
    }

    @Override
    public List<Perfil> findAllByIds(List<Long> ids) {
        return jpaRepository.findAllById(ids).stream().map(AdmPersistenceMapper::toDomain).toList();
    }

    @Override
    public PageResult<Perfil> findAll(String nome, PageRequest pageRequest) {
        Sort sort = Sort.by(Sort.Direction.fromString(pageRequest.getSortDirection().name()), pageRequest.getSortBy());
        Pageable pageable = org.springframework.data.domain.PageRequest.of(pageRequest.getPage(), pageRequest.getSize(),
                sort);
        Page<PerfilEntity> page = jpaRepository.findAllByFilter(nome, pageable);
        return PageResult.<Perfil>builder()
                .items(page.getContent().stream().map(AdmPersistenceMapper::toDomain).toList())
                .page(page.getNumber())
                .size(page.getSize())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .build();
    }
}

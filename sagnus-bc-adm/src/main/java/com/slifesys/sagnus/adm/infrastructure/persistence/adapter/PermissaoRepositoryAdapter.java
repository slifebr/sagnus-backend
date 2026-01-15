package com.slifesys.sagnus.adm.infrastructure.persistence.adapter;

import com.slifesys.sagnus.adm.application.port.PermissaoRepository;
import com.slifesys.sagnus.adm.domain.model.usuario.Permissao;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.PermissaoEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.mapper.AdmPersistenceMapper;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.PermissaoJpaRepository;
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
public class PermissaoRepositoryAdapter implements PermissaoRepository {

    private final PermissaoJpaRepository jpaRepository;

    @Override
    public Permissao save(Permissao permissao) {
        PermissaoEntity entity = new PermissaoEntity(); // Simple for now
        entity.setId(permissao.getId());
        entity.setCodigo(permissao.getCodigo());
        entity.setDescricao(permissao.getDescricao());
        PermissaoEntity saved = jpaRepository.save(entity);
        return AdmPersistenceMapper.toDomain(saved);
    }

    @Override
    public Optional<Permissao> findById(Long id) {
        return jpaRepository.findById(id).map(AdmPersistenceMapper::toDomain);
    }

    @Override
    public List<Permissao> findAllByIds(List<Long> ids) {
        return jpaRepository.findAllById(ids).stream().map(AdmPersistenceMapper::toDomain).toList();
    }

    @Override
    public PageResult<Permissao> findAll(String codigo, PageRequest pageRequest) {
        Sort sort = Sort.by(Sort.Direction.fromString(pageRequest.getSortDirection().name()), pageRequest.getSortBy());
        Pageable pageable = org.springframework.data.domain.PageRequest.of(pageRequest.getPage(), pageRequest.getSize(),
                sort);
        Page<PermissaoEntity> page = jpaRepository.findAllByFilter(codigo, pageable);
        return PageResult.<Permissao>builder()
                .items(page.getContent().stream().map(AdmPersistenceMapper::toDomain).toList())
                .page(page.getNumber())
                .size(page.getSize())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .build();
    }
}

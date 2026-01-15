package com.slifesys.sagnus.adm.infrastructure.persistence.adapter;

import com.slifesys.sagnus.adm.application.port.UsuarioRepository;
import com.slifesys.sagnus.adm.domain.model.usuario.Usuario;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.UsuarioEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.mapper.AdmPersistenceMapper;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.UsuarioJpaRepository;
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
public class UsuarioRepositoryAdapter implements UsuarioRepository {

    private final UsuarioJpaRepository jpaRepository;

    @Override
    public Usuario save(Usuario usuario) {
        UsuarioEntity entity = AdmPersistenceMapper.toJpa(usuario);
        UsuarioEntity saved = jpaRepository.save(entity);
        return AdmPersistenceMapper.toDomain(saved);
    }

    @Override
    public Optional<Usuario> findById(Long id) {
        return jpaRepository.findById(id).map(AdmPersistenceMapper::toDomain);
    }

    @Override
    public Optional<Usuario> findByUsername(String username) {
        return jpaRepository.findByUsername(username).map(AdmPersistenceMapper::toDomain);
    }

    @Override
    public PageResult<Usuario> findAll(String nome, String username, PageRequest pageRequest) {
        Sort sort = Sort.by(Sort.Direction.fromString(pageRequest.getSortDirection().name()), pageRequest.getSortBy());
        Pageable pageable = org.springframework.data.domain.PageRequest.of(pageRequest.getPage(), pageRequest.getSize(),
                sort);

        Page<UsuarioEntity> page = jpaRepository.findAllByFilter(nome, username, pageable);

        return PageResult.<Usuario>builder()
                .items(page.getContent().stream().map(AdmPersistenceMapper::toDomain).toList())
                .page(page.getNumber())
                .size(page.getSize())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .build();
    }
}

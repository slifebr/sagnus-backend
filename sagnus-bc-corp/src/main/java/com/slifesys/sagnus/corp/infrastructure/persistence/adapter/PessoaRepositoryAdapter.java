package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa;
import com.slifesys.sagnus.corp.domain.model.pessoa.PessoaId;
import com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa;
import com.slifesys.sagnus.corp.application.port.PessoaRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity.PessoaJpaEntity;
import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.repo.PessoaSpringDataRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.PessoaPersistenceMapper;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

import java.time.Instant;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class PessoaRepositoryAdapter implements PessoaRepository {

    private final PessoaSpringDataRepository jpa;

    @Override
    public Optional<Pessoa> findById(PessoaId id) {
        if (id == null || id.getValue() == null)
            return Optional.empty();
        return jpa.findById(id.getValue()).map(PessoaPersistenceMapper::toDomain);
    }

    @Override
    public Optional<Pessoa> findByDocumento(String documentoDigits, TipoPessoa tipo) {
        if (documentoDigits == null || documentoDigits.isBlank() || tipo == null)
            return Optional.empty();
        String t = tipo == TipoPessoa.FISICA ? "F" : "J";
        return jpa.findByDocumentoAndTipo(documentoDigits, t).map(PessoaPersistenceMapper::toDomain);
    }

    @Override
    public Pessoa save(Pessoa pessoa) {
        PessoaJpaEntity entity = PessoaPersistenceMapper.toJpa(pessoa);

        // timestamps base (infra)
        if (entity.getCriadaEm() == null)
            entity.setCriadaEm(Instant.now());
        if (entity.getAtualizadaEm() == null)
            entity.setAtualizadaEm(entity.getCriadaEm());
        entity.setAtualizadaEm(Instant.now());
        if (entity.getAtiva() == null)
            entity.setAtiva(Boolean.TRUE);

        PessoaJpaEntity saved = jpa.save(entity);
        return PessoaPersistenceMapper.toDomain(saved);
    }

    @Override
    public PageResult<Pessoa> search(String nome, String documento, PageRequest pageRequest) {
        if (pageRequest == null) {
            return PageResult.empty(PageRequest.of(0, 20, null, null));
        }

        Sort sort = Sort.unsorted();
        if (pageRequest.getSortBy() != null && !pageRequest.getSortBy().isBlank()) {
            Sort.Direction dir = pageRequest.getDirection() != null && pageRequest.getDirection().name().equalsIgnoreCase("DESC")
                    ? Sort.Direction.DESC
                    : Sort.Direction.ASC;
            // API uses camelCase; DB columns are snake_case, but JPA maps by field.
            // We allow only known safe fields.
            String sortBy = switch (pageRequest.getSortBy()) {
                case "nome" -> "nome";
                case "documento" -> "documento";
                case "tipo" -> "tipo";
                case "ativa" -> "ativa";
                default -> "id";
            };
            sort = Sort.by(dir, sortBy);
        }

        org.springframework.data.domain.PageRequest pageable = org.springframework.data.domain.PageRequest.of(
                pageRequest.getPage(), pageRequest.getSize(), sort);

        Page<PessoaJpaEntity> page = jpa.search(nome, documento, pageable);

        return PageResult.<Pessoa>builder()
                .items(page.getContent().stream().map(PessoaPersistenceMapper::toDomain).toList())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .page(page.getNumber())
                .size(page.getSize())
                .build();
    }
}

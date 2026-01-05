package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.application.port.TransportadoraRepository;
import com.slifesys.sagnus.corp.domain.model.transportadora.Transportadora;
import com.slifesys.sagnus.corp.infrastructure.persistence.repository.JpaTransportadoraRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.CorpPersistenceMapper;
import com.slifesys.sagnus.shared.paging.PageDirection;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class TransportadoraRepositoryAdapter implements TransportadoraRepository {

    private final JpaTransportadoraRepository jpa;

    @Override
    public Transportadora save(Transportadora transportadora) {
        return CorpPersistenceMapper.toDomain(jpa.save(CorpPersistenceMapper.toJpa(transportadora)));
    }

    @Override
    public Optional<Transportadora> findById(Long id) {
        return jpa.findById(id).map(CorpPersistenceMapper::toDomain);
    }

    @Override
    public PageResult<Transportadora> list(PageRequest pageRequest) {
        if (pageRequest == null) {
            return PageResult.empty(PageRequest.of(0, 20, null, null));
        }

        Sort sort = Sort.unsorted();
        if (pageRequest.getSortBy() != null && !pageRequest.getSortBy().isBlank()) {
            Sort.Direction dir = (pageRequest.getDirection() == PageDirection.DESC) ? Sort.Direction.DESC : Sort.Direction.ASC;
            String sortBy = switch (pageRequest.getSortBy()) {
                case "idPessoa" -> "idPessoa";
                case "placaVeiculo" -> "placaVeiculo";
                case "rntc" -> "rntc";
                default -> "id";
            };
            sort = Sort.by(dir, sortBy);
        }

        org.springframework.data.domain.PageRequest pageable = org.springframework.data.domain.PageRequest.of(
                pageRequest.getPage(), pageRequest.getSize(), sort);

        Page<com.slifesys.sagnus.corp.infrastructure.persistence.entity.TransportadoraEntity> page = jpa.findAll(pageable);

        return PageResult.<Transportadora>builder()
                .items(page.getContent().stream().map(CorpPersistenceMapper::toDomain).toList())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .page(page.getNumber())
                .size(page.getSize())
                .build();
    }
}

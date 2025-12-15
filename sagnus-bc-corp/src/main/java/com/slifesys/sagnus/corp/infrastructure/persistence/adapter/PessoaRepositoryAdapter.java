package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa;
import com.slifesys.sagnus.corp.domain.model.pessoa.PessoaId;
import com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa;
import com.slifesys.sagnus.corp.domain.port.PessoaRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity.PessoaJpaEntity;
import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.repo.PessoaSpringDataRepository;
import com.slifesys.sagnus.corp.infrastructure.persistence.mapper.PessoaPersistenceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.Instant;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class PessoaRepositoryAdapter implements PessoaRepository {

    private final PessoaSpringDataRepository jpa;

    @Override
    public Optional<Pessoa> findById(PessoaId id) {
        if (id == null || id.getValue() == null) return Optional.empty();
        return jpa.findById(id.getValue()).map(PessoaPersistenceMapper::toDomain);
    }

    @Override
    public Optional<Pessoa> findByDocumento(String documentoDigits, TipoPessoa tipo) {
        if (documentoDigits == null || documentoDigits.isBlank() || tipo == null) return Optional.empty();
        String t = tipo == TipoPessoa.FISICA ? "F" : "J";
        return jpa.findByDocumentoAndTipo(documentoDigits, t).map(PessoaPersistenceMapper::toDomain);
    }

    @Override
    public Pessoa save(Pessoa pessoa) {
        PessoaJpaEntity entity = PessoaPersistenceMapper.toJpa(pessoa);

        // timestamps base (infra)
        if (entity.getCriadaEm() == null) entity.setCriadaEm(Instant.now());
        if (entity.getAtualizadaEm() == null) entity.setAtualizadaEm(entity.getCriadaEm());
        entity.setAtualizadaEm(Instant.now());
        if (entity.getAtiva() == null) entity.setAtiva(Boolean.TRUE);

        PessoaJpaEntity saved = jpa.save(entity);
        return PessoaPersistenceMapper.toDomain(saved);
    }
}

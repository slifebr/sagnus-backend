package com.slifesys.sagnus.adm.infrastructure.persistence;

import com.slifesys.sagnus.adm.application.port.ModuloRepositoryPort;
import com.slifesys.sagnus.adm.domain.model.*;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.AdmModuloEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.AdmModuloJpaRepository;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class ModuloJpaAdapter implements ModuloRepositoryPort {

    private final AdmModuloJpaRepository repo;

    public ModuloJpaAdapter(AdmModuloJpaRepository repo) {
        this.repo = repo;
    }

    @Override
    public Modulo save(Modulo modulo) {
        AdmModuloEntity entity = (modulo.id() == null) ? new AdmModuloEntity() : repo.findById(modulo.id().value()).orElse(new AdmModuloEntity());

        entity.setCodigo(modulo.codigo());
        entity.setNome(modulo.nome());
        entity.setDescricao(modulo.descricao());
        entity.setCriadoEm(modulo.audit().criadoEm());
        entity.setUsuCriacao(modulo.audit().usuCriacao());
        entity.setAtualizadoEm(modulo.audit().atualizadoEm());
        entity.setUsuAlteracao(modulo.audit().usuAlteracao());

        var saved = repo.save(entity);
        return toDomain(saved);
    }

    @Override
    public Optional<Modulo> findById(ModuloId id) {
        return repo.findById(id.value()).map(this::toDomain);
    }

    @Override
    public List<Modulo> findAll() {
        return repo.findAll().stream().map(this::toDomain).toList();
    }

    private Modulo toDomain(AdmModuloEntity e) {
        return new Modulo(new ModuloId(e.getId()), e.getCodigo(), e.getNome(), e.getDescricao(),
                new Audit(e.getCriadoEm(), e.getUsuCriacao(), e.getAtualizadoEm(), e.getUsuAlteracao()));
    }
}

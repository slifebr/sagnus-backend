package com.slifesys.sagnus.adm.infrastructure.persistence;

import com.slifesys.sagnus.adm.application.port.ParametroRepositoryPort;
import com.slifesys.sagnus.adm.domain.model.*;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.AdmParametroEntity;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.AdmParametroJpaRepository;

import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class ParametroJpaAdapter implements ParametroRepositoryPort {

    private final AdmParametroJpaRepository repo;

    public ParametroJpaAdapter(AdmParametroJpaRepository repo) {
        this.repo = repo;
    }

    @Override
    public Optional<Parametro> findCurrent() {
        return repo.findAll().stream().findFirst().map(this::toDomain);
    }

    @Override
    public Parametro save(Parametro parametro) {
        AdmParametroEntity entity;
        if (parametro.id() != null) {
            entity = repo.findById(parametro.id().value()).orElse(new AdmParametroEntity());
        } else {
            entity = new AdmParametroEntity();
        }

        entity.setFinParcelaAberto(parametro.finParcelaAberto());
        entity.setFinParcelaQuitado(parametro.finParcelaQuitado());
        entity.setFinParcelaQuitadoParcial(parametro.finParcelaQuitadoParcial());
        entity.setFinParcelaQuitadoParcial(parametro.finParcelaQuitadoParcial());
        entity.setFinTipoRecebimentoEdi(parametro.finTipoRecebimentoEdi());
        entity.setCompraFinDocOrigem(parametro.compraFinDocOrigem());
        entity.setCompraContaCaixa(parametro.compraContaCaixa());

        entity.setCriadoEm(parametro.audit().criadoEm());
        entity.setUsuCriacao(parametro.audit().usuCriacao());
        entity.setAtualizadoEm(parametro.audit().atualizadoEm());
        entity.setUsuAlteracao(parametro.audit().usuAlteracao());

        var saved = repo.save(entity);
        return toDomain(saved);
    }

    private Parametro toDomain(AdmParametroEntity e) {
        return new Parametro(
                new ParametroId(e.getId()),
                e.getFinParcelaAberto(),
                e.getFinParcelaQuitado(),
                e.getFinParcelaQuitadoParcial(),
                e.getFinTipoRecebimentoEdi(),
                e.getCompraFinDocOrigem(),
                e.getCompraContaCaixa(),
                new Audit(e.getCriadoEm(), e.getUsuCriacao(), e.getAtualizadoEm(), e.getUsuAlteracao())
        );
    }
}

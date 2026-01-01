package com.slifesys.sagnus.adm.infrastructure.persistence;

import com.slifesys.sagnus.adm.application.port.AgendaRepositoryPort;
import com.slifesys.sagnus.adm.domain.model.*;
import com.slifesys.sagnus.adm.domain.exception.AdmDomainException;
import com.slifesys.sagnus.adm.infrastructure.persistence.entity.*;
import com.slifesys.sagnus.adm.infrastructure.persistence.repository.*;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AgendaJpaAdapter implements AgendaRepositoryPort {

    private final AdmAgenCategoriaJpaRepository categoriaRepo;
    private final AdmAgenCompromissoJpaRepository compromissoRepo;

    public AgendaJpaAdapter(AdmAgenCategoriaJpaRepository categoriaRepo,
                            AdmAgenCompromissoJpaRepository compromissoRepo) {
        this.categoriaRepo = categoriaRepo;
        this.compromissoRepo = compromissoRepo;
    }

    @Override
    public CategoriaCompromisso saveCategoria(CategoriaCompromisso categoria) {
        AdmAgenCategoriaEntity entity = (categoria.id() == null)
                ? new AdmAgenCategoriaEntity()
                : categoriaRepo.findById(categoria.id().value()).orElse(new AdmAgenCategoriaEntity());

        entity.setNome(categoria.nome());
        entity.setCor(categoria.cor());
        entity.setCriadoEm(categoria.audit().criadoEm());
        entity.setUsuCriacao(categoria.audit().usuCriacao());
        entity.setAtualizadoEm(categoria.audit().atualizadoEm());
        entity.setUsuAlteracao(categoria.audit().usuAlteracao());

        var saved = categoriaRepo.save(entity);
        return toDomain(saved);
    }

    @Override
    public List<CategoriaCompromisso> findAllCategorias() {
        return categoriaRepo.findAll().stream().map(this::toDomain).toList();
    }

    @Override
    public Compromisso saveCompromisso(Compromisso compromisso) {
        var categoria = categoriaRepo.findById(compromisso.categoriaId().value())
                .orElseThrow(() -> new AdmDomainException("Categoria não encontrada: " + compromisso.categoriaId().value()));

        AdmAgenCompromissoEntity entity = new AdmAgenCompromissoEntity();
        entity.setCategoria(categoria);
        entity.setColaboradorId(compromisso.colaboradorId());
        entity.setDataCompromisso(compromisso.dataCompromisso());
        entity.setHora(compromisso.hora());
        entity.setDuracao(compromisso.duracao());
        entity.setOnde(compromisso.onde());
        entity.setDescricao(compromisso.descricao());
        entity.setTipo(compromisso.tipo());
        entity.setCriadoEm(compromisso.audit().criadoEm());
        entity.setUsuCriacao(compromisso.audit().usuCriacao());
        entity.setAtualizadoEm(compromisso.audit().atualizadoEm());
        entity.setUsuAlteracao(compromisso.audit().usuAlteracao());

        // convidados
        for (Convite c : compromisso.convidados()) {
            var ce = new AdmAgenConviteEntity();
            ce.setCompromisso(entity);
            ce.setColaboradorId(c.colaboradorId());
            ce.setCriadoEm(compromisso.audit().criadoEm());
            ce.setUsuCriacao(compromisso.audit().usuCriacao());
            entity.getConvidados().add(ce);
        }

        // notificações
        for (Notificacao n : compromisso.notificacoes()) {
            var ne = new AdmAgenNotificacaoEntity();
            ne.setCompromisso(entity);
            ne.setDataNotificacao(n.data());
            ne.setHora(n.hora());
            ne.setTipo(n.tipo());
            ne.setCriadoEm(compromisso.audit().criadoEm());
            ne.setUsuCriacao(compromisso.audit().usuCriacao());
            entity.getNotificacoes().add(ne);
        }

        var saved = compromissoRepo.save(entity);
        return toDomain(saved);
    }

    @Override
    public List<Compromisso> findCompromissosByColaborador(Long colaboradorId) {
        return compromissoRepo.findByColaboradorId(colaboradorId).stream().map(this::toDomain).toList();
    }

    private CategoriaCompromisso toDomain(AdmAgenCategoriaEntity e) {
        return new CategoriaCompromisso(
                new CategoriaId(e.getId()),
                e.getNome(),
                e.getCor(),
                new Audit(e.getCriadoEm(), e.getUsuCriacao(), e.getAtualizadoEm(), e.getUsuAlteracao())
        );
    }

    private Compromisso toDomain(AdmAgenCompromissoEntity e) {
        var audit = new Audit(e.getCriadoEm(), e.getUsuCriacao(), e.getAtualizadoEm(), e.getUsuAlteracao());
        var convites = e.getConvidados().stream().map(c -> new Convite(c.getColaboradorId())).toList();
        var notifs = e.getNotificacoes().stream().map(n -> new Notificacao(n.getDataNotificacao(), n.getHora(), n.getTipo())).toList();

        return new Compromisso(
                new CompromissoId(e.getId()),
                new CategoriaId(e.getCategoria().getId()),
                e.getColaboradorId(),
                e.getDataCompromisso(),
                e.getHora(),
                e.getDuracao(),
                e.getOnde(),
                e.getDescricao(),
                e.getTipo(),
                audit,
                convites,
                notifs
        );
    }
}

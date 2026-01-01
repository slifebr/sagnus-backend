package com.slifesys.sagnus.adm.domain.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Aggregate root: Compromisso na Agenda.
 */
public class Compromisso {

    private final CompromissoId id;
    private final CategoriaId categoriaId;
    private final Long colaboradorId;
    private final LocalDate dataCompromisso;
    private final String hora;
    private final Long duracao;
    private final String onde;
    private final String descricao;
    private final String tipo;
    private final Audit audit;

    private final List<Convite> convidados;
    private final List<Notificacao> notificacoes;

    public Compromisso(
            CompromissoId id,
            CategoriaId categoriaId,
            Long colaboradorId,
            LocalDate dataCompromisso,
            String hora,
            Long duracao,
            String onde,
            String descricao,
            String tipo,
            Audit audit,
            List<Convite> convidados,
            List<Notificacao> notificacoes
    ) {
        this.id = id;
        this.categoriaId = Objects.requireNonNull(categoriaId, "categoriaId");
        this.colaboradorId = Objects.requireNonNull(colaboradorId, "colaboradorId");
        if (colaboradorId <= 0) throw new IllegalArgumentException("colaboradorId inválido");
        this.dataCompromisso = dataCompromisso;
        this.hora = hora;
        this.duracao = duracao;
        this.onde = onde;
        this.descricao = descricao;
        this.tipo = tipo;
        this.audit = Objects.requireNonNull(audit, "audit");
        this.convidados = new ArrayList<>(convidados == null ? List.of() : convidados);
        this.notificacoes = new ArrayList<>(notificacoes == null ? List.of() : notificacoes);
    }

    public CompromissoId id() { return id; }
    public CategoriaId categoriaId() { return categoriaId; }
    public Long colaboradorId() { return colaboradorId; }
    public LocalDate dataCompromisso() { return dataCompromisso; }
    public String hora() { return hora; }
    public Long duracao() { return duracao; }
    public String onde() { return onde; }
    public String descricao() { return descricao; }
    public String tipo() { return tipo; }
    public Audit audit() { return audit; }
    public List<Convite> convidados() { return List.copyOf(convidados); }
    public List<Notificacao> notificacoes() { return List.copyOf(notificacoes); }

    public Compromisso adicionarConvidado(Long colaboradorId) {
        var novosConvidados = new ArrayList<>(this.convidados);
        novosConvidados.add(new Convite(colaboradorId));
        return new Compromisso(id, categoriaId, this.colaboradorId, dataCompromisso, hora, duracao, onde, descricao, tipo, audit, novosConvidados, notificacoes);
    }

    public Compromisso adicionarNotificacao(Notificacao notificacao) {
        var novas = new ArrayList<>(this.notificacoes);
        novas.add(notificacao);
        return new Compromisso(id, categoriaId, this.colaboradorId, dataCompromisso, hora, duracao, onde, descricao, tipo, audit, convidados, novas);
    }
}

package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.command.CreateCompromissoCommand;
import com.slifesys.sagnus.adm.application.port.AgendaRepositoryPort;
import com.slifesys.sagnus.adm.application.result.CreateCompromissoResult;
import com.slifesys.sagnus.adm.domain.model.agenda.Compromisso;
import com.slifesys.sagnus.adm.domain.model.agenda.Convite;
import com.slifesys.sagnus.adm.domain.model.agenda.Notificacao;
import com.slifesys.sagnus.adm.domain.model.audit.Audit;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.List;

@Service
public class CreateCompromissoUseCase {

    private final AgendaRepositoryPort repo;

    public CreateCompromissoUseCase(AgendaRepositoryPort repo) {
        this.repo = repo;
    }

    @Transactional
    public CreateCompromissoResult execute(CreateCompromissoCommand cmd) {
        var now = Instant.now();

        List<Convite> convites = cmd.convidadosColaboradorIds() == null ? java.util.Collections.emptyList()
                : cmd.convidadosColaboradorIds().stream().map(Convite::new).toList();

        List<Notificacao> notificacoes = cmd.notificacoes() == null ? java.util.Collections.emptyList()
                : cmd.notificacoes().stream().map(n -> new Notificacao(n.data(), n.hora() != null ? java.time.LocalTime.parse(n.hora()) : null, String.valueOf(n.tipo()))).toList();

        var compromisso = new Compromisso(
                null,
                cmd.categoriaId(),
                cmd.colaboradorId(),
                cmd.dataCompromisso(),
                cmd.hora() != null ? java.time.LocalTime.parse(cmd.hora()) : null,
                cmd.duracao() != null ? cmd.duracao().intValue() : null,
                cmd.onde(),
                cmd.descricao(),
                cmd.tipo(),
                Audit.novo(cmd.usuCriacao(), now),
                convites,
                notificacoes
        );

        var saved = repo.saveCompromisso(compromisso);
        return new CreateCompromissoResult(saved.getId());
    }
}

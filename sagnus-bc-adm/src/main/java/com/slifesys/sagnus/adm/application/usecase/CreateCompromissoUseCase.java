package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.command.CreateCompromissoCommand;
import com.slifesys.sagnus.adm.application.port.AgendaRepositoryPort;
import com.slifesys.sagnus.adm.application.result.CreateCompromissoResult;
import com.slifesys.sagnus.adm.domain.model.*;

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

        List<Convite> convites = cmd.convidadosColaboradorIds() == null ? List.of()
                : cmd.convidadosColaboradorIds().stream().map(Convite::new).toList();

        List<Notificacao> notificacoes = cmd.notificacoes() == null ? List.of()
                : cmd.notificacoes().stream().map(n -> new Notificacao(n.data(), n.hora(), n.tipo())).toList();

        var compromisso = new Compromisso(
                null,
                new CategoriaId(cmd.categoriaId()),
                cmd.colaboradorId(),
                cmd.dataCompromisso(),
                cmd.hora(),
                cmd.duracao(),
                cmd.onde(),
                cmd.descricao(),
                cmd.tipo(),
                Audit.novo(cmd.usuCriacao(), now),
                convites,
                notificacoes
        );

        var saved = repo.saveCompromisso(compromisso);
        return new CreateCompromissoResult(saved.id().value());
    }
}

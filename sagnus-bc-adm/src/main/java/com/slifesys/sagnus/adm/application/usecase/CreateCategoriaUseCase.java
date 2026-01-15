package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.command.CreateCategoriaCommand;
import com.slifesys.sagnus.adm.application.port.AgendaRepositoryPort;
import com.slifesys.sagnus.adm.application.result.CreateCategoriaResult;
import com.slifesys.sagnus.adm.domain.model.audit.Audit;
import com.slifesys.sagnus.adm.domain.model.agenda.CategoriaCompromisso;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;

@Service
public class CreateCategoriaUseCase {

    private final AgendaRepositoryPort repo;

    public CreateCategoriaUseCase(AgendaRepositoryPort repo) {
        this.repo = repo;
    }

    @Transactional
    public CreateCategoriaResult execute(CreateCategoriaCommand cmd) {
        var now = Instant.now();
        var categoria = new CategoriaCompromisso(null, cmd.nome(), cmd.cor(), Audit.novo(cmd.usuCriacao(), now));
        var saved = repo.saveCategoria(categoria);
        return new CreateCategoriaResult(saved.getId());
    }
}

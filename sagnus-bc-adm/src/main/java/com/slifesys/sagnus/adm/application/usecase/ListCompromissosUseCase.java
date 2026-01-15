package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.port.AgendaRepositoryPort;
import com.slifesys.sagnus.adm.domain.model.agenda.Compromisso;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ListCompromissosUseCase {

    private final AgendaRepositoryPort repo;

    public ListCompromissosUseCase(AgendaRepositoryPort repo) {
        this.repo = repo;
    }

    public List<Compromisso> execute(Long colaboradorId) {
        return repo.findCompromissosByColaborador(colaboradorId);
    }
}

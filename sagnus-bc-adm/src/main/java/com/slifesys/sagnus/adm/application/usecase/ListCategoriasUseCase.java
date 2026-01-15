package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.port.AgendaRepositoryPort;
import com.slifesys.sagnus.adm.domain.model.agenda.CategoriaCompromisso;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ListCategoriasUseCase {

    private final AgendaRepositoryPort repo;

    public ListCategoriasUseCase(AgendaRepositoryPort repo) {
        this.repo = repo;
    }

    public List<CategoriaCompromisso> execute() {
        return repo.findAllCategorias();
    }
}

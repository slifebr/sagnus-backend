package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.port.ModuloRepositoryPort;
import com.slifesys.sagnus.adm.domain.model.modulo.Modulo;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ListModulosUseCase {

    private final ModuloRepositoryPort repo;

    public ListModulosUseCase(ModuloRepositoryPort repo) {
        this.repo = repo;
    }

    public List<Modulo> execute() {
        return repo.findAll();
    }
}

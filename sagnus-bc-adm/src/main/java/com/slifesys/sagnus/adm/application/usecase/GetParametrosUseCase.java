package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.port.ParametroRepositoryPort;
import com.slifesys.sagnus.adm.domain.model.Parametro;

import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class GetParametrosUseCase {

    private final ParametroRepositoryPort repo;

    public GetParametrosUseCase(ParametroRepositoryPort repo) {
        this.repo = repo;
    }

    public Optional<Parametro> execute() {
        return repo.findCurrent();
    }
}

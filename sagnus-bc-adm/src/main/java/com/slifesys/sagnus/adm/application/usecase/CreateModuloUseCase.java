package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.command.CreateModuloCommand;
import com.slifesys.sagnus.adm.application.port.ModuloRepositoryPort;
import com.slifesys.sagnus.adm.application.result.CreateModuloResult;
import com.slifesys.sagnus.adm.domain.model.audit.Audit;
import com.slifesys.sagnus.adm.domain.model.modulo.Modulo;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;

@Service
public class CreateModuloUseCase {

    private final ModuloRepositoryPort moduloRepository;

    public CreateModuloUseCase(ModuloRepositoryPort moduloRepository) {
        this.moduloRepository = moduloRepository;
    }

    @Transactional
    public CreateModuloResult execute(CreateModuloCommand cmd) {
        var now = Instant.now();
        var modulo = new Modulo(null, cmd.codigo(), cmd.nome(), cmd.descricao(), Audit.novo(cmd.usuCriacao(), now));
        var saved = moduloRepository.save(modulo);
        return new CreateModuloResult(saved.getId().getValue());
    }
}

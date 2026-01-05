package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.AlterarSetorCommand;
import com.slifesys.sagnus.corp.application.dto.SetorResult;
import com.slifesys.sagnus.corp.application.port.SetorRepository;
import com.slifesys.sagnus.corp.domain.model.setor.Setor;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarSetorUseCase {

    private final SetorRepository setorRepository;

    @Transactional
    public SetorResult execute(AlterarSetorCommand command) {
        Setor setor = setorRepository.findById(command.getId())
                .orElseThrow(
                        () -> new NotFoundException("CORP-404", "Setor nao encontrado com id: " + command.getId()));

        Setor atualizado = new Setor(
                setor.getId(),
                command.getNome() != null ? command.getNome() : setor.getNome(),
                command.getDescricao() != null ? command.getDescricao() : setor.getDescricao(),
                setor.getCriadoEm(),
                setor.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        Setor salvo = setorRepository.save(atualizado);
        return SetorResult.from(salvo);
    }
}

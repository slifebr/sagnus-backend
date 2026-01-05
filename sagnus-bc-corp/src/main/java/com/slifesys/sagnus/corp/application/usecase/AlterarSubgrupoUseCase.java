package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.AlterarSubgrupoCommand;
import com.slifesys.sagnus.corp.application.dto.SubgrupoResult;
import com.slifesys.sagnus.corp.application.port.SubgrupoRepository;
import com.slifesys.sagnus.corp.domain.model.subgrupo.Subgrupo;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarSubgrupoUseCase {

    private final SubgrupoRepository subgrupoRepository;

    @Transactional
    public SubgrupoResult execute(AlterarSubgrupoCommand command) {
        Subgrupo subgrupo = subgrupoRepository.findById(command.getId())
                .orElseThrow(
                        () -> new NotFoundException("CORP-404", "Subgrupo nao encontrado com id: " + command.getId()));

        Subgrupo atualizado = new Subgrupo(
                subgrupo.getId(),
                command.getIdGrupo() != null ? command.getIdGrupo() : subgrupo.getIdGrupo(),
                command.getNome() != null ? command.getNome() : subgrupo.getNome(),
                command.getDescricao() != null ? command.getDescricao() : subgrupo.getDescricao(),
                subgrupo.getCriadoEm(),
                subgrupo.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        Subgrupo salvo = subgrupoRepository.save(atualizado);
        return SubgrupoResult.from(salvo);
    }
}

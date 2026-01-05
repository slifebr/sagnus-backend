package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.AlterarUnidadeCommand;
import com.slifesys.sagnus.corp.application.dto.UnidadeResult;
import com.slifesys.sagnus.corp.application.port.UnidadeRepository;
import com.slifesys.sagnus.corp.domain.model.unidade.Unidade;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarUnidadeUseCase {

    private final UnidadeRepository unidadeRepository;

    @Transactional
    public UnidadeResult execute(AlterarUnidadeCommand command) {
        Unidade unidade = unidadeRepository.findById(command.getId())
                .orElseThrow(
                        () -> new NotFoundException("CORP-404", "Unidade nao encontrada com id: " + command.getId()));

        Unidade atualizada = new Unidade(
                unidade.getId(),
                command.getSigla() != null ? command.getSigla() : unidade.getSigla(),
                command.getNome() != null ? command.getNome() : unidade.getNome(),
                command.getDescricao() != null ? command.getDescricao() : unidade.getDescricao(),
                unidade.getCriadoEm(),
                unidade.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        Unidade salva = unidadeRepository.save(atualizada);
        return UnidadeResult.from(salva);
    }
}

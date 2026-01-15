package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.command.CadastrarUnidadeCommand;
import com.slifesys.sagnus.corp.application.dto.UnidadeResult;
import com.slifesys.sagnus.corp.application.port.UnidadeRepository;
import com.slifesys.sagnus.corp.domain.model.unidade.Unidade;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarUnidadeUseCase {

    private final UnidadeRepository unidadeRepository;

    @Transactional
    public UnidadeResult execute(CadastrarUnidadeCommand command) {
        Unidade novaUnidade = new Unidade(
                command.getSigla(),
                command.getNome(),
                command.getDescricao(),
                command.getUsuCriacao());
        Unidade salva = unidadeRepository.save(novaUnidade);
        return UnidadeResult.from(salva);
    }
}

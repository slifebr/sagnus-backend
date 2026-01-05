package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.CadastrarSetorCommand;
import com.slifesys.sagnus.corp.application.dto.SetorResult;
import com.slifesys.sagnus.corp.application.port.SetorRepository;
import com.slifesys.sagnus.corp.domain.model.setor.Setor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarSetorUseCase {

    private final SetorRepository setorRepository;

    @Transactional
    public SetorResult execute(CadastrarSetorCommand command) {
        Setor novoSetor = new Setor(
                command.getNome(),
                command.getDescricao(),
                command.getUsuCriacao());
        Setor salvo = setorRepository.save(novoSetor);
        return SetorResult.from(salvo);
    }
}

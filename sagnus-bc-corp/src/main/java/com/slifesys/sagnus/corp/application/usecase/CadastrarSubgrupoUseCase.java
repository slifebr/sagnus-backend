package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.CadastrarSubgrupoCommand;
import com.slifesys.sagnus.corp.application.dto.SubgrupoResult;
import com.slifesys.sagnus.corp.application.port.SubgrupoRepository;
import com.slifesys.sagnus.corp.domain.model.subgrupo.Subgrupo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarSubgrupoUseCase {

    private final SubgrupoRepository subgrupoRepository;

    @Transactional
    public SubgrupoResult execute(CadastrarSubgrupoCommand command) {
        Subgrupo novo = new Subgrupo(
                command.getIdGrupo(),
                command.getNome(),
                command.getDescricao(),
                command.getUsuCriacao());
        Subgrupo salvo = subgrupoRepository.save(novo);
        return SubgrupoResult.from(salvo);
    }
}

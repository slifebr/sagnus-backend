package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.CadastrarUFCommand;
import com.slifesys.sagnus.corp.application.dto.UFResult;
import com.slifesys.sagnus.corp.application.port.UFRepository;
import com.slifesys.sagnus.corp.domain.model.uf.UF;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarUFUseCase {

    private final UFRepository ufRepository;

    @Transactional
    public UFResult execute(CadastrarUFCommand command) {
        UF novaUF = new UF(
                command.getSigla(),
                command.getNome(),
                command.getIcmsInterno(),
                command.getIcmsInterestadual(),
                command.getUsuCriacao());
        UF salvo = ufRepository.save(novaUF);
        return UFResult.from(salvo);
    }
}

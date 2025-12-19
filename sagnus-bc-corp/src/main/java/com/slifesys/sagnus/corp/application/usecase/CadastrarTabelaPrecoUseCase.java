package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.CadastrarTabelaPrecoCommand;
import com.slifesys.sagnus.corp.application.dto.TabelaPrecoResult;
import com.slifesys.sagnus.corp.application.port.TabelaPrecoRepository;
import com.slifesys.sagnus.corp.domain.model.tabelapreco.TabelaPreco;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarTabelaPrecoUseCase {

    private final TabelaPrecoRepository tabelaPrecoRepository;

    @Transactional
    public TabelaPrecoResult execute(CadastrarTabelaPrecoCommand command) {
        TabelaPreco novo = new TabelaPreco(
                command.getNome(),
                command.getDataInicio(),
                command.getDataFim(),
                command.getCoeficiente(),
                command.getUsuCriacao());
        TabelaPreco salvo = tabelaPrecoRepository.save(novo);
        return TabelaPrecoResult.from(salvo);
    }
}

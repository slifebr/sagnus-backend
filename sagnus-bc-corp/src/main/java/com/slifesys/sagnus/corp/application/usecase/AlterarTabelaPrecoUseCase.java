package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.AlterarTabelaPrecoCommand;
import com.slifesys.sagnus.corp.application.dto.TabelaPrecoResult;
import com.slifesys.sagnus.corp.application.port.TabelaPrecoRepository;
import com.slifesys.sagnus.corp.domain.model.tabelapreco.TabelaPreco;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarTabelaPrecoUseCase {

    private final TabelaPrecoRepository tabelaPrecoRepository;

    @Transactional
    public TabelaPrecoResult execute(AlterarTabelaPrecoCommand command) {
        TabelaPreco tabela = tabelaPrecoRepository.findById(command.getId())
                .orElseThrow(() -> new NotFoundException("CORP-404",
                        "Tabela de Preco nao encontrada com id: " + command.getId()));

        TabelaPreco atualizada = new TabelaPreco(
                tabela.getId(),
                command.getNome() != null ? command.getNome() : tabela.getNome(),
                command.getDataInicio() != null ? command.getDataInicio() : tabela.getDataInicio(),
                command.getDataFim() != null ? command.getDataFim() : tabela.getDataFim(),
                command.getCoeficiente() != null ? command.getCoeficiente() : tabela.getCoeficiente(),
                tabela.getCriadoEm(),
                tabela.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        TabelaPreco salvo = tabelaPrecoRepository.save(atualizada);
        return TabelaPrecoResult.from(salvo);
    }
}

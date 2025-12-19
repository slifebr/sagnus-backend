package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.TabelaPrecoResult;
import com.slifesys.sagnus.corp.application.port.TabelaPrecoRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterTabelaPrecoUseCase {

    private final TabelaPrecoRepository tabelaPrecoRepository;

    @Transactional(readOnly = true)
    public TabelaPrecoResult execute(Long id) {
        return tabelaPrecoRepository.findById(id)
                .map(TabelaPrecoResult::from)
                .orElseThrow(() -> new NotFoundException("CORP-404", "Tabela de Preco nao encontrada com id: " + id));
    }
}

package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.UnidadeResult;
import com.slifesys.sagnus.corp.application.port.UnidadeRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterUnidadeUseCase {

    private final UnidadeRepository unidadeRepository;

    @Transactional(readOnly = true)
    public UnidadeResult execute(Long id) {
        return unidadeRepository.findById(id)
                .map(UnidadeResult::from)
                .orElseThrow(() -> new NotFoundException("CORP-404", "Unidade nao encontrada com id: " + id));
    }
}

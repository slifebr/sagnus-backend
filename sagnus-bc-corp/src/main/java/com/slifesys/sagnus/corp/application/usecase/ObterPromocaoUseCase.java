package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.PromocaoResult;
import com.slifesys.sagnus.corp.application.port.PromocaoRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterPromocaoUseCase {

    private final PromocaoRepository promocaoRepository;

    @Transactional(readOnly = true)
    public PromocaoResult execute(Long id) {
        return promocaoRepository.findById(id)
                .map(PromocaoResult::from)
                .orElseThrow(() -> new NotFoundException("CORP-404", "Promocao nao encontrada com id: " + id));
    }
}

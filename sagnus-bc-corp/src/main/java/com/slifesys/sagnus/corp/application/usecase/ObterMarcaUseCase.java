package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.MarcaResult;
import com.slifesys.sagnus.corp.application.port.MarcaRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterMarcaUseCase {

    private final MarcaRepository marcaRepository;

    @Transactional(readOnly = true)
    public MarcaResult execute(Long id) {
        return marcaRepository.findById(id)
                .map(MarcaResult::from)
                .orElseThrow(() -> new NotFoundException("CORP-404", "Marca nao encontrada com id: " + id));
    }
}

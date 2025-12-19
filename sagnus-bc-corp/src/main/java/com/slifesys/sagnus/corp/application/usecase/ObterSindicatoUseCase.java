package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.SindicatoResult;
import com.slifesys.sagnus.corp.application.port.SindicatoRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterSindicatoUseCase {

    private final SindicatoRepository sindicatoRepository;

    @Transactional(readOnly = true)
    public SindicatoResult execute(Long id) {
        return sindicatoRepository.findById(id)
                .map(SindicatoResult::from)
                .orElseThrow(() -> new NotFoundException("CORP-404", "Sindicato nao encontrado com id: " + id));
    }
}

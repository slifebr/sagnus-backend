package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.TipoRelacionamentoResult;
import com.slifesys.sagnus.corp.application.port.TipoRelacionamentoRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterTipoRelacionamentoUseCase {

    private final TipoRelacionamentoRepository tipoRelacionamentoRepository;

    @Transactional(readOnly = true)
    public TipoRelacionamentoResult execute(Long id) {
        return tipoRelacionamentoRepository.findById(id)
                .map(TipoRelacionamentoResult::from)
                .orElseThrow(
                        () -> new NotFoundException("CORP-404", "TipoRelacionamento nao encontrado com id: " + id));
    }
}

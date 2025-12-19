package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.TipoAdmissaoResult;
import com.slifesys.sagnus.corp.application.port.TipoAdmissaoRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterTipoAdmissaoUseCase {

    private final TipoAdmissaoRepository tipoAdmissaoRepository;

    @Transactional(readOnly = true)
    public TipoAdmissaoResult execute(Long id) {
        return tipoAdmissaoRepository.findById(id)
                .map(TipoAdmissaoResult::from)
                .orElseThrow(() -> new NotFoundException("CORP-404", "TipoAdmissao nao encontrado com id: " + id));
    }
}

package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.SetorResult;
import com.slifesys.sagnus.corp.application.port.SetorRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterSetorUseCase {

    private final SetorRepository setorRepository;

    @Transactional(readOnly = true)
    public SetorResult execute(Long id) {
        return setorRepository.findById(id)
                .map(SetorResult::from)
                .orElseThrow(() -> new NotFoundException("CORP-404", "Setor nao encontrado com id: " + id));
    }
}

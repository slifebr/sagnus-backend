package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.UFResult;
import com.slifesys.sagnus.corp.application.port.UFRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterUFUseCase {

    private final UFRepository ufRepository;

    @Transactional(readOnly = true)
    public UFResult execute(Long id) {
        return ufRepository.findById(id)
                .map(UFResult::from)
                .orElseThrow(() -> new NotFoundException("CORP-404", "UF nao encontrada com id: " + id));
    }
}

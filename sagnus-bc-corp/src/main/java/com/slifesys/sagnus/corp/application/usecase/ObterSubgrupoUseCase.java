package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.SubgrupoResult;
import com.slifesys.sagnus.corp.application.port.SubgrupoRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterSubgrupoUseCase {

    private final SubgrupoRepository subgrupoRepository;

    @Transactional(readOnly = true)
    public SubgrupoResult execute(Long id) {
        return subgrupoRepository.findById(id)
                .map(SubgrupoResult::from)
                .orElseThrow(() -> new NotFoundException("CORP-404", "Subgrupo nao encontrado com id: " + id));
    }
}

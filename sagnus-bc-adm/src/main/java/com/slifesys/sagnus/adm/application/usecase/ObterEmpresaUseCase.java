package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.dto.EmpresaResult;
import com.slifesys.sagnus.adm.application.port.EmpresaRepository;
import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterEmpresaUseCase {

    private final EmpresaRepository repository;

    @Transactional(readOnly = true)
    public EmpresaResult execute(Long id) {
        Empresa e = repository.findById(id)
                .orElseThrow(() -> new NotFoundException("ADM-404", "Empresa não encontrada"));
        return EmpresaResult.builder()
                .id(e.getId())
                .nome(e.getNome())
                .nif(e.getNif())
                .ativo(e.isAtivo())
                .build();
    }
}

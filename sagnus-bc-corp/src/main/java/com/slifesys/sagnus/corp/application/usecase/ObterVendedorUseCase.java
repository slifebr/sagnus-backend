package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.VendedorResult;
import com.slifesys.sagnus.corp.application.port.VendedorRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterVendedorUseCase {

    private final VendedorRepository vendedorRepository;

    @Transactional(readOnly = true)
    public VendedorResult execute(Long id) {
        return vendedorRepository.findById(id)
                .map(VendedorResult::from)
                .orElseThrow(() -> new NotFoundException("CORP-404", "Vendedor nao encontrado com id: " + id));
    }
}

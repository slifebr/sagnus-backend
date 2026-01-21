package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.contract.vendedor.VendedorDTO;
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
    public VendedorDTO execute(Long id) {
        return vendedorRepository.findById(id)
                .map(v -> VendedorDTO.builder()
                        .id(v.getId())
                        .idPessoa(v.getIdPessoa())
                        .comissao(v.getComissao())
                        .meta(v.getMeta())
                        .build())
                .orElseThrow(() -> new NotFoundException("CORP-404", "Vendedor nao encontrado com id: " + id));
    }
}

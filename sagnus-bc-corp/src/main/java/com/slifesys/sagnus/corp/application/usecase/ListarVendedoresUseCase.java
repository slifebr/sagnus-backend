package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.contract.vendedor.VendedorDTO;
import com.slifesys.sagnus.corp.application.port.VendedorRepository;
import com.slifesys.sagnus.corp.domain.model.vendedor.Vendedor;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * Listagem paginada (read-only) de Vendedores para telas/BFF.
 */
@Service
@RequiredArgsConstructor
public class ListarVendedoresUseCase {

    private final VendedorRepository vendedorRepository;

    public PageResult<VendedorDTO> execute(PageRequest pageRequest) {
        PageResult<Vendedor> page = vendedorRepository.list(pageRequest);
        return PageResult.<VendedorDTO>builder()
                .items(page.getItems().stream().map(v -> VendedorDTO.builder()
                        .id(v.getId())
                        .idPessoa(v.getIdPessoa())
                        .comissao(v.getComissao())
                        .meta(v.getMeta())
                        .build()).toList())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .page(page.getPage())
                .size(page.getSize())
                .build();
    }
}

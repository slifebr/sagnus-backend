package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.SindicatoResult;
import com.slifesys.sagnus.corp.application.port.SindicatoRepository;
import com.slifesys.sagnus.corp.domain.model.sindicato.Sindicato;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * Listagem paginada (read-only) de Sindicatos para telas/BFF.
 */
@Service
@RequiredArgsConstructor
public class ListarSindicatosUseCase {

    private final SindicatoRepository sindicatoRepository;

    public PageResult<SindicatoResult> execute(PageRequest pageRequest) {
        PageResult<Sindicato> page = sindicatoRepository.list(pageRequest);
        return PageResult.<SindicatoResult>builder()
                .items(page.getItems().stream().map(SindicatoResult::from).toList())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .page(page.getPage())
                .size(page.getSize())
                .build();
    }
}

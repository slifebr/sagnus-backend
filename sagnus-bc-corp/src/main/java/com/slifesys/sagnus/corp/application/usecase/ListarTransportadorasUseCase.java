package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.TransportadoraResult;
import com.slifesys.sagnus.corp.application.port.TransportadoraRepository;
import com.slifesys.sagnus.corp.domain.model.transportadora.Transportadora;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * Listagem paginada (read-only) de Transportadoras para telas/BFF.
 * Mantém o BC agnóstico de tecnologia: depende apenas do Port (Repository).
 */
@Service
@RequiredArgsConstructor
public class ListarTransportadorasUseCase {

    private final TransportadoraRepository transportadoraRepository;

    public PageResult<TransportadoraResult> execute(PageRequest pageRequest) {
        PageResult<Transportadora> page = transportadoraRepository.list(pageRequest);
        return PageResult.<TransportadoraResult>builder()
                .items(page.getItems().stream().map(TransportadoraResult::from).toList())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .page(page.getPage())
                .size(page.getSize())
                .build();
    }
}

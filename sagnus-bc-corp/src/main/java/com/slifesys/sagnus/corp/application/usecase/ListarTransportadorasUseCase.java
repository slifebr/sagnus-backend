package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.contract.transportadora.TransportadoraDTO;
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

    public PageResult<TransportadoraDTO> execute(PageRequest pageRequest) {
        PageResult<Transportadora> page = transportadoraRepository.list(pageRequest);
        return PageResult.<TransportadoraDTO>builder()
                .items(page.getItems().stream().map(t -> TransportadoraDTO.builder()
                        .id(t.getId())
                        .idPessoa(t.getIdPessoa())
                        .placaVeiculo(t.getPlacaVeiculo())
                        .rntc(t.getRntc())
                        .build()).toList())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .page(page.getPage())
                .size(page.getSize())
                .build();
    }
}

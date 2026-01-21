package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.contract.marca.MarcaDTO;
import com.slifesys.sagnus.corp.application.port.MarcaRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterMarcaUseCase {

    private final MarcaRepository marcaRepository;

    @Transactional(readOnly = true)
    public MarcaDTO execute(Long id) {
        return marcaRepository.findById(id)
                .map(m -> MarcaDTO.builder()
                        .id(m.getId())
                        .nome(m.getNome())
                        .descricao(m.getDescricao())
                        .criadoEm(m.getCriadoEm())
                        .usuCriacao(m.getUsuCriacao())
                        .atualizadoEm(m.getAtualizadoEm())
                        .usuAlteracao(m.getUsuAlteracao())
                        .build())
                .orElseThrow(() -> new NotFoundException("CORP-404", "Marca nao encontrada com id: " + id));
    }
}

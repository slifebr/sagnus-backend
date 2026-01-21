package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.contract.marca.MarcaUpdateRequest;
import com.slifesys.sagnus.corp.contract.marca.MarcaDTO;
import com.slifesys.sagnus.corp.application.port.MarcaRepository;
import com.slifesys.sagnus.corp.domain.model.marca.Marca;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarMarcaUseCase {

    private final MarcaRepository marcaRepository;

    @Transactional
    public MarcaDTO execute(Long id, MarcaUpdateRequest command) {
        Marca marca = marcaRepository.findById(id)
                .orElseThrow(
                        () -> new NotFoundException("CORP-404", "Marca nao encontrada com id: " + id));

        Marca atualizada = new Marca(
                marca.getId(),
                command.getNome() != null ? command.getNome() : marca.getNome(),
                command.getDescricao() != null ? command.getDescricao() : marca.getDescricao(),
                marca.getCriadoEm(),
                marca.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        Marca salva = marcaRepository.save(atualizada);
        return MarcaDTO.builder()
                 .id(salva.getId())
                 .nome(salva.getNome())
                 .descricao(salva.getDescricao())
                 .criadoEm(salva.getCriadoEm())
                 .usuCriacao(salva.getUsuCriacao())
                 .atualizadoEm(salva.getAtualizadoEm())
                 .usuAlteracao(salva.getUsuAlteracao())
                 .build();
    }
}

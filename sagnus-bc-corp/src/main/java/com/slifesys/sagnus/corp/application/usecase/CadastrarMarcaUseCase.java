package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.contract.marca.MarcaDTO;
import com.slifesys.sagnus.corp.application.port.MarcaRepository;
import com.slifesys.sagnus.corp.domain.model.marca.Marca;
import com.slifesys.sagnus.corp.contract.marca.MarcaCreateRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarMarcaUseCase {

    private final MarcaRepository marcaRepository;

    @Transactional
    public MarcaDTO execute(MarcaCreateRequest request) {
        Marca novaMarca = new Marca(
                request.getNome(),
                request.getDescricao(),
                request.getUsuCriacao());
        Marca salvo = marcaRepository.save(novaMarca);
        return MarcaDTO.builder()
                .id(salvo.getId())
                .nome(salvo.getNome())
                .descricao(salvo.getDescricao())
                .criadoEm(salvo.getCriadoEm())
                .usuCriacao(salvo.getUsuCriacao())
                .atualizadoEm(salvo.getAtualizadoEm())
                .usuAlteracao(salvo.getUsuAlteracao())
                .build();
    }
}

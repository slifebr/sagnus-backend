package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.dto.FilialResult;
import com.slifesys.sagnus.adm.application.port.FilialRepository;
import com.slifesys.sagnus.adm.domain.model.empresa.Filial;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarFilialUseCase {

    private final FilialRepository repository;

    @Transactional
    public FilialResult execute(Long id, String nome, String codigo, Boolean ativo) {
        Filial filial = repository.findById(id)
                .orElseThrow(() -> new NotFoundException("ADM-404", "Filial não encontrada"));

        if (nome != null)
            filial.setNome(nome);
        if (codigo != null)
            filial.setCodigo(codigo);
        if (ativo != null)
            filial.setAtivo(ativo);

        Filial saved = repository.save(filial);
        return FilialResult.builder()
                .id(saved.getId())
                .empresaId(saved.getEmpresaId())
                .nome(saved.getNome())
                .codigo(saved.getCodigo())
                .ativo(saved.isAtivo())
                .build();
    }
}

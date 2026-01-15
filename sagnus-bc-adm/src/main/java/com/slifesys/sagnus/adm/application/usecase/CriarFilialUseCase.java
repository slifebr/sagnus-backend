package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.dto.FilialResult;
import com.slifesys.sagnus.adm.application.port.FilialRepository;
import com.slifesys.sagnus.adm.domain.model.empresa.Filial;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CriarFilialUseCase {

    private final FilialRepository repository;

    @Transactional
    public FilialResult execute(Long empresaId, String nome, String codigo) {
        Filial filial = Filial.builder()
                .empresaId(empresaId)
                .nome(nome)
                .codigo(codigo)
                .ativo(true)
                .build();
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

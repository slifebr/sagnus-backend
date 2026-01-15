package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.dto.EmpresaResult;
import com.slifesys.sagnus.adm.application.port.EmpresaRepository;
import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarEmpresaUseCase {

    private final EmpresaRepository repository;

    @Transactional
    public EmpresaResult execute(Long id, String nome, String nif, Boolean ativo) {
        Empresa empresa = repository.findById(id)
                .orElseThrow(() -> new NotFoundException("ADM-404", "Empresa não encontrada"));

        if (nome != null)
            empresa.setNome(nome);
        if (nif != null)
            empresa.setNif(nif);
        if (ativo != null)
            empresa.setAtivo(ativo);

        Empresa saved = repository.save(empresa);
        return EmpresaResult.builder()
                .id(saved.getId())
                .nome(saved.getNome())
                .nif(saved.getNif())
                .ativo(saved.isAtivo())
                .build();
    }
}

package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.dto.EmpresaResult;
import com.slifesys.sagnus.adm.application.port.EmpresaRepository;
import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CriarEmpresaUseCase {

    private final EmpresaRepository repository;

    @Transactional
    public EmpresaResult execute(String nome, String nif) {
        Empresa empresa = Empresa.builder()
                .nome(nome)
                .nif(nif)
                .ativo(true)
                .build();
        Empresa saved = repository.save(empresa);
        return EmpresaResult.builder()
                .id(saved.getId())
                .nome(saved.getNome())
                .nif(saved.getNif())
                .ativo(saved.isAtivo())
                .build();
    }
}

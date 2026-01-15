package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.dto.EmpresaResult;
import com.slifesys.sagnus.adm.application.port.EmpresaRepository;
import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ListarEmpresasUseCase {

    private final EmpresaRepository repository;

    @Transactional(readOnly = true)
    public PageResult<EmpresaResult> execute(String nome, String nif, PageRequest pageRequest) {
        PageResult<Empresa> result = repository.findAll(nome, nif, pageRequest);
        return result.map(e -> EmpresaResult.builder()
                .id(e.getId())
                .nome(e.getNome())
                .nif(e.getNif())
                .ativo(e.isAtivo())
                .build());
    }
}

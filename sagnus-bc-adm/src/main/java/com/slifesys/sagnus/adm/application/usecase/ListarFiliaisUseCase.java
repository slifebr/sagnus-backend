package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.dto.FilialResult;
import com.slifesys.sagnus.adm.application.port.FilialRepository;
import com.slifesys.sagnus.adm.domain.model.empresa.Filial;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ListarFiliaisUseCase {

    private final FilialRepository repository;

    @Transactional(readOnly = true)
    public PageResult<FilialResult> execute(Long empresaId, String nome, PageRequest pageRequest) {
        PageResult<Filial> result = repository.findAll(empresaId, nome, pageRequest);
        return result.map(e -> FilialResult.builder()
                .id(e.getId())
                .empresaId(e.getEmpresaId())
                .nome(e.getNome())
                .codigo(e.getCodigo())
                .ativo(e.isAtivo())
                .build());
    }
}

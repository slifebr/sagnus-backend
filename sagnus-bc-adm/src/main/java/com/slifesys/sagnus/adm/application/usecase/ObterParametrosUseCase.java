package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.dto.ParametroResult;
import com.slifesys.sagnus.adm.application.port.ParametroSistemaRepository;
import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ObterParametrosUseCase {

    private final ParametroSistemaRepository repository;

    @Transactional(readOnly = true)
    public List<ParametroResult> execute(String escopo) {
        List<ParametroSistema> list;
        if (escopo != null) {
            list = repository.findByEscopo(escopo);
        } else {
            list = repository.findAll();
        }
        return list.stream().map(p -> ParametroResult.builder()
                .id(p.getId())
                .chave(p.getChave())
                .valor(p.getValor())
                .escopo(p.getEscopo())
                .ativo(p.isAtivo())
                .build()).toList();
    }
}

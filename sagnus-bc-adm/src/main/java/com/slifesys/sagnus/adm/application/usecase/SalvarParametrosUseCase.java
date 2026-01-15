package com.slifesys.sagnus.adm.application.usecase;

import com.slifesys.sagnus.adm.application.dto.ParametroInput;
import com.slifesys.sagnus.adm.application.dto.ParametroResult;
import com.slifesys.sagnus.adm.application.port.ParametroSistemaRepository;
import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class SalvarParametrosUseCase {

    private final ParametroSistemaRepository repository;

    @Transactional
    public List<ParametroResult> execute(List<ParametroInput> inputs) {
        List<ParametroResult> results = new ArrayList<>();

        for (ParametroInput input : inputs) {
            Optional<ParametroSistema> existing = repository.findByChave(input.getChave());
            ParametroSistema param;
            if (existing.isPresent()) {
                param = existing.get();
                param.setValor(input.getValor());
                param.setEscopo(input.getEscopo());
            } else {
                param = ParametroSistema.builder()
                        .chave(input.getChave())
                        .valor(input.getValor())
                        .escopo(input.getEscopo())
                        .ativo(true)
                        .build();
            }
            ParametroSistema saved = repository.save(param);
            results.add(ParametroResult.builder()
                    .id(saved.getId())
                    .chave(saved.getChave())
                    .valor(saved.getValor())
                    .escopo(saved.getEscopo())
                    .ativo(saved.isAtivo())
                    .build());
        }
        return results;
    }
}

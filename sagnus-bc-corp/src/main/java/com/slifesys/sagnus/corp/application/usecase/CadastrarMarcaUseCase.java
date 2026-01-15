package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.command.CadastrarMarcaCommand;
import com.slifesys.sagnus.corp.application.dto.MarcaResult;
import com.slifesys.sagnus.corp.application.port.MarcaRepository;
import com.slifesys.sagnus.corp.domain.model.marca.Marca;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarMarcaUseCase {

    private final MarcaRepository marcaRepository;

    @Transactional
    public MarcaResult execute(CadastrarMarcaCommand command) {
        Marca novaMarca = new Marca(
                command.getNome(),
                command.getDescricao(),
                command.getUsuCriacao());
        Marca salvo = marcaRepository.save(novaMarca);
        return MarcaResult.from(salvo);
    }
}

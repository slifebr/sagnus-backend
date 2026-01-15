package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.command.CadastrarPromocaoCommand;
import com.slifesys.sagnus.corp.application.dto.PromocaoResult;
import com.slifesys.sagnus.corp.application.port.PromocaoRepository;
import com.slifesys.sagnus.corp.domain.model.promocao.Promocao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarPromocaoUseCase {

    private final PromocaoRepository promocaoRepository;

    @Transactional
    public PromocaoResult execute(CadastrarPromocaoCommand command) {
        Promocao novo = new Promocao(
                command.getIdProduto(),
                command.getDataInicio(),
                command.getDataFim(),
                command.getPrecoPromocional(),
                command.getUsuCriacao());
        Promocao salvo = promocaoRepository.save(novo);
        return PromocaoResult.from(salvo);
    }
}

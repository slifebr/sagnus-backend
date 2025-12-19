package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.CadastrarTipoRelacionamentoCommand;
import com.slifesys.sagnus.corp.application.dto.TipoRelacionamentoResult;
import com.slifesys.sagnus.corp.application.port.TipoRelacionamentoRepository;
import com.slifesys.sagnus.corp.domain.model.tiporelacionamento.TipoRelacionamento;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarTipoRelacionamentoUseCase {

    private final TipoRelacionamentoRepository tipoRelacionamentoRepository;

    @Transactional
    public TipoRelacionamentoResult execute(CadastrarTipoRelacionamentoCommand command) {
        TipoRelacionamento novo = new TipoRelacionamento(
                command.getNome(),
                command.getDescricao(),
                command.getUsuCriacao());
        TipoRelacionamento salvo = tipoRelacionamentoRepository.save(novo);
        return TipoRelacionamentoResult.from(salvo);
    }
}

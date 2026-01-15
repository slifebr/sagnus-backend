package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.command.AlterarTipoRelacionamentoCommand;
import com.slifesys.sagnus.corp.application.dto.TipoRelacionamentoResult;
import com.slifesys.sagnus.corp.application.port.TipoRelacionamentoRepository;
import com.slifesys.sagnus.corp.domain.model.tiporelacionamento.TipoRelacionamento;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarTipoRelacionamentoUseCase {

    private final TipoRelacionamentoRepository tipoRelacionamentoRepository;

    @Transactional
    public TipoRelacionamentoResult execute(AlterarTipoRelacionamentoCommand command) {
        TipoRelacionamento tipo = tipoRelacionamentoRepository.findById(command.getId())
                .orElseThrow(() -> new NotFoundException("CORP-404",
                        "TipoRelacionamento nao encontrado com id: " + command.getId()));

        TipoRelacionamento atualizado = new TipoRelacionamento(
                tipo.getId(),
                command.getNome() != null ? command.getNome() : tipo.getNome(),
                command.getDescricao() != null ? command.getDescricao() : tipo.getDescricao(),
                tipo.getCriadoEm(),
                tipo.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        TipoRelacionamento salvo = tipoRelacionamentoRepository.save(atualizado);
        return TipoRelacionamentoResult.from(salvo);
    }
}

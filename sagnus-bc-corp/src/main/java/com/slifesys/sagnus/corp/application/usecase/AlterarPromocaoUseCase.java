package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.AlterarPromocaoCommand;
import com.slifesys.sagnus.corp.application.dto.PromocaoResult;
import com.slifesys.sagnus.corp.application.port.PromocaoRepository;
import com.slifesys.sagnus.corp.domain.model.promocao.Promocao;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarPromocaoUseCase {

    private final PromocaoRepository promocaoRepository;

    @Transactional
    public PromocaoResult execute(AlterarPromocaoCommand command) {
        Promocao promocao = promocaoRepository.findById(command.getId())
                .orElseThrow(
                        () -> new NotFoundException("CORP-404", "Promocao nao encontrada com id: " + command.getId()));

        Promocao atualizada = new Promocao(
                promocao.getId(),
                command.getIdProduto() != null ? command.getIdProduto() : promocao.getIdProduto(),
                command.getDataInicio() != null ? command.getDataInicio() : promocao.getDataInicio(),
                command.getDataFim() != null ? command.getDataFim() : promocao.getDataFim(),
                command.getPrecoPromocional() != null ? command.getPrecoPromocional() : promocao.getPrecoPromocional(),
                promocao.getCriadoEm(),
                promocao.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        Promocao salvo = promocaoRepository.save(atualizada);
        return PromocaoResult.from(salvo);
    }
}

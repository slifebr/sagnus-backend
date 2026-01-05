package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.AlterarTipoAdmissaoCommand;
import com.slifesys.sagnus.corp.application.dto.TipoAdmissaoResult;
import com.slifesys.sagnus.corp.application.port.TipoAdmissaoRepository;
import com.slifesys.sagnus.corp.domain.model.tipoadmissao.TipoAdmissao;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarTipoAdmissaoUseCase {

    private final TipoAdmissaoRepository tipoAdmissaoRepository;

    @Transactional
    public TipoAdmissaoResult execute(AlterarTipoAdmissaoCommand command) {
        TipoAdmissao tipo = tipoAdmissaoRepository.findById(command.getId())
                .orElseThrow(() -> new NotFoundException("CORP-404",
                        "TipoAdmissao nao encontrado com id: " + command.getId()));

        TipoAdmissao atualizado = new TipoAdmissao(
                tipo.getId(),
                command.getCodigo() != null ? command.getCodigo() : tipo.getCodigo(),
                command.getNome() != null ? command.getNome() : tipo.getNome(),
                command.getDescricao() != null ? command.getDescricao() : tipo.getDescricao(),
                tipo.getCriadoEm(),
                tipo.getUsuCriacao(),
                java.time.Instant.now(),
                command.getUsuAlteracao());

        TipoAdmissao salvo = tipoAdmissaoRepository.save(atualizado);
        return TipoAdmissaoResult.from(salvo);
    }
}

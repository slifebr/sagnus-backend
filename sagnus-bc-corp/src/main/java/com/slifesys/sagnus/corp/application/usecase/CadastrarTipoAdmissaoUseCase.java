package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.command.CadastrarTipoAdmissaoCommand;
import com.slifesys.sagnus.corp.application.dto.TipoAdmissaoResult;
import com.slifesys.sagnus.corp.application.port.TipoAdmissaoRepository;
import com.slifesys.sagnus.corp.domain.model.tipoadmissao.TipoAdmissao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarTipoAdmissaoUseCase {

    private final TipoAdmissaoRepository tipoAdmissaoRepository;

    @Transactional
    public TipoAdmissaoResult execute(CadastrarTipoAdmissaoCommand command) {
        TipoAdmissao novo = new TipoAdmissao(
                command.getCodigo(),
                command.getNome(),
                command.getDescricao(),
                command.getUsuCriacao());
        TipoAdmissao salvo = tipoAdmissaoRepository.save(novo);
        return TipoAdmissaoResult.from(salvo);
    }
}

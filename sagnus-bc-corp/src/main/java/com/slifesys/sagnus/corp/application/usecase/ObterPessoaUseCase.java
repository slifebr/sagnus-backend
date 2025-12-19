package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.PessoaResult;
import com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa;
import com.slifesys.sagnus.corp.domain.model.pessoa.PessoaId;
import com.slifesys.sagnus.corp.application.port.PessoaRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ObterPessoaUseCase {

    private final PessoaRepository repo;

    @Transactional(readOnly = true)
    public PessoaResult execute(Long id) {
        Pessoa pessoa = repo.findById(PessoaId.of(id))
                .orElseThrow(() -> new NotFoundException("CORP-404", "Pessoa não encontrada."));

        return PessoaResult.builder()
                .id(pessoa.getId() != null ? pessoa.getId().getValue() : null)
                .tipo(pessoa.getTipo())
                .documento(pessoa.getDocumento().getValue())
                .nome(pessoa.getNome().getValue())
                .email(pessoa.getEmail() != null ? pessoa.getEmail().getValue() : null)
                .site(pessoa.getSite())
                .ativa(pessoa.isAtiva())
                .build();
    }
}

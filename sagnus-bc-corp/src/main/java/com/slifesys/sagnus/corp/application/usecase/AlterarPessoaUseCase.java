package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.AlterarPessoaCommand;
import com.slifesys.sagnus.corp.application.dto.PessoaResult;
import com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa;
import com.slifesys.sagnus.corp.domain.model.pessoa.PessoaId;
import com.slifesys.sagnus.corp.domain.port.PessoaRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AlterarPessoaUseCase {

    private final PessoaRepository repo;

    @Transactional
    public PessoaResult execute(AlterarPessoaCommand cmd) {
        Pessoa pessoa = repo.findById(PessoaId.of(cmd.getId()))
                .orElseThrow(() -> new NotFoundException("CORP-404", "Pessoa não encontrada."));

        pessoa.alterarDados(cmd.getNome(), cmd.getEmail(), cmd.getSite());

        Pessoa saved = repo.save(pessoa);

        return PessoaResult.builder()
                .id(saved.getId() != null ? saved.getId().getValue() : null)
                .tipo(saved.getTipo())
                .documento(saved.getDocumento().getValue())
                .nome(saved.getNome().getValue())
                .email(saved.getEmail() != null ? saved.getEmail().getValue() : null)
                .site(saved.getSite())
                .ativa(saved.isAtiva())
                .build();
    }
}

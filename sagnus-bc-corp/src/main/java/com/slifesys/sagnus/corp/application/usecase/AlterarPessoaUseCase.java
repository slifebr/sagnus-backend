package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.PessoaResult;
import com.slifesys.sagnus.corp.domain.model.pessoa.Endereco;
import com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa;
import com.slifesys.sagnus.corp.domain.model.pessoa.PessoaId;
import com.slifesys.sagnus.corp.domain.port.PessoaRepository;
import com.slifesys.sagnus.shared.error.NotFoundException;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class AlterarPessoaUseCase {

    private final PessoaRepository repo;

    public PessoaResult execute(Long id, String nome, String email, Endereco endereco) {
        Pessoa pessoa = repo.findById(PessoaId.of(id))
                .orElseThrow(() -> new NotFoundException("CORP-404", "Pessoa não encontrada."));

        pessoa.alterarDados(nome, email, endereco);

        Pessoa saved = repo.save(pessoa);

        return PessoaResult.builder()
                .id(saved.getId() != null ? saved.getId().getValue() : null)
                .tipo(saved.getTipo())
                .documento(saved.getDocumento().getValue())
                .nome(saved.getNome().getValue())
                .email(saved.getEmail() != null ? saved.getEmail().getValue() : null)
                .ativa(saved.isAtiva())
                .build();
    }
}

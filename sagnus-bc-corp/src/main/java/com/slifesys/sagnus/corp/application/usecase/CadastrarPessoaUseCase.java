package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.contract.pessoa.PessoaCreateRequest;
import com.slifesys.sagnus.corp.contract.pessoa.PessoaDTO;
import com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa;
import com.slifesys.sagnus.corp.application.port.PessoaRepository;
import com.slifesys.sagnus.shared.error.BusinessException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CadastrarPessoaUseCase {

    private final PessoaRepository repo;

    @Transactional
    public PessoaDTO execute(PessoaCreateRequest cmd) {
        if (cmd == null)
            throw new BusinessException("CORP-099", "Command obrigatório.");

        String docDigits = cmd.getDocumento() == null ? null : cmd.getDocumento().replaceAll("\\D", "");

        repo.findByDocumento(docDigits, com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa.valueOf(cmd.getTipo().name()))
                .ifPresent(p -> {
                    throw new BusinessException("CORP-100", "Já existe pessoa cadastrada com este documento.");
                });

        com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa tipoDomain =
             com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa.valueOf(cmd.getTipo().name());

        Pessoa pessoa = Pessoa.criarNova(tipoDomain, cmd.getDocumento(), cmd.getNome(), cmd.getEmail(),
                cmd.getSite());
        Pessoa saved = repo.save(pessoa);

        return PessoaDTO.builder()
                .id(saved.getId() != null ? saved.getId().getValue() : null)
                .tipo(com.slifesys.sagnus.corp.contract.pessoa.TipoPessoa.valueOf(saved.getTipo().name()))
                .documento(saved.getDocumento().getValue())
                .nome(saved.getNome().getValue())
                .email(saved.getEmail() != null ? saved.getEmail().getValue() : null)
                .site(saved.getSite())
                .ativa(saved.isAtiva())
                .build();
    }
}

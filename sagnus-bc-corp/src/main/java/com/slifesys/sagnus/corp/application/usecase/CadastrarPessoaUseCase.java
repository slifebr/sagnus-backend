package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.CadastrarPessoaCommand;
import com.slifesys.sagnus.corp.application.dto.PessoaResult;
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
    public PessoaResult execute(CadastrarPessoaCommand cmd) {
        if (cmd == null)
            throw new BusinessException("CORP-099", "Command obrigatório.");

        String docDigits = cmd.getDocumento() == null ? null : cmd.getDocumento().replaceAll("\\D", "");

        repo.findByDocumento(docDigits, cmd.getTipo())
                .ifPresent(p -> {
                    throw new BusinessException("CORP-100", "Já existe pessoa cadastrada com este documento.");
                });

        Pessoa pessoa = Pessoa.criarNova(cmd.getTipo(), cmd.getDocumento(), cmd.getNome(), cmd.getEmail(),
                cmd.getSite());
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

package com.slifesys.sagnus.corp.application.pessoa;

import com.slifesys.sagnus.corp.domain.pessoa.Pessoa;
import com.slifesys.sagnus.corp.domain.pessoa.PessoaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PessoaAppService {

    private final PessoaRepository pessoaRepository;

    @Transactional(readOnly = true)
    public Optional<Pessoa> buscarPorId(Long id) {
        return pessoaRepository.findById(id);
    }

    @Transactional
    public Pessoa salvar(Pessoa pessoa) {
        return pessoaRepository.save(pessoa);
    }
}

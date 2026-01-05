package com.slifesys.sagnus.auth.infrastructure.integration;

import com.slifesys.sagnus.corp.contract.pessoa.CorpPessoaQueryPort;
import com.slifesys.sagnus.corp.contract.pessoa.PessoaResumoDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class CorpPessoaGateway {

    private final CorpPessoaQueryPort corpPessoaQueryPort;

    public Optional<PessoaResumoDTO> obterResumoPorPessoaId(Long pessoaId) {
        return corpPessoaQueryPort.obterResumoPorId(pessoaId);
    }
}

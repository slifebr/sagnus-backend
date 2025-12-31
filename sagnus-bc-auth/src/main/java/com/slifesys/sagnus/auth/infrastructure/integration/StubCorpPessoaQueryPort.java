package com.slifesys.sagnus.auth.infrastructure.integration;

import com.slifesys.sagnus.corp.api.contract.pessoa.CorpPessoaQueryPort;
import com.slifesys.sagnus.corp.api.contract.pessoa.PessoaResumoDTO;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@Profile("local")
public class StubCorpPessoaQueryPort implements CorpPessoaQueryPort {

    @Override
    public Optional<PessoaResumoDTO> obterResumoPorId(Long pessoaId) {
        if (pessoaId == null)
            return Optional.empty();
        return Optional.of(PessoaResumoDTO.builder()
                .pessoaId(pessoaId)
                .nome("Stubbed User Local")
                .documento("00000000000")
                .tipo("F")
                .build());
    }

    @Override
    public Optional<PessoaResumoDTO> obterResumoPorDocumento(String documento, String tipo) {
        // Stub implementation
        return Optional.empty();
    }
}

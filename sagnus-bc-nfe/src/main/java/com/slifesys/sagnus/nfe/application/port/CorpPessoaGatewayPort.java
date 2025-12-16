package com.slifesys.sagnus.nfe.application.port;

import com.slifesys.sagnus.corp.api.contract.pessoa.PessoaResumoDTO;

import java.util.Optional;

public interface CorpPessoaGatewayPort {
    Optional<PessoaResumoDTO> obterResumoPorId(Long pessoaId);
}

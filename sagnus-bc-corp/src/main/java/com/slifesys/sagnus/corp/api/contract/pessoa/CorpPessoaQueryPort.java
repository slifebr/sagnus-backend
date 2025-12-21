package com.slifesys.sagnus.corp.api.contract.pessoa;

import java.util.Optional;

public interface CorpPessoaQueryPort {
    Optional<PessoaResumoDTO> obterResumoPorId(Long pessoaId);

    Optional<PessoaResumoDTO> obterResumoPorDocumento(String tipo, String documento);
}

package com.slifesys.sagnus.corp.contract.pessoa;

import java.util.Optional;

/**
 * Port de consulta do BC CORP.
 * Outros BCs dependem APENAS deste contrato.
 */
public interface CorpPessoaQueryPort {
    Optional<PessoaResumoDTO> obterResumoPorId(Long pessoaId);
    Optional<PessoaResumoDTO> obterResumoPorDocumento(String tipo, String documento); // tipo: "F"/"J"
}

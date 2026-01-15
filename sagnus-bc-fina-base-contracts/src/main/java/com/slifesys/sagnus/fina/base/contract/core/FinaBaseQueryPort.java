package com.slifesys.sagnus.fina.base.contract.core;

import java.util.Optional;

/**
 * Port de consulta do BC FINA-BASE.
 * Outros BCs dependem APENAS deste contrato.
 *
 * Obs.: ajuste nomes/assuntos conforme o domínio real do BC.
 */
public interface FinaBaseQueryPort {
    Optional<FBaseResumoDTO> obterResumoPorId(Long id);
    Optional<FBaseResumoDTO> obterResumoPorCodigo(String codigo);
}

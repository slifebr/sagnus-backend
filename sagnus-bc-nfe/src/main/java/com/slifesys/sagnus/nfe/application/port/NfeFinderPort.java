package com.slifesys.sagnus.nfe.application.port;

import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;

import java.util.Optional;

/**
 * Porta de leitura do agregado Nfe (para casos como geração de XML a partir de evento).
 *
 * Observação: separar leitura de escrita evita "crescer" o NfeRepository com responsabilidades demais.
 */
public interface NfeFinderPort {
    Optional<Nfe> findById(String nfeId);
}

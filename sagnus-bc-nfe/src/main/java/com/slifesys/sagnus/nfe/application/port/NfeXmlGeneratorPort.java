package com.slifesys.sagnus.nfe.application.port;

import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;

/**
 * Porta de geração de XML da NF-e (NFe 4.00).
 *
 * Nesta fase, o objetivo é gerar um XML mínimo coerente para evoluirmos:
 * - assinatura digital
 * - validação XSD
 * - envio SEFAZ
 */
public interface NfeXmlGeneratorPort {

    /**
     * @return XML como String (UTF-8)
     */
    String generateXml(Nfe nfe);
}

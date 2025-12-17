package com.slifesys.sagnus.nfe.infrastructure.gateway.corp;

import com.slifesys.sagnus.corp.api.contract.pessoa.PessoaResumoDTO;
import com.slifesys.sagnus.nfe.application.port.CorpPessoaGatewayPort;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;

import java.util.Optional;

/**
 * Fallback local para rodar o BC NFe sem o BC CORP carregado.
 *
 * - Ativo somente no profile "local"
 * - Sobe apenas se NÃO existir outro bean CorpPessoaGatewayPort.
 *
 * Importante: isso é apenas para desenvolvimento; em ambientes reais, NFe deve consumir CORP
 * via contrato (in-process) ou via HTTP/mensageria.
 */
@Component
@Profile("local")
@ConditionalOnMissingBean(CorpPessoaGatewayPort.class)
public class StubCorpPessoaGatewayAdapter implements CorpPessoaGatewayPort {

    @Override
    public Optional<PessoaResumoDTO> obterResumoPorId(Long pessoaId) {
        if (pessoaId == null) return Optional.empty();

        // Exemplos fixos (para teste end-to-end rápido)
        if (pessoaId == 1L) {
            return Optional.of(PessoaResumoDTO.builder()
                    .pessoaId(1L)
                    .tipo("J")
                    .documento("06090677000306")
                    .nome("Sagnus Emitente LTDA")
                    .build());
        }
        if (pessoaId == 2L) {
            return Optional.of(PessoaResumoDTO.builder()
                    .pessoaId(2L)
                    .tipo("F")
                    .documento("12345678909")
                    .nome("Fulano Destinatário")
                    .build());
        }

        return Optional.empty();
    }
}

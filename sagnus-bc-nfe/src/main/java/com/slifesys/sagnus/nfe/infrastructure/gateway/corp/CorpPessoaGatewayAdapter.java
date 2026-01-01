package com.slifesys.sagnus.nfe.infrastructure.gateway.corp;

import com.slifesys.sagnus.corp.api.contract.pessoa.CorpPessoaQueryPort;
import com.slifesys.sagnus.corp.api.contract.pessoa.PessoaResumoDTO;
import com.slifesys.sagnus.nfe.application.port.CorpPessoaGatewayPort;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.stereotype.Component;

import java.util.Optional;

/**
 * Adapter "in-process" para o BC CORP via contrato Java (sagnus-bc-contracts-corp).
 *
 * Este adapter só sobe se existir um bean CorpPessoaQueryPort no contexto.
 * (ex.: quando CORP está no mesmo monorepo e foi carregado na mesma aplicação)
 */
@Component
@ConditionalOnBean(CorpPessoaQueryPort.class)
public class CorpPessoaGatewayAdapter implements CorpPessoaGatewayPort {

    private final CorpPessoaQueryPort corpPessoaQueryPort;

    public CorpPessoaGatewayAdapter(CorpPessoaQueryPort corpPessoaQueryPort) {
        this.corpPessoaQueryPort = corpPessoaQueryPort;
    }

    @Override
    public Optional<PessoaResumoDTO> obterResumoPorId(Long pessoaId) {
        return corpPessoaQueryPort.obterResumoPorId(pessoaId);
    }
}

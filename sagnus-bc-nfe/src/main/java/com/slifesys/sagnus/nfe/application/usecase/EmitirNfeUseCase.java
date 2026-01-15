package com.slifesys.sagnus.nfe.application.usecase;

import com.slifesys.sagnus.corp.contract.pessoa.PessoaResumoDTO;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeCommand;
import com.slifesys.sagnus.nfe.application.port.CorpPessoaGatewayPort;
import com.slifesys.sagnus.nfe.application.port.DomainEventPublisher;
import com.slifesys.sagnus.nfe.application.port.NfeRepository;
import com.slifesys.sagnus.nfe.application.result.EmitirNfeResult;
import com.slifesys.sagnus.nfe.application.service.NfeAssembler;
import com.slifesys.sagnus.shared.observability.CorrelationIdContext;
import com.slifesys.sagnus.nfe.domain.event.NfeEmitidaEvent;
import com.slifesys.sagnus.nfe.domain.exception.NfeDomainException;
import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;


@Service
public class EmitirNfeUseCase {

    private final NfeRepository nfeRepository;
    private final CorpPessoaGatewayPort corpPessoaGateway;
    private final NfeAssembler nfeAssembler;
    private final DomainEventPublisher eventPublisher;

    public EmitirNfeUseCase(NfeRepository nfeRepository,
                            CorpPessoaGatewayPort corpPessoaGateway,
                            NfeAssembler nfeAssembler,
                            DomainEventPublisher eventPublisher) {
        this.nfeRepository = nfeRepository;
        this.corpPessoaGateway = corpPessoaGateway;
        this.nfeAssembler = nfeAssembler;
        this.eventPublisher = eventPublisher != null ? eventPublisher : event -> {};
    }

    @Transactional
    public EmitirNfeResult execute(EmitirNfeCommand cmd) {
        validarEntrada(cmd);

        PessoaResumoDTO emitenteDto = corpPessoaGateway.obterResumoPorId(cmd.getEmitentePessoaId())
                .orElseThrow(() -> new NfeDomainException("Emitente não encontrado no CORP"));

        PessoaResumoDTO destinatarioDto = corpPessoaGateway.obterResumoPorId(cmd.getDestinatarioPessoaId())
                .orElseThrow(() -> new NfeDomainException("Destinatário não encontrado no CORP"));

        // 1, 2, 3) cria agregado, adiciona itens, normaliza tributos, etc.
        Nfe nfe = nfeAssembler.assemble(cmd, emitenteDto, destinatarioDto);

        // 3) valida e “emite” (ainda sem SEFAZ)
        nfe.validar();
        nfe.emitir();

        // 4) persiste
        Nfe saved = nfeRepository.save(nfe);

        // 5) publica evento (gera XML, auditoria, etc.)
        String cid = CorrelationIdContext.get();
        eventPublisher.publish(NfeEmitidaEvent.builder()
                .correlationId(cid)
                .nfeId(saved.getId().getValue())
                .emitentePessoaId(saved.getEmitente().getPessoaId())
                .destinatarioPessoaId(saved.getDestinatario().getPessoaId())
                .status(saved.getStatus().name())
                .build());

        return EmitirNfeResult.builder()
                .nfeId(saved.getId().getValue())
                .status(saved.getStatus().name())
                .mensagem("NFe emitida (etapa interna). Próximo passo: autorização SEFAZ.")
                .build();
    }

    private void validarEntrada(EmitirNfeCommand cmd) {
        if (cmd == null) throw new IllegalArgumentException("Command é obrigatório");
        if (cmd.getEmitentePessoaId() == null) throw new IllegalArgumentException("emitentePessoaId é obrigatório");
        if (cmd.getDestinatarioPessoaId() == null) throw new IllegalArgumentException("destinatarioPessoaId é obrigatório");
        if (cmd.getItens() == null || cmd.getItens().isEmpty())
            throw new IllegalArgumentException("A NFe deve ter ao menos 1 item");
    }


}

package com.slifesys.sagnus.nfe.application.usecase;

import com.slifesys.sagnus.corp.api.contract.pessoa.PessoaResumoDTO;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeCommand;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeItemCommand;
import com.slifesys.sagnus.nfe.application.port.CorpPessoaGatewayPort;
import com.slifesys.sagnus.nfe.application.port.NfeRepository;
import com.slifesys.sagnus.nfe.application.result.EmitirNfeResult;
import com.slifesys.sagnus.nfe.domain.exception.NfeDomainException;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Dinheiro;
import com.slifesys.sagnus.nfe.domain.model.fiscal.ProdutoFiscal;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Quantidade;
import com.slifesys.sagnus.nfe.domain.model.imposto.TributosItem;
import com.slifesys.sagnus.nfe.domain.model.nfe.Destinatario;
import com.slifesys.sagnus.nfe.domain.model.nfe.Emitente;
import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;
import com.slifesys.sagnus.nfe.domain.model.nfe.NfeItem;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class EmitirNfeUseCase {

    private final NfeRepository nfeRepository;
    private final CorpPessoaGatewayPort corpPessoaGateway;

    public EmitirNfeUseCase(NfeRepository nfeRepository, CorpPessoaGatewayPort corpPessoaGateway) {
        this.nfeRepository = nfeRepository;
        this.corpPessoaGateway = corpPessoaGateway;
    }

    public EmitirNfeResult execute(EmitirNfeCommand cmd) {
        validarEntrada(cmd);

        PessoaResumoDTO emitenteDto = corpPessoaGateway.obterResumoPorId(cmd.getEmitentePessoaId())
                .orElseThrow(() -> new NfeDomainException("Emitente não encontrado no CORP"));

        PessoaResumoDTO destinatarioDto = corpPessoaGateway.obterResumoPorId(cmd.getDestinatarioPessoaId())
                .orElseThrow(() -> new NfeDomainException("Destinatário não encontrado no CORP"));

        Emitente emitente = new Emitente(
                cmd.getEmitentePessoaId(),
                emitenteDto.getNome(),
                com.slifesys.sagnus.nfe.domain.model.nfe.DocumentoFiscal.of(emitenteDto.getDocumento())
        );

        Destinatario destinatario = new Destinatario(
                cmd.getDestinatarioPessoaId(),
                destinatarioDto.getNome(),
                com.slifesys.sagnus.nfe.domain.model.nfe.DocumentoFiscal.of(destinatarioDto.getDocumento())
        );

        // 1) cria agregado
        Nfe nfe = new Nfe(emitente, destinatario);

        // 2) adiciona itens
        for (EmitirNfeItemCommand it : cmd.getItens()) {
            NfeItem item = montarItemDominio(it);
            nfe.adicionarItem(item);
        }

        // 3) valida e “emite” (ainda sem SEFAZ)
        nfe.validar();
        nfe.emitir();

        // 4) persiste (infra implementa depois)
        Nfe saved = nfeRepository.save(nfe);

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

    private NfeItem montarItemDominio(EmitirNfeItemCommand it) {
        Objects.requireNonNull(it, "Item command é obrigatório");

        ProdutoFiscal produto = new ProdutoFiscal(
                it.getProdutoId(),
                it.getDescricao(),
                it.getNcm(),
                it.getCfop(),
                it.getUCom()
        );

        Quantidade qtd = Quantidade.of(it.getQuantidade());
        Dinheiro vUn = Dinheiro.of(it.getValorUnitario());

        Dinheiro desc = it.getDesconto() != null ? Dinheiro.of(it.getDesconto()) : Dinheiro.zero();
        Dinheiro frete = it.getFrete() != null ? Dinheiro.of(it.getFrete()) : Dinheiro.zero();
        Dinheiro seg = it.getSeguro() != null ? Dinheiro.of(it.getSeguro()) : Dinheiro.zero();
        Dinheiro out = it.getOutras() != null ? Dinheiro.of(it.getOutras()) : Dinheiro.zero();

        // Tributos ainda “placeholder” (domínio suporta; cálculo vem depois)
        TributosItem tributos = new TributosItem(null, null, null, null);

        return new NfeItem(
                it.getNItem(),
                produto,
                qtd,
                vUn,
                desc,
                frete,
                seg,
                out,
                tributos
        );
    }
}

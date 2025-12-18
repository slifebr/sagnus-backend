package com.slifesys.sagnus.nfe.application.usecase;

import com.slifesys.sagnus.corp.api.contract.pessoa.PessoaResumoDTO;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeCommand;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeItemCommand;
import com.slifesys.sagnus.nfe.application.port.CorpPessoaGatewayPort;
import com.slifesys.sagnus.nfe.application.port.NfeRepository;
import com.slifesys.sagnus.nfe.application.result.EmitirNfeResult;
import com.slifesys.sagnus.nfe.application.service.RtcIbsCbsNormalizer;
import com.slifesys.sagnus.nfe.domain.exception.NfeDomainException;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Dinheiro;
import com.slifesys.sagnus.nfe.domain.model.fiscal.ProdutoFiscal;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Quantidade;
import com.slifesys.sagnus.nfe.domain.model.imposto.TributosItem;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.CClassTrib;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.Cbs;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.CstIbsCbs;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.Ibs;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.RegimeIbsCbs;
import com.slifesys.sagnus.nfe.domain.model.nfe.Destinatario;
import com.slifesys.sagnus.nfe.domain.model.nfe.Emitente;
import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;
import com.slifesys.sagnus.nfe.domain.model.nfe.NfeItem;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Objects;
import java.util.Optional;

@Service
public class EmitirNfeUseCase {

    private final NfeRepository nfeRepository;
    private final CorpPessoaGatewayPort corpPessoaGateway;
    private final RtcIbsCbsNormalizer rtcNormalizer;

    public EmitirNfeUseCase(NfeRepository nfeRepository, CorpPessoaGatewayPort corpPessoaGateway, RtcIbsCbsNormalizer rtcNormalizer) {
        this.nfeRepository = nfeRepository;
        this.corpPessoaGateway = corpPessoaGateway;
        this.rtcNormalizer = rtcNormalizer;
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

        // 4) persiste
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

        // Tributos (legado + RTC IBS/CBS)
        TributosItem tributos = montarTributos(it);
        tributos = rtcNormalizer.normalize(tributos);

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

    /**
     * MVP de tributos: só persiste/gera IBS/CBS + CST/cClassTrib.
     * ICMS/PIS/COFINS/IPI seguem placeholders por enquanto.
     */
    private TributosItem montarTributos(EmitirNfeItemCommand it) {
        Optional<Ibs> ibs = parseIbs(it);
        Optional<Cbs> cbs = parseCbs(it);

        Optional<CstIbsCbs> cst = (it.getCstIbsCbs() == null || it.getCstIbsCbs().isBlank())
                ? Optional.empty()
                : Optional.of(new CstIbsCbs(it.getCstIbsCbs()));

        Optional<CClassTrib> cClassTrib = (it.getCClassTrib() == null || it.getCClassTrib().isBlank())
                ? Optional.empty()
                : Optional.of(new CClassTrib(it.getCClassTrib()));

        return new TributosItem(
                null, null, null, null,
                ibs,
                cbs,
                cst,
                cClassTrib
        );
    }

    private Optional<Ibs> parseIbs(EmitirNfeItemCommand it) {
        boolean any = it.getIbsBase() != null || it.getIbsAliquota() != null || it.getIbsValor() != null;
        if (!any) return Optional.empty();

        if (it.getIbsBase() == null || it.getIbsAliquota() == null || it.getIbsValor() == null) {
            throw new NfeDomainException("RTC IBS: informe base, aliquota e valor (todos)");
        }

        RegimeIbsCbs regime = parseRegime(it.getRegimeIbsCbs());

        return Optional.of(new Ibs(
                it.getIbsBase(),
                it.getIbsAliquota(),
                it.getIbsValor(),
                regime,
                Optional.empty(),
                Optional.empty()
        ));
    }

    private Optional<Cbs> parseCbs(EmitirNfeItemCommand it) {
        boolean any = it.getCbsBase() != null || it.getCbsAliquota() != null || it.getCbsValor() != null;
        if (!any) return Optional.empty();

        if (it.getCbsBase() == null || it.getCbsAliquota() == null || it.getCbsValor() == null) {
            throw new NfeDomainException("RTC CBS: informe base, aliquota e valor (todos)");
        }

        RegimeIbsCbs regime = parseRegime(it.getRegimeIbsCbs());

        return Optional.of(new Cbs(
                it.getCbsBase(),
                it.getCbsAliquota(),
                it.getCbsValor(),
                regime,
                Optional.empty()
        ));
    }

    private RegimeIbsCbs parseRegime(String regimeStr) {
        if (regimeStr == null || regimeStr.isBlank()) {
            return RegimeIbsCbs.REGULAR;
        }
        try {
            return RegimeIbsCbs.valueOf(regimeStr.trim().toUpperCase());
        } catch (IllegalArgumentException e) {
            throw new NfeDomainException("regimeIbsCbs inválido: " + regimeStr);
        }
    }

    // util (para futuras validações numéricas mais rígidas)
    @SuppressWarnings("unused")
    private static BigDecimal nvl(BigDecimal v) {
        return v != null ? v : BigDecimal.ZERO;
    }
}

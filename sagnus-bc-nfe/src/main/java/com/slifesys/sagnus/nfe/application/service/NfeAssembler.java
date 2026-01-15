package com.slifesys.sagnus.nfe.application.service;

import com.slifesys.sagnus.corp.contract.pessoa.PessoaResumoDTO;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeCommand;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeItemCommand;
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
import com.slifesys.sagnus.nfe.domain.model.nfe.DocumentoFiscal;
import com.slifesys.sagnus.nfe.domain.model.nfe.Emitente;
import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;
import com.slifesys.sagnus.nfe.domain.model.nfe.NfeItem;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Objects;
import java.util.Optional;

@Service
public class NfeAssembler {

    private final RtcIbsCbsNormalizer rtcNormalizer;

    public NfeAssembler(RtcIbsCbsNormalizer rtcNormalizer) {
        this.rtcNormalizer = rtcNormalizer;
    }

    public Nfe assemble(EmitirNfeCommand cmd, PessoaResumoDTO emitenteDto, PessoaResumoDTO destinatarioDto) {
        Emitente emitente = new Emitente(
                cmd.getEmitentePessoaId(),
                emitenteDto.getNome(),
                DocumentoFiscal.of(emitenteDto.getDocumento())
        );

        Destinatario destinatario = new Destinatario(
                cmd.getDestinatarioPessoaId(),
                destinatarioDto.getNome(),
                DocumentoFiscal.of(destinatarioDto.getDocumento())
        );

        // 1) cria agregado
        Nfe nfe = new Nfe(emitente, destinatario);

        // 2) adiciona itens
        if (cmd.getItens() != null) {
            for (EmitirNfeItemCommand it : cmd.getItens()) {
                NfeItem item = montarItemDominio(it);
                nfe.adicionarItem(item);
            }
        }

        return nfe;
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
        String itemLabel = "Item " + it.getNItem() + " (produtoId=" + it.getProdutoId() + ")";

        Optional<Ibs> ibs = parseIbs(it, itemLabel);
        Optional<Cbs> cbs = parseCbs(it, itemLabel);

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


    private Optional<Ibs> parseIbs(EmitirNfeItemCommand it, String itemLabel) {
        boolean any = it.getIbsBase() != null || it.getIbsAliquota() != null || it.getIbsValor() != null;
        if (!any) return Optional.empty();

        RtcIbsCbsNormalizer.TaxTriplet t = rtcNormalizer.normalizeTriplet(itemLabel + " IBS", it.getIbsBase(), it.getIbsAliquota(), it.getIbsValor());
        RegimeIbsCbs regime = parseRegime(it.getRegimeIbsCbs());

        return Optional.of(new Ibs(
                t.base(),
                t.aliquota(),
                t.valor(),
                regime,
                Optional.empty(),
                Optional.empty()
        ));
    }


    private Optional<Cbs> parseCbs(EmitirNfeItemCommand it, String itemLabel) {
        boolean any = it.getCbsBase() != null || it.getCbsAliquota() != null || it.getCbsValor() != null;
        if (!any) return Optional.empty();

        RtcIbsCbsNormalizer.TaxTriplet t = rtcNormalizer.normalizeTriplet(itemLabel + " CBS", it.getCbsBase(), it.getCbsAliquota(), it.getCbsValor());
        RegimeIbsCbs regime = parseRegime(it.getRegimeIbsCbs());

        return Optional.of(new Cbs(
                t.base(),
                t.aliquota(),
                t.valor(),
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
}

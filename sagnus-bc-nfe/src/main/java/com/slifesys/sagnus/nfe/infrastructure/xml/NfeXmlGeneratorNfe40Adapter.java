package com.slifesys.sagnus.nfe.infrastructure.xml;

import com.slifesys.sagnus.nfe.application.port.NfeXmlGeneratorPort;
import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;
import com.slifesys.sagnus.nfe.domain.model.nfe.NfeItem;
import com.slifesys.sagnus.nfe.domain.model.imposto.TributosItem;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Objects;

/**
 * Gerador XML mínimo NF-e 4.00 (sem assinatura, sem validação XSD nesta fase).
 */
@ConditionalOnProperty(prefix = "sagnus.nfe.xml", name = "layout", havingValue = "NFE40", matchIfMissing = true)
@Component
public class NfeXmlGeneratorNfe40Adapter implements NfeXmlGeneratorPort {

    private static final String NS = "http://www.portalfiscal.inf.br/nfe";
    private static final String VERSAO = "4.00";

    @Override
    public String generateXml(Nfe nfe) {
        StringBuilder sb = new StringBuilder(16_384);

        sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        sb.append("<nfeProc xmlns=\"http://www.portalfiscal.inf.br/nfe\" versao=\"4.00\">");
        sb.append("<NFe>");
        //sb.append("<infNFe Id=\"").append(escape(nfe.getId().getValue())).append("\" versao=\"4.00\">");
        String infNfeId = buildInfNfeId(nfe);
        sb.append("<infNFe Id=\"").append(escape(infNfeId)).append("\" versao=\"4.00\">");

        // ======= Itens =======
        int idx = 1;
        for (NfeItem it : nfe.getItens()) {
            sb.append("<det nItem=\"").append(idx++).append("\">");
            TributosItem trib = it.getTributos();
            sb.append("<prod>");

            sb.append("<cProd>").append(escape(fmtLongToStr(it.getProduto().getProdutoId()))).append("</cProd>");
            sb.append("<xProd>").append(escape(it.getProduto().getDescricao())).append("</xProd>");
            sb.append("<NCM>").append(escape(it.getProduto().getNcm())).append("</NCM>");
            sb.append("<CFOP>").append(escape(it.getProduto().getCfop())).append("</CFOP>");
            sb.append("<uCom>").append(escape(it.getProduto().getUCom())).append("</uCom>");

            sb.append("<qCom>").append(fmt(it.getQuantidade().getValor())).append("</qCom>");
            sb.append("<vUnCom>").append(fmt(it.getValorUnitario().getValor())).append("</vUnCom>");

            var vProd = it.getQuantidade().getValor().multiply(it.getValorUnitario().getValor());
            sb.append("<vProd>").append(fmt(vProd)).append("</vProd>");

            var desc = it.getDesconto() != null ? it.getDesconto().getValor() : BigDecimal.ZERO;
            var frete = it.getFrete() != null ? it.getFrete().getValor() : BigDecimal.ZERO;
            var seg = it.getSeguro() != null ? it.getSeguro().getValor() : BigDecimal.ZERO;
            var outro = it.getOutras() != null ? it.getOutras().getValor() : BigDecimal.ZERO;

            if (desc.compareTo(BigDecimal.ZERO) > 0) sb.append("<vDesc>").append(fmt(desc)).append("</vDesc>");
            if (frete.compareTo(BigDecimal.ZERO) > 0) sb.append("<vFrete>").append(fmt(frete)).append("</vFrete>");
            if (seg.compareTo(BigDecimal.ZERO) > 0) sb.append("<vSeg>").append(fmt(seg)).append("</vSeg>");
            if (outro.compareTo(BigDecimal.ZERO) > 0) sb.append("<vOutro>").append(fmt(outro)).append("</vOutro>");

            String infAdProd = buildInfAdProdRtc(trib);
            if (!infAdProd.isBlank()) sb.append("<infAdProd>").append(escape(infAdProd)).append("</infAdProd>");

            sb.append("</prod>");

            // ======= Impostos =======
            sb.append("<imposto>");
            sb.append("<vTotTrib>").append(fmt(calcVTotTrib(trib))).append("</vTotTrib>");
            String rtcExtra = buildRtcExtraGroups(trib);
            if (!rtcExtra.isBlank()) {
                sb.append(rtcExtra);
            }
            sb.append("</imposto>");

            sb.append("</det>");
        }

        sb.append("</infNFe>");
        sb.append("</NFe>");
        sb.append("</nfeProc>");

        return sb.toString();
    }
    private static String buildInfNfeId(Nfe nfe) {
        // Se vier do domínio/persistência, usa; senão gera um temporário
        String id = null;
        if (nfe != null && nfe.getId() != null && nfe.getId().getValue() != null) {
            id = nfe.getId().getValue().trim();
            if (id.isBlank()) id = null;
        }

        if (id == null) {
            // temporário estável o suficiente para testes/rascunho
            id =  "TEMP" + System.currentTimeMillis();
        }

        // O atributo Id em infNFe normalmente vem com prefixo "NFe"
        if (!id.startsWith("NFe")) {
            id = "NFe" + id;
        }
        return id;
    }


    private static String safe(String v) { return v == null ? "" : v; }

    private static String onlyDigits(String v) {
        if (v == null) return "";
        return v.replaceAll("\\D+", "");
    }

    private static String fmt(BigDecimal v) {
        if (v == null) return "0.00";
        return v.setScale(2, RoundingMode.HALF_UP).toPlainString();
    }


    private static String fmtAliq(BigDecimal v) {
        if (v == null) return "0.0000";
        return v.setScale(4, RoundingMode.HALF_UP).toPlainString();
    }

    private static BigDecimal calcVTotTrib(TributosItem trib) {
        if (trib == null) return BigDecimal.ZERO;

        BigDecimal total = BigDecimal.ZERO;

        if (trib.getIbs() != null && trib.getIbs().isPresent()) {
            total = total.add(trib.getIbs().get().valor());
        }
        if (trib.getCbs() != null && trib.getCbs().isPresent()) {
            total = total.add(trib.getCbs().get().valor());
        }

        // (MVP) aqui pode somar ICMS/PIS/COFINS/IPI quando o adapter fiscal legado for ligado
        return total;
    }

    /**
     * Grupo RTC IBS/CBS dentro de <imposto>.
     *
     * Mapeamento inicial (enxuto):
     * - CST: usa o valor do domínio, ou default "000"
     * - cClassTrib: usa o valor do domínio, ou default CST+"000" (ex.: "000000")
     *
     * OBS: este grupo é da adequação RTC; em ambientes que não validem XSD RTC,
     * você pode habilitar via feature flag.
     */
    protected static String buildIbsCbsGroup(TributosItem trib) {
        if (trib == null) return "";

        boolean hasIbs = trib.getIbs() != null && trib.getIbs().isPresent();
        boolean hasCbs = trib.getCbs() != null && trib.getCbs().isPresent();
        if (!hasIbs && !hasCbs) return "";

        String cst = trib.getCstIbsCbs().map(v -> v.getValor()).orElse("000");
        String cClassTrib = trib.getCClassTrib().map(v -> v.getValor()).orElse(cst + "000");

        StringBuilder sb = new StringBuilder(256);
        sb.append("<IBSCBS>");
        sb.append("<CST>").append(cst).append("</CST>");
        sb.append("<cClassTrib>").append(cClassTrib).append("</cClassTrib>");

        if (hasIbs) {
            var ibs = trib.getIbs().get();
            sb.append("<vBC>").append(fmt(ibs.base())).append("</vBC>");
            sb.append("<pIBS>").append(fmtAliq(ibs.aliquota())).append("</pIBS>");
            sb.append("<vIBS>").append(fmt(ibs.valor())).append("</vIBS>");
        }

        if (hasCbs) {
            var cbs = trib.getCbs().get();
            if (!hasIbs) {
                sb.append("<vBC>").append(fmt(cbs.base())).append("</vBC>");
            }
            sb.append("<pCBS>").append(fmtAliq(cbs.aliquota())).append("</pCBS>");
            sb.append("<vCBS>").append(fmt(cbs.valor())).append("</vCBS>");
        }

        sb.append("</IBSCBS>");
        return sb.toString();
    }


    /**
     * Hook: em layout NFE40 não emitimos tags RTC (para manter XSD NF-e 4.00 "puro").
     * Subclasses (RTC2025) podem sobrescrever para emitir grupos adicionais.
     */
    protected String buildRtcExtraGroups(TributosItem trib) {
        return "";
    }

    /**
     * Em layout NFE40, transportamos IBS/CBS em infAdProd (schema-safe, 500 chars) para não quebrar validação.
     * Em RTC2025, normalmente não é necessário (pois os grupos próprios são emitidos).
     */
    protected String buildInfAdProdRtc(TributosItem trib) {
        if (trib == null) return "";
        boolean hasIbs = trib.getIbs() != null && trib.getIbs().isPresent();
        boolean hasCbs = trib.getCbs() != null && trib.getCbs().isPresent();
        if (!hasIbs && !hasCbs) return "";

        StringBuilder sb = new StringBuilder(160);
        sb.append("RTC:");
        if (hasIbs) {
            var ibs = trib.getIbs().get();
            sb.append("IBS[bc=").append(fmt(ibs.base()))
              .append(";p=").append(fmtAliq(ibs.aliquota()))
              .append(";v=").append(fmt(ibs.valor())).append("]");
        }
        if (hasCbs) {
            if (hasIbs) sb.append(";");
            var cbs = trib.getCbs().get();
            sb.append("CBS[bc=").append(fmt(cbs.base()))
              .append(";p=").append(fmtAliq(cbs.aliquota()))
              .append(";v=").append(fmt(cbs.valor())).append("]");
        }

        String s = sb.toString();
        return s.length() <= 500 ? s : s.substring(0, 500);
    }

    private static String fmtLongToStr(Long v) {
        if (v == null) return "0";
        return v.toString();
    }
    
    private static String escape(String v) {
        if (v == null) return "";
        return v.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&apos;");
    }
}

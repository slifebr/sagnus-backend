package com.slifesys.sagnus.nfe.infrastructure.xml;

import com.slifesys.sagnus.nfe.application.port.NfeXmlGeneratorPort;
import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;
import com.slifesys.sagnus.nfe.domain.model.nfe.NfeItem;
import com.slifesys.sagnus.nfe.domain.model.imposto.TributosItem;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
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
        sb.append("<infNFe Id=\"").append(escape(nfe.getId().getValue())).append("\" versao=\"4.00\">");

        // ======= Itens =======
        int idx = 1;
        for (NfeItem it : nfe.getItens()) {
            sb.append("<det nItem=\"").append(idx++).append("\">");
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

            var desc = it.getDesconto().getValor();
            var frete = it.getFrete().getValor();
            var seg = it.getSeguro().getValor();
            var outro = it.getOutras().getValor();

            if (desc.compareTo(BigDecimal.ZERO) > 0) sb.append("<vDesc>").append(fmt(desc)).append("</vDesc>");
            if (frete.compareTo(BigDecimal.ZERO) > 0) sb.append("<vFrete>").append(fmt(frete)).append("</vFrete>");
            if (seg.compareTo(BigDecimal.ZERO) > 0) sb.append("<vSeg>").append(fmt(seg)).append("</vSeg>");
            if (outro.compareTo(BigDecimal.ZERO) > 0) sb.append("<vOutro>").append(fmt(outro)).append("</vOutro>");

            sb.append("</prod>");

            // ======= Impostos =======
            TributosItem trib = it.getTributos();
            sb.append("<imposto>");
            sb.append("<vTotTrib>").append(fmt(calcVTotTrib(trib))).append("</vTotTrib>");
            String ibsCbsGroup = buildIbsCbsGroup(trib);
            if (!ibsCbsGroup.isBlank()) {
                sb.append(ibsCbsGroup);
            }
            sb.append("</imposto>");

            sb.append("</det>");
        }

        sb.append("</infNFe>");
        sb.append("</NFe>");
        sb.append("</nfeProc>");

        return sb.toString();
    }

    //@Override
    public String generateXmlOld(Nfe nfe) {
        Objects.requireNonNull(nfe, "Nfe é obrigatória");

        String nfeId = safe(nfe.getId().getValue());

        StringBuilder sb = new StringBuilder(8192);
        sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        sb.append("<NFe xmlns=\"").append(NS).append("\">");
        sb.append("<infNFe versao=\"").append(VERSAO).append("\" Id=\"").append(escape("NFe" + nfeId)).append("\">");

        sb.append("<ide>");
        sb.append("<cUF>").append("35").append("</cUF>");
        sb.append("<natOp>").append(escape("VENDA")).append("</natOp>");
        sb.append("<mod>").append("55").append("</mod>");
        sb.append("<serie>").append("1").append("</serie>");
        sb.append("<nNF>").append("1").append("</nNF>");
        sb.append("<tpNF>").append("1").append("</tpNF>");
        sb.append("<idDest>").append("1").append("</idDest>");
        sb.append("<tpAmb>").append("2").append("</tpAmb>");
        sb.append("<finNFe>").append("1").append("</finNFe>");
        sb.append("</ide>");

        sb.append("<emit>");
        sb.append("<xNome>").append(escape(nfe.getEmitente().getNome())).append("</xNome>");
        String docEmit = onlyDigits(nfe.getEmitente().getDocumento().getValor());
        if (docEmit.length() == 14) sb.append("<CNPJ>").append(docEmit).append("</CNPJ>");
        else sb.append("<CPF>").append(docEmit).append("</CPF>");
        sb.append("</emit>");

        sb.append("<dest>");
        sb.append("<xNome>").append(escape(nfe.getDestinatario().getNome())).append("</xNome>");
        String docDest = onlyDigits(nfe.getDestinatario().getDocumento().getValor());
        if (docDest.length() == 14) sb.append("<CNPJ>").append(docDest).append("</CNPJ>");
        else sb.append("<CPF>").append(docDest).append("</CPF>");
        sb.append("</dest>");

        BigDecimal vProdTotal = BigDecimal.ZERO;
        BigDecimal vDescTotal = BigDecimal.ZERO;
        BigDecimal vFreteTotal = BigDecimal.ZERO;
        BigDecimal vSegTotal = BigDecimal.ZERO;
        BigDecimal vOutroTotal = BigDecimal.ZERO;

        for (NfeItem it : nfe.getItens()) {

            sb.append("<det nItem=\"").append(it.getNItem()).append("\">");

            sb.append("<prod>");

            sb.append("<cProd>").append(escape(fmtLongToStr(it.getProduto().getProdutoId()))).append("</cProd>");
            sb.append("<xProd>").append(escape(it.getProduto().getDescricao())).append("</xProd>");
            sb.append("<NCM>").append(escape(it.getProduto().getNcm())).append("</NCM>");
            sb.append("<CFOP>").append(escape(it.getProduto().getCfop())).append("</CFOP>");
            sb.append("<uCom>").append(escape(it.getProduto().getUCom())).append("</uCom>");

            sb.append("<qCom>").append(fmt(it.getQuantidade().getValor())).append("</qCom>");
            sb.append("<vUnCom>").append(fmt(it.getValorUnitario().getValor())).append("</vUnCom>");

            BigDecimal vProd = it.getQuantidade().getValor().multiply(it.getValorUnitario().getValor());
            sb.append("<vProd>").append(fmt(vProd)).append("</vProd>");

            BigDecimal desc  = it.getDesconto() != null ? it.getDesconto().getValor() : BigDecimal.ZERO;
            BigDecimal frete = it.getFrete()   != null ? it.getFrete().getValor()   : BigDecimal.ZERO;
            BigDecimal seg   = it.getSeguro()  != null ? it.getSeguro().getValor()  : BigDecimal.ZERO;
            BigDecimal outro = it.getOutras()  != null ? it.getOutras().getValor()  : BigDecimal.ZERO;

            if (desc.signum()  > 0) sb.append("<vDesc>").append(fmt(desc)).append("</vDesc>");
            if (frete.signum() > 0) sb.append("<vFrete>").append(fmt(frete)).append("</vFrete>");
            if (seg.signum()   > 0) sb.append("<vSeg>").append(fmt(seg)).append("</vSeg>");
            if (outro.signum() > 0) sb.append("<vOutro>").append(fmt(outro)).append("</vOutro>");

            sb.append("</prod>");

            // depois a gente pluga <imposto> aqui (ICMS/PIS/COFINS/IPI e IBS/CBS no futuro)

            sb.append("</det>");
        }
        
        sb.append("<total><ICMSTot>");
        sb.append("<vProd>").append(fmt(vProdTotal)).append("</vProd>");
        sb.append("<vDesc>").append(fmt(vDescTotal)).append("</vDesc>");
        sb.append("<vFrete>").append(fmt(vFreteTotal)).append("</vFrete>");
        sb.append("<vSeg>").append(fmt(vSegTotal)).append("</vSeg>");
        sb.append("<vOutro>").append(fmt(vOutroTotal)).append("</vOutro>");
        BigDecimal vNF = vProdTotal.subtract(vDescTotal).add(vFreteTotal).add(vSegTotal).add(vOutroTotal);
        sb.append("<vNF>").append(fmt(vNF)).append("</vNF>");
        sb.append("</ICMSTot></total>");

        sb.append("</infNFe>");
        sb.append("</NFe>");
        return sb.toString();
    }

    private static String safe(String v) { return v == null ? "" : v; }

    private static String onlyDigits(String v) {
        if (v == null) return "";
        return v.replaceAll("\\D+", "");
    }

    private static String fmt(BigDecimal v) {
        if (v == null) return "0.00";
        return v.setScale(2, BigDecimal.ROUND_HALF_UP).toPlainString();
    }


    private static String fmtAliq(BigDecimal v) {
        if (v == null) return "0.0000";
        return v.setScale(4, BigDecimal.ROUND_HALF_UP).toPlainString();
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
    private static String buildIbsCbsGroup(TributosItem trib) {
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

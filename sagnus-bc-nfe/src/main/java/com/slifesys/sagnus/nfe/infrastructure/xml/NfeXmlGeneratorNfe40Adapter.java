package com.slifesys.sagnus.nfe.infrastructure.xml;

import com.slifesys.sagnus.nfe.application.port.NfeXmlGeneratorPort;
import com.slifesys.sagnus.nfe.domain.model.nfe.Nfe;
import com.slifesys.sagnus.nfe.domain.model.nfe.NfeItem;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Objects;

/**
 * Gerador XML mínimo NF-e 4.00 (sem assinatura, sem validação XSD nesta fase).
 */
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

            var desc = it.getDesconto() != null ? it.getDesconto().getValor() : BigDecimal.ZERO;
            var frete = it.getFrete() != null ? it.getFrete().getValor() : BigDecimal.ZERO;
            var seg = it.getSeguro() != null ? it.getSeguro().getValor() : BigDecimal.ZERO;
            var outro = it.getOutras() != null ? it.getOutras().getValor() : BigDecimal.ZERO;

            if (desc.compareTo(BigDecimal.ZERO) > 0) sb.append("<vDesc>").append(fmt(desc)).append("</vDesc>");
            if (frete.compareTo(BigDecimal.ZERO) > 0) sb.append("<vFrete>").append(fmt(frete)).append("</vFrete>");
            if (seg.compareTo(BigDecimal.ZERO) > 0) sb.append("<vSeg>").append(fmt(seg)).append("</vSeg>");
            if (outro.compareTo(BigDecimal.ZERO) > 0) sb.append("<vOutro>").append(fmt(outro)).append("</vOutro>");

            sb.append("</prod>");

            // aqui entra <imposto> depois que você ligar o pacote fiscal v2
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

/*
        for (NfeItem it : nfe.getItens()) {
            sb.append("<det nItem=\"").append(it.getNItem()).append("\">");
            sb.append("<prod>");
            sb.append("<cProd>").append(it.getProduto().getProdutoId()).append("</cProd>");
            sb.append("<xProd>").append(escape(it.getProduto().getDescricao())).append("</xProd>");
            sb.append("<NCM>").append(escape(it.getProduto().getNcm())).append("</NCM>");
            sb.append("<CFOP>").append(escape(it.getProduto().getCfop())).append("</CFOP>");
            sb.append("<uCom>").append(escape(it.getProduto().getUCom())).append("</uCom>");
            sb.append("<qCom>").append(fmt(it.getQuantidade().getValor())).append("</qCom>");
            sb.append("<vUnCom>").append(fmt(it.getValorUnitario().getValor())).append("</vUnCom>");

            BigDecimal vProd = it.getQuantidade().getValor().multiply(it.getValorUnitario().getValor());
            sb.append("<vProd>").append(fmt(vProd)).append("</vProd>");

            BigDecimal desc = it.getDesconto() != null ? it.getDesconto().getValor() : BigDecimal.ZERO;
            BigDecimal frete = it.getFrete() != null ? it.getFrete().getValor() : BigDecimal.ZERO;
            BigDecimal seg = it.getSeguro() != null ? it.getSeguro().getValor() : BigDecimal.ZERO;
            BigDecimal outro = it.getOutras() != null ? it.getOutras().getValor() : BigDecimal.ZERO;

            sb.append("<vDesc>").append(fmt(desc)).append("</vDesc>");
            if (frete.compareTo(BigDecimal.ZERO) > 0) sb.append("<vFrete>").append(fmt(frete)).append("</vFrete>");
            if (seg.compareTo(BigDecimal.ZERO) > 0) sb.append("<vSeg>").append(fmt(seg)).append("</vSeg>");
            if (outro.compareTo(BigDecimal.ZERO) > 0) sb.append("<vOutro>").append(fmt(outro)).append("</vOutro>");
            sb.append("</prod>");
            sb.append("<imposto><vTotTrib>0.00</vTotTrib></imposto>");
            sb.append("</det>");

            vProdTotal = vProdTotal.add(vProd);
            vDescTotal = vDescTotal.add(desc);
            vFreteTotal = vFreteTotal.add(frete);
            vSegTotal = vSegTotal.add(seg);
            vOutroTotal = vOutroTotal.add(outro);
        }
*/
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

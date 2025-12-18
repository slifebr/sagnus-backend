package com.slifesys.sagnus.nfe.xml;

import com.slifesys.sagnus.nfe.domain.model.fiscal.Dinheiro;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Percentual;
import com.slifesys.sagnus.nfe.domain.model.fiscal.ProdutoFiscal;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Quantidade;
import com.slifesys.sagnus.nfe.domain.model.imposto.*;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.*;
import com.slifesys.sagnus.nfe.domain.model.nfe.*;
import com.slifesys.sagnus.nfe.infrastructure.xml.NfeXmlGeneratorRtc2025Adapter;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class NfeXmlGeneratorRtc2025AdapterIbsCbsTest {

    @Test
    void deveEmitirGrupoIBSCBSNoRtc() {
        var emit = new Emitente(1l, "Emitente LTDA", DocumentoFiscal.of("12345678000199"));
        var dest = new Destinatario(2l, "Cliente SA", DocumentoFiscal.of("99887766000155"));

        var produto = new ProdutoFiscal(10L, "Produto X", "12345678", "5102", "UN");

        var icms = new Icms("00", Percentual.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO));
        var pis = new Pis("01", Percentual.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO));
        var cofins = new Cofins("01", Percentual.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO));
        var ipi = new Ipi("50", Percentual.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO));

        var ibs = new Ibs(new BigDecimal("100.00"), new BigDecimal("0.1000"), new BigDecimal("0.10"),
                RegimeIbsCbs.REGULAR, Optional.empty(), Optional.empty());
        var cbs = new Cbs(new BigDecimal("100.00"), new BigDecimal("0.9000"), new BigDecimal("0.90"),
                RegimeIbsCbs.REGULAR, Optional.empty());

        var trib = new TributosItem(
                icms, pis, cofins, ipi,
                Optional.of(ibs), Optional.of(cbs),
                Optional.of(new CstIbsCbs("000")),
                Optional.of(new CClassTrib("000000"))
        );

        var item = new NfeItem(1,
                                produto,
                                Quantidade.of(new BigDecimal("1")),
                                Dinheiro.of(new BigDecimal("100.00")),
                                Dinheiro.zero(), Dinheiro.zero(), Dinheiro.zero(), Dinheiro.zero(),
                                trib);

        var nfe = new Nfe(emit, dest);
        nfe.adicionarItem(item);

        var adapter = new NfeXmlGeneratorRtc2025Adapter();
        String xml = adapter.generateXml(nfe);

        assertTrue(xml.contains("<IBSCBS>"), "RTC deve conter o grupo IBSCBS");
        assertTrue(xml.contains("<CST>000</CST>"), "RTC deve conter CST");
        assertTrue(xml.contains("<cClassTrib>000000</cClassTrib>"), "RTC deve conter cClassTrib");
        assertTrue(xml.contains("<vIBS>0.10</vIBS>"), "RTC deve conter vIBS");
        assertTrue(xml.contains("<vCBS>0.90</vCBS>"), "RTC deve conter vCBS");
        assertFalse(xml.contains("<infAdProd>RTC:"), "RTC não deve duplicar IBS/CBS em infAdProd");
    }
}
